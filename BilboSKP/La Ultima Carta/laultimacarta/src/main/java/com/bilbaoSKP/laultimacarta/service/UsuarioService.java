package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.UsuarioDAO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class UsuarioService {
	UsuarioDAO usuarioDAO;
	SuscripcionService suscripcionService;
	CentroEscolarService centroEscolarService;
	EmailService emailService;

	public UsuarioService() {
		super();
		usuarioDAO = new UsuarioDAO();
		suscripcionService = new SuscripcionService();
		centroEscolarService = new CentroEscolarService();
		emailService = new EmailService();
	}

	public boolean registrarUsuario(Usuario u, String tipoSuscripcion) {

		Connection con = null;
		try {
			con = AccesoBD.getConnection();

			con.setAutoCommit(false);

			int usuarioId = usuarioDAO.registrarUsuario(u, con);
			if (usuarioId == 0) {
				con.rollback();
				return false;
			}
			u.setId(usuarioId);

			int tipoSuscripcionID = Integer.parseInt(tipoSuscripcion);
			Suscripcion s = suscripcionService.crearSuscripcion(u, tipoSuscripcionID, con);
			if (s == null) {
				con.rollback();
				return false;
			}
			u.setSuscripcion(s);

			if (!emailService.enviarCorreoVerificacion(u)) {
				con.rollback();
				return false;
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

	public boolean registrarCentro(HttpServletRequest request, HttpServletResponse response) {
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String dni = request.getParameter("dni");
		String correo = request.getParameter("correo");
		String contrasena = request.getParameter("contrasena");
		String telefono = request.getParameter("telefono");
		String rol = request.getParameter("rol");
		String tipoSuscripcion = request.getParameter("tipoSuscripcion");

		String cif = request.getParameter("cif");
		String nombreCentro = request.getParameter("nombreCentro");
		String telefonoCentro = request.getParameter("telefonoCentro");
		String correoCentro = request.getParameter("correoCentro");
		String numeroAlumnos = request.getParameter("numeroAlumnos");

		// Manejamos errores por datos incorrectos del usuario
		if (!validarCampos(rol, nombre, apellidos, dni, correo, contrasena, telefono)) {
			System.out.println("Fallo datos user");
			return false;
		}
		if (!validarTelefono(telefono)) {
			return false;
		}

		// Manejamos errores por datos incorrectos del centro escolar
		if (!validarCampos(cif, nombreCentro, telefonoCentro, correoCentro, numeroAlumnos)) {
			System.out.println("Fallo datos centro");
			return false;
		}
		if (!validarTelefono(telefonoCentro)) {
			return false;
		}

		Connection con = null;
		try {
			con = AccesoBD.getConnection();
			con.setAutoCommit(false);
			
			Responsable r = (Responsable) crearUsuario(rol, nombreCentro, apellidos, dni, correoCentro, contrasena,
					telefonoCentro);

			int idUsuario = usuarioDAO.registrarUsuario(r, con);
			if (idUsuario == 0) {
				con.rollback();
				return false;
			}
			r.setId(idUsuario);

			CentroEscolar c = crearCentro(cif, nombreCentro, telefonoCentro, correoCentro, numeroAlumnos);
			if (!centroEscolarService.crearCentroEscolar(c, idUsuario, con)) {
				con.rollback();
				return false;
			}

			int tipoSuscripcionID = Integer.parseInt(tipoSuscripcion);
			Suscripcion s = suscripcionService.crearSuscripcion(r, tipoSuscripcionID, con);
			if (s == null) {
				con.rollback();
				return false;
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
	
	private Usuario crearUsuario(String rol, String nombre, String apellidos, String dni, String correo,
			String contrasena, String telefono) {
		Usuario u;
		if(Integer.parseInt(rol) == 2 ) {
			u = new Usuario();
		} else {
			u = new Responsable();
		}
		
		Rol r = new Rol();
		u.setNombre(nombre);
		u.setApellidos(apellidos);
		u.setDni(dni);
		u.setTelefono(Integer.parseInt(telefono));
		u.setCorreo(correo);
		u.setContrasena(contrasena);
		r.setId(Integer.parseInt(rol));
		u.setRol(r);
		return u;
	}

	private CentroEscolar crearCentro(String cif, String nombreCentro, String telefonoCentro, String correoCentro,
			String numeroAlumnos) {
		CentroEscolar centro = new CentroEscolar();
		centro.setCIF(cif);
		centro.setCorreo(correoCentro);
		centro.setNombre(nombreCentro);
		centro.setNumeroAlumnos(Integer.parseInt(numeroAlumnos));
		centro.setTelefono(Integer.parseInt(telefonoCentro));
		return centro;
	}

	private boolean validarTelefono(String telefono) {
		try {
			int tlf = Integer.parseInt(telefono);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	private boolean validarCampos(String... strings) {
		for (String campo : strings) {
			if (campo == null || campo.isEmpty()) {
				return false;
			}
		}
		return true;
	}

	public boolean existeUsuario(Usuario u) {
		// TODO Auto-generated method stub
		return usuarioDAO.existeUsuario(u);
	}

}
