package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;

public class UsuarioDAO {

	public boolean existeUsuario(Usuario u) {
		Connection con = AccesoBD.getConnection();
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

	public Usuario getUsuario(LoginUsuarioDTO usuarioDTO) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Usuario u = null;
		
		try {
			String sql = "SELECT u.id, u.nombre, u.rol_id, s.id, s.suscripcion_tipo_id, s.estado "
					+ "FROM usuario u "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
					+ "WHERE u.correo = ? AND u.contraseña = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getCorreo());
			ps.setString(2, usuarioDTO.getContrasena());
			rs = ps.executeQuery();
			if(rs.next()) {
				u = new Usuario();
				Rol r = new Rol();
				Suscripcion s = new Suscripcion();
				TipoSuscripcion ts = new TipoSuscripcion();
				
				u.setId(rs.getInt("u.id"));
				u.setNombre(rs.getString("u.nombre"));
				r.setId(rs.getInt("u.rol_id"));
				u.setRol(r);
				ts.setId(rs.getInt("s.suscripcion_tipo_id"));
				s.setTipoSuscripcion(ts);
				s.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("s.estado")));
				u.setSuscripcion(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		return u;
	}

}
