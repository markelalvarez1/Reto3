package com.bilbaoSKP.laultimacarta.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.UsuarioDAO;
import com.bilbaoSKP.laultimacarta.dto.RegistroCentroDTO;
import com.bilbaoSKP.laultimacarta.dto.RegistroUsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;

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

	public boolean registrarUsuario(Usuario u) throws IOException {
		
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

			Suscripcion s = suscripcionService.crearSuscripcion(u, con);
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

	public boolean registrarCentro(Responsable r) throws IOException {

		Connection con = null;
		try {
			con = AccesoBD.getConnection();
			con.setAutoCommit(false);

			int idUsuario = usuarioDAO.registrarUsuario(r, con);
			if (idUsuario == 0) {
				con.rollback();
				return false;
			}
			r.setId(idUsuario);

			if (!centroEscolarService.registrarCentroEscolar(r, con)) {
				con.rollback();
				return false;
			}

			Suscripcion s = suscripcionService.crearSuscripcion(r, con);
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
	
	private Usuario crearUsuario(String nombre, String apellidos, String dni, String correo,
			String contrasena, String telefono, RolEnum rol) {
		
		Usuario u = null;
		if(rol.getCodigo() == 2) {
			u = new Usuario();
		}else {
			u = new Responsable();
		}
		
		Rol r = new Rol();
		u.setNombre(nombre);
		u.setApellidos(apellidos);
		u.setDni(dni);
		u.setTelefono(Integer.parseInt(telefono));
		u.setCorreo(correo);
		u.setContrasena(contrasena);
		r.setId(rol.getCodigo());
		u.setRol(r);
		return u;
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

	private boolean validarContrasena(String contrasena, String repetirContrasena) {
		if(!contrasena.equals(repetirContrasena)) {
			return false;
		}
		return true;
	}

	
	public Usuario validarYCrearUsuario(RegistroUsuarioDTO dto, RolEnum rol) throws Exception {
	
	  if (!validarCampos(dto.getNombre(), dto.getApellidos(), dto.getDni(),
	                dto.getCorreo(), dto.getContrasena(), dto.getRepetirContrasena(), dto.getTelefono())) {
	            throw new Exception("datoIncorrecto");
	        }
	        
	  if (!validarContrasena(dto.getContrasena(), dto.getRepetirContrasena())) {
	        	throw new Exception("contrasenaIncorrecta");
	        }
	        
	  if (!validarTelefono(dto.getTelefono())) {
	        	throw new Exception("telefonoIncorrecto");
	        }

	  Usuario u = crearUsuario(dto.getNombre(), dto.getApellidos(), dto.getDni(),
	                dto.getCorreo(), dto.getContrasena(), dto.getTelefono(), rol);
	       
	        
	  if (existeUsuario(u)) {
	       	throw new Exception("usuarioExiste");
	     }
	        
	    return u;
	 }
}
