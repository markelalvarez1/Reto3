package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.UsuarioDAO;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class UsuarioService {
	UsuarioDAO usuarioDAO;
	SuscripcionService suscripcionService;
	CuponService cuponService;
	EmailService emailService;

	public UsuarioService() {
		super();
		usuarioDAO = new UsuarioDAO();
		suscripcionService = new SuscripcionService();
		cuponService = new CuponService();
		emailService = new EmailService();
	}

	public boolean registrarUsuario(HttpServletRequest request, HttpServletResponse response) {
		String rol = request.getParameter("rol");
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String dni = request.getParameter("dni");
		String correo = request.getParameter("correo");
		String contrasena = request.getParameter("contrasena");
		String telefono = request.getParameter("telefono");

		if (!validarCampos(rol, nombre, apellidos, dni, correo, contrasena, telefono)) {
			return false;
		}

		Usuario u = new Usuario();
		Rol r = new Rol();
		u.setNombre(nombre);
		u.setApellidos(apellidos);
		u.setDni(dni);
		u.setTelefono(Integer.parseInt(telefono));
		u.setCorreo(correo);
		u.setContrasena(contrasena);
		r.setId(Integer.parseInt(rol));
		u.setRol(r);

		Connection con = null;
		try {
			con = AccesoBD.getConnection();

			con.setAutoCommit(false);
			if (usuarioDAO.existeUsuario(u, con)) {
				con.rollback();
				return false;
			}

			int usuarioId = usuarioDAO.registrarUsuario(u, con);
			if (usuarioId == 0) {
				con.rollback();
				return false;
			}
			u.setId(usuarioId);

			int suscripcionId = suscripcionService.crearSuscripcion(u, con);
			if (suscripcionId == 0) {
				con.rollback();
				return false;
			}
			Suscripcion s = new Suscripcion();
			s.setId(suscripcionId);
			
			if(u.getRol().getId() == 2) {
				if(!emailService.enviarCorreoVerificacion(u)) {
					con.rollback();
					return false;
				}
			}

			con.commit();
		} catch (Exception e) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}	
			}
			e.printStackTrace();
			return false;
		} finally {
			if (con != null) {
	            try {
	                con.setAutoCommit(true);
	                AccesoBD.closeConnection(null, null, con);
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
		}
		return true;
	}

	private boolean validarCampos(String... strings) {
		for (String campo : strings) {
			if (campo.isEmpty()) {
				return false;
			}
		}
		return true;
	}

}
