package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.CentroDTO;
import com.bilbaoSKP.laultimacarta.dto.RegistroDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.model.enums.TipoSuscripcionEnum;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;
import com.stripe.model.checkout.Session;

@WebServlet("/nuevoRegistroController")
public class NuevoRegistroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UsuarioService usuarioService;
	
	public void init(ServletConfig config) throws ServletException {
		usuarioService = new UsuarioService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegistroDTO dto = new RegistroDTO();
		int tipoSuscripcionID = Integer.parseInt(request.getParameter("tipoSuscripcion"));
		UsuarioDTO usuarioDTO = new UsuarioDTO();
		CentroDTO dtoCentro = null;
		usuarioDTO.setNombre(request.getParameter("nombre"));
		usuarioDTO.setApellidos(request.getParameter("apellidos"));
		usuarioDTO.setDni(request.getParameter("dni"));
		usuarioDTO.setCorreo(request.getParameter("correo"));
		usuarioDTO.setContrasena(request.getParameter("contrasena"));
		usuarioDTO.setRepetirContrasena(request.getParameter("repetirContrasena"));
		usuarioDTO.setTelefono(request.getParameter("telefono"));
		usuarioDTO.setRolID(String.valueOf(RolEnum.USUARIO.getCodigo()));
		
		dto.setTipoSuscripcionID(tipoSuscripcionID);
		dto.setUsuarioDTO(usuarioDTO);
		
		if(TipoSuscripcionEnum.GRATUITA.getCodigo() == tipoSuscripcionID) {
			dtoCentro = new CentroDTO();
			dtoCentro.setCIF(request.getParameter("cif"));
			dtoCentro.setNombre(request.getParameter("nombreCentro"));
			dtoCentro.setCorreo(request.getParameter("correoCentro"));
			dtoCentro.setCiudad(request.getParameter("ciudad"));
			dtoCentro.setNumeroAlumnos(request.getParameter("numeroAlumnos"));
			dtoCentro.setTelefono(request.getParameter("telefonoCentro"));
			dtoCentro.setEtapaEducativa(request.getParameter("etapaEducativa"));
			dto.getUsuarioDTO().setRolID(String.valueOf(RolEnum.RESPONSABLE.getCodigo()));
			dto.setCentroDTO(dtoCentro);
		}
		try {
			Session stripeSesion = usuarioService.iniciarRegistro(dto);
			if(stripeSesion != null) {
				request.getSession().setAttribute("registroDTO", dto);
				response.sendRedirect(stripeSesion.getUrl());
			} else {
				if(usuarioService.finalizarRegistro(dto)) {
					response.sendRedirect("registroCentro?exito=true");
				} else {
					response.sendRedirect("registroCentro?exito=false");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
