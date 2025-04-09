package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class SuscripcionDAO {

	public int crearSuscripcion(Usuario u, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			String sql = "INSERT INTO suscripcion (usuario_id, fechaInicio, estado, codigoacceso, suscripcion_tipo_id) "
					+ "VALUES (?, ?, ?, ?, ?)";
			Suscripcion s = Suscripcion.nuevaSuscripcion();
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, u.getId());
			ps.setDate(2, Date.valueOf(s.getFechaInicio()));
			ps.setString(3, s.getEstado());
			ps.setInt(4, s.getCodigoAcceso());
			ps.setInt(5, 1);
			
			ps.execute();
			rs = ps.getGeneratedKeys();
			if(rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return id;
	}

}
