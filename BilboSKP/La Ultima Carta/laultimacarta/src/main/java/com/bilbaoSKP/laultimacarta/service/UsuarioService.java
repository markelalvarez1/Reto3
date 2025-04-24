package com.bilbaoSKP.laultimacarta.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.UsuarioDAO;
import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.dto.RegistroDTO;
import com.bilbaoSKP.laultimacarta.dto.CentroDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.model.enums.TipoSuscripcionEnum;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;

public class UsuarioService {
	UsuarioDAO usuarioDAO;
	SuscripcionService suscripcionService;
	CentroEscolarService centroEscolarService;
	CuponService cuponService;
	EmailService emailService;

	public UsuarioService() {
		super();
		usuarioDAO = new UsuarioDAO();
		suscripcionService = new SuscripcionService();
		centroEscolarService = new CentroEscolarService();
		cuponService = new CuponService();
		emailService = new EmailService();
	}

	public Session iniciarRegistro(RegistroDTO dto) throws Exception {
		if (!validarDatos(dto)) {
			throw new Exception("datos incorrectos");
		}

		TipoSuscripcion ts = suscripcionService.getTipoSuscripcionByID(dto.getTipoSuscripcionID());
		if (ts == null) {
			throw new Exception("Suscripción incorrecto");
		}

		if (ts.getPrecio() > 0) {
			StripeService stripe = new StripeService();
			Long precio = Math.round(ts.getPrecio() * 100);
			Session sesion = stripe.crearSesionDePago(ts, precio);
			return sesion;
		}

		return null;
	}

	public boolean finalizarRegistro(RegistroDTO dto) {
		Connection con = null;
		try {
			con = AccesoBD.getConnection();

			con.setAutoCommit(false);
			int usuarioId = usuarioDAO.registrarUsuario(dto.getUsuarioDTO(), con);
			if (usuarioId == 0) {
				con.rollback();
				return false;
			}

			Suscripcion s = Suscripcion.nuevaSuscripcion(dto.getTipoSuscripcionID());
			int suscripcionID = suscripcionService.registrarSuscripcion(usuarioId, s, con);
			if (suscripcionID == 0) {
				con.rollback();
				return false;
			}

			if(dto.getCentroDTO() != null) {
				if(!centroEscolarService.registrarCentroEscolar(usuarioId, dto.getCentroDTO(), con)) {
					con.rollback();
					return false;
				}
			}
			
			if (Integer.valueOf(dto.getUsuarioDTO().getRolID()) == RolEnum.USUARIO.getCodigo()) {
				if (!emailService.enviarCorreoVerificacion(suscripcionID, dto.getUsuarioDTO(), s.getCodigoAcceso())) {
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

	private boolean validarDatos(RegistroDTO dto) {
		if (!validarContrasena(dto.getUsuarioDTO().getContrasena(), dto.getUsuarioDTO().getRepetirContrasena())) {
			return false;
		}
		if (existeUsuario(dto.getUsuarioDTO())) {
			return false;
		}
		if (dto.getCentroDTO() != null) {
			if (centroEscolarService.existeCentro(dto.getCentroDTO())) {
				return false;
			}
		}
		return true;
	}

	public boolean existeUsuario(UsuarioDTO usuarioDTO) {
		// TODO Auto-generated method stub
		return usuarioDAO.existeUsuario(usuarioDTO);
	}

	private boolean validarContrasena(String contrasena, String repetirContrasena) {
		return contrasena.equals(repetirContrasena);
	}

	public Usuario getUsuario(LoginUsuarioDTO usuarioDTO) throws Exception {
		Usuario u = usuarioDAO.getUsuario(usuarioDTO);
		if (!EstadoSuscripcionEnum.ACTIVA.equals(u.getSuscripcion().getEstado())) {
			throw new Exception("Suscripcion no activa");
		}

		return u;
	}

	public Usuario getUsuarioByID(String idUsuario) {
		// TODO Auto-generated method stub
		return usuarioDAO.getUsuarioByID(idUsuario);
	}

	public ArrayList<Usuario> getAllUsuarios() {
		// TODO Auto-generated method stub
		return usuarioDAO.getAllUsuarios();
	}

}
