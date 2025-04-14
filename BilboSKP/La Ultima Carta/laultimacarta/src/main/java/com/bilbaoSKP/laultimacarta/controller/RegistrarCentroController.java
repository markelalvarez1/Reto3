package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.RegistroCentroDTO;
import com.bilbaoSKP.laultimacarta.dto.RegistroUsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.service.CentroEscolarService;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;

@WebServlet("/registroCentro")
public class RegistrarCentroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
	CentroEscolarService centroEscolarservice;
       
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			usuarioService = new UsuarioService();
			centroEscolarservice = new CentroEscolarService();
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("registrocentro.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RegistroUsuarioDTO dto = new RegistroUsuarioDTO();
	    dto.setNombre(request.getParameter("nombre"));
	    dto.setApellidos(request.getParameter("apellidos"));
	    dto.setDni(request.getParameter("dni"));
	    dto.setCorreo(request.getParameter("correo"));
	    dto.setContrasena(request.getParameter("contrasena"));
	    dto.setRepetirContrasena(request.getParameter("repetirContrasena"));
	    dto.setTelefono(request.getParameter("telefono"));
		
		RegistroCentroDTO dtoCentro = new RegistroCentroDTO();
		dtoCentro.setCIF(request.getParameter("cif"));
		dtoCentro.setNombre(request.getParameter("nombreCentro"));
		dtoCentro.setCorreo(request.getParameter("correoCentro"));
		dtoCentro.setCiudad(request.getParameter("ciudad"));
		dtoCentro.setNumeroAlumnos(request.getParameter("numeroAlumnos"));
		dtoCentro.setTelefono(request.getParameter("telefonoCentro"));
		dtoCentro.setEtapaEducativa(request.getParameter("etapaEducativa"));
		
		try {
			Responsable r = (Responsable) usuarioService.validarYCrearUsuario(dto, RolEnum.RESPONSABLE);
			CentroEscolar c = centroEscolarservice.validarYCrearCentro(dtoCentro);
			r.setCentroEscolar(c);
			if(usuarioService.registrarCentro(r)) {
				response.sendRedirect("registroCentro?exito=true");
			} else {
				response.sendRedirect("registroCentro?exito=false");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("registroCentro?exito=false");
		}
		
		
	}

}
