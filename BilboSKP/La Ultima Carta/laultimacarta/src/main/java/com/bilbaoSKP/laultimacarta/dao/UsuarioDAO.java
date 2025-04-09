package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.Usuario;

public class UsuarioDAO {

	public boolean existeUsuario(Usuario u, Connection conexion) {
		Connection con = conexion;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "SELECT u.dni, u.correo "
					+ "FROM usuario u "
					+ "WHERE u.dni = ? OR u.correo = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getDni());
			ps.setString(2, u.getCorreo());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return false;
	}

	public int registrarUsuario(Usuario u, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		
		try {
			String sql = "INSERT INTO usuario (nombre, apellidos, dni, correo, contraseña, telefono, rol_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, u.getNombre());
			ps.setString(2, u.getApellidos());
			ps.setString(3, u.getDni());
			ps.setString(4, u.getCorreo());
			ps.setString(5, u.getContrasena());
			ps.setInt(6, u.getTelefono());
			ps.setInt(7, u.getRol().getId());
			
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
