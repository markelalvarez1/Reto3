package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

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
	
	public boolean consultarEstadoSuscripcion (int suscripcionId, String codigoAcceso, Connection conexion) {
		Connection con= conexion;
		PreparedStatement ps =null;
		ResultSet rs=null;
		return false;
		
		try {
			String sql = "SELECT suscripcion COUNT (*) = WHERE"
			
		}
		
	}

	public boolean cambiarEstadoSuscripcion(int suscripcionId, int codigoAcceso, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		boolean exito = false;

		try {
			String sql = "UPDATE suscripcion set estado = 'activo' WHERE suscripcion_id AND suscripcion_codigoacceso = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "activa");
			ps.setInt(2, suscripcionId);

			int filasActualizadas = ps.executeUpdate();
			exito = (filasActualizadas > 0);

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
}
