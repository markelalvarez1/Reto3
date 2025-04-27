package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;

/**
 * Servlet implementation class EdicionUsuarioController
 */
@WebServlet("/edicionUsuario")
public class EdicionUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
 
	public void init(ServletConfig config) throws ServletException {
		usuarioService = new UsuarioService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Usuario u = usuarioService.getUsuarioByID(id);
		if (u instanceof Responsable) {
		    Responsable r = (Responsable) u;
		    System.out.println(r.getCentroEscolar().getCIF());
		    request.setAttribute("usuarioEditar", r);
		} else {
			request.setAttribute("usuarioEditar", u);
		}
		
		request.getRequestDispatcher("private/edicionUsuario.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
