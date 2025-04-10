package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bilbaoSKP.laultimacarta.model.CentroEscolar;

public class CentroEscolarDAO {

	public boolean crearCentroEscolar(CentroEscolar c, int idUsuario, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		
		try {
			String sql = "INSERT INTO centroescolar(cif, nombre, telefono, correo, numeroAlumnos, id_usuario) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, c.getCIF());
			ps.setString(2, c.getNombre());
			ps.setInt(3, c.getTelefono());
			ps.setString(4, c.getCorreo());
			ps.setInt(5, c.getNumeroAlumnos());
			ps.setInt(6, idUsuario);
			
			if(ps.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(null, ps, null);
		}
		
		return false;
	}

}
