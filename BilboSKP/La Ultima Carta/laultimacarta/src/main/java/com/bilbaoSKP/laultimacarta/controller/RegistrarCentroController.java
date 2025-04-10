package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.service.UsuarioService;

/**
 * Servlet implementation class RegistrarCentroController
 */
@WebServlet("/registroCentro")
public class RegistrarCentroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
       
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			usuarioService = new UsuarioService();
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(usuarioService.registrarCentro(request, response)) {
			response.sendRedirect("Index.jsp");
		} else {
			
		}
	}

}
