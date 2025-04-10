package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class SuscripcionDAO {

	public Suscripcion crearSuscripcion(Usuario u, int tipoSuscripcion, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Suscripcion s = null;
		try {
			String sql = "INSERT INTO suscripcion (usuario_id, fechaInicio, estado, codigoacceso, suscripcion_tipo_id) "
					+ "VALUES (?, ?, ?, ?, ?)";
			s = Suscripcion.nuevaSuscripcion(tipoSuscripcion);
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, u.getId());
			ps.setDate(2, Date.valueOf(s.getFechaInicio()));
			ps.setString(3, s.getEstado());
			ps.setString(4, s.getCodigoAcceso());
			ps.setInt(5, s.getTipoSuscripcionID());
			
			ps.execute();
			rs = ps.getGeneratedKeys();
			if(rs.next()) {
				s.setId(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return s;
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
		String sql ="UPDATE suscripcion set estado = 'activo' WHERE suscripcion_id AND suscripcion_codigoacceso = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, "activa");
		ps.setInt(2, suscripcionId);
		
		int filasActualizadas = ps.executeUpdate();
		exito = (filasActualizadas > 0);
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		AccesoBD.closeConnection(null, ps, null);
	}
	return exito;

}
	}
