package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.CentroDTO;
import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
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
		
	}

}
