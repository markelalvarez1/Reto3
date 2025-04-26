package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;
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
			String sql = "INSERT INTO usuario (nombre, apellidos, dni, correo, contrasena, telefono, rol_id) "
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
			String sql = "SELECT u.id AS usuarioId, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, r.tipo AS rol, s.id AS suscripcionId, s.fechaInicio, s.estado AS suscripcionEstado, s.suscripcion_tipo_id, s.codigoVerificacion, c.id AS cuponId, c.fechaCompra, c.fechaCaducidad, c.precio AS cuponPrecio, c.estado AS cuponEstado "
					+ "FROM usuario u " 
					+ "LEFT JOIN rol r ON u.rol_id = r.id "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id "
					+ "LEFT JOIN cupon c ON c.suscripcion_id = s.id AND c.estado IN ('DISPONIBLE', 'PROGRAMADO')"
					+ "WHERE u.correo = ? AND u.contrasena = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, usuarioDTO.getCorreo());
			ps.setString(2, usuarioDTO.getContrasena());
			rs = ps.executeQuery();
			while (rs.next()) {
				if (u == null) {
					 u = new Usuario();
		                u.setId(rs.getInt("usuarioId"));
		                u.setNombre(rs.getString("nombre"));

		                Rol rol = new Rol();
		                rol.setTipo(rs.getString("rol"));
		                u.setRol(rol);

		                Suscripcion s = new Suscripcion();
		                s.setId(rs.getInt("suscripcionId"));
		                s.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
		                s.setEstado(EstadoSuscripcionEnum.fromString(rs.getString("suscripcionEstado")));

		                TipoSuscripcion ts = new TipoSuscripcion();
		                ts.setId(rs.getInt("suscripcion_tipo_id"));
		                s.setTipoSuscripcion(ts);
		                
		                s.setCupones(new ArrayList<Cupon>());
		                u.setSuscripcion(s);
				}
				Cupon c = new Cupon();
                c.setId(rs.getInt("cuponId"));
                c.setFechaCompra(rs.getDate("fechaCompra").toLocalDate());
                c.setFechaCaducidad(rs.getDate("fechaCaducidad").toLocalDate());
                c.setPrecio(rs.getDouble("cuponPrecio"));
                c.setEstadoCupon(EstadoCuponEnum.valueOf(rs.getString("cuponEstado")));
                
                u.getSuscripcion().getCupones().add(c);
				
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
					+ "u.id AS uid, u.dni, u.nombre, u.apellidos, u.telefono, u.correo, u.rol_id, "
					+ "s.id AS sid, s.fechaInicio, s.estado, " + "r.id AS rid, r.tipo " + "FROM usuario u "
					+ "LEFT JOIN suscripcion s ON s.usuario_id = u.id " + "LEFT JOIN rol r ON u.rol_id = r.id "
					+ "ORDER BY s.fechaInicio DESC";
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
