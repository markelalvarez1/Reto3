package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;

public class SuscripcionDAO {

	public int registrarSuscripcion(int usuarioId, Suscripcion s, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int suscripcionID = 0;
		try {
			String sql = "INSERT INTO suscripcion (usuario_id, fechaInicio, estado, codigoacceso, suscripcion_tipo_id) "
					+ "VALUES (?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, usuarioId);
			ps.setDate(2, Date.valueOf(s.getFechaInicio()));
			ps.setString(3, s.getEstado().name());
			ps.setString(4, s.getCodigoAcceso());
			ps.setInt(5, s.getTipoSuscripcion().getId());
			
			ps.execute();			
			rs = ps.getGeneratedKeys();
			
			if(rs.next()) {
				suscripcionID = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return suscripcionID;
	}
	
	public boolean updateEstadoSuscripcion(Suscripcion s) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		boolean exito = false;

		try {
			String sql = "UPDATE suscripcion set estado = ? WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, s.getEstado().name());
			ps.setInt(2, s.getId());

			if(ps.executeUpdate() > 0) {
				return true;
			}else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(null, ps, null);
		}
		return exito;

	}

	public TipoSuscripcion getTipoSuscripcionByID(int tipoSuscripcionID) {
		TipoSuscripcion ts = null;
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT tipo, precio FROM suscripciontipo WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, tipoSuscripcionID);
			rs = ps.executeQuery();
			if(rs.next()) {
				ts = new TipoSuscripcion();
				ts.setId(tipoSuscripcionID);
				ts.setTipo(rs.getString("tipo"));
				ts.setPrecio(rs.getDouble("precio"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		
		return ts;
	}

	public Suscripcion getSuscripcionByID(String idSuscripcion) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Suscripcion s = null;
		try {
			String sql = "SELECT id, suscripcion_tipo_id, fechaInicio, codigoVerificacion, estado FROM suscripcion WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, idSuscripcion);
			rs = ps.executeQuery();
			if(rs.next()) {
				s = new Suscripcion();
				TipoSuscripcion ts = new TipoSuscripcion();
				s.setId(rs.getInt("id"));
				ts.setId(rs.getInt("suscripcion_tipo_id"));
				s.setTipoSuscripcion(ts);
				s.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
				s.setCodigoAcceso(rs.getString("codigoVerificacion"));
				s.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("estado")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		return s;
	}
}
