package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;

public class UsuarioDAO {

	public boolean existeUsuario(UsuarioDTO usuarioDTO) {
		Connection con = AccesoBD.getConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {
			String sql = "SELECT u.dni, u.correo " + "FROM usuario u " + "WHERE u.dni = ? OR u.correo = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getDni());
			ps.setString(2, usuarioDTO.getCorreo());

			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, null);
		}
		return false;
	}

	public int registrarUsuario(UsuarioDTO usuarioDTO, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;

		try {
			String sql = "INSERT INTO usuario (nombre, apellidos, dni, correo, contraseña, telefono, rol_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, usuarioDTO.getNombre());
			ps.setString(2, usuarioDTO.getApellidos());
			ps.setString(3, usuarioDTO.getDni());
			ps.setString(4, usuarioDTO.getCorreo());
			ps.setString(5, usuarioDTO.getContrasena());
			ps.setInt(6, Integer.parseInt(usuarioDTO.getTelefono()));
			ps.setInt(7, Integer.parseInt(usuarioDTO.getRolID()));

			ps.execute();
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			String sql = "SELECT u.id, u.nombre, u.rol_id, s.id, s.suscripcion_tipo_id, s.estado " + "FROM usuario u "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id " + "WHERE u.correo = ? AND u.contraseña = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getCorreo());
			ps.setString(2, usuarioDTO.getContrasena());
			rs = ps.executeQuery();
			if (rs.next()) {
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

	public Usuario getUsuarioByID(String idUsuario) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Usuario u = null;
		try {
			String sql = "SELECT u.id, u.nombre, u.rol_id, s.id, s.suscripcion_tipo_id, s.estado " + "FROM usuario u "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id " + "WHERE u.id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, idUsuario);
			rs = ps.executeQuery();
			if (rs.next()) {
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

	public ArrayList<Usuario> getAllUsuarios() {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Usuario> listaUsuarios = new ArrayList<Usuario>();
		try {
			String sql = "SELECT "
					+ "u.id AS uid, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, u.contraseña, u.rol_id, "
					+ "s.id AS sid, s.fechaInicio, s.estado, "
					+ "r.id AS rid, r.tipo " + "FROM usuario u " + "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
					+ "LEFT JOIN rol r ON u.rol_id = r.id " + "ORDER BY s.fechaInicio DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("uid"));
				usuario.setDni(rs.getString("dni"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellidos(rs.getString("apellidos"));
				usuario.setTelefono(rs.getInt("telefono"));
				usuario.setCorreo(rs.getString("correo"));
				usuario.setContrasena(rs.getString("contraseña"));

				Rol rol = new Rol();
				rol.setId(rs.getInt("rid"));
				rol.setTipo(rs.getString("tipo"));
				usuario.setRol(rol);

				Suscripcion suscripcion = new Suscripcion();
				suscripcion.setId(rs.getInt("sid"));
				suscripcion.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
				suscripcion.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("estado")));
				usuario.setSuscripcion(suscripcion);

				listaUsuarios.add(usuario);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		return listaUsuarios;
	}

}
