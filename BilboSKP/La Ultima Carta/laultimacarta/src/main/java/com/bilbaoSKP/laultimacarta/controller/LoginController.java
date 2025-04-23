package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;


@WebServlet("/inicioSesion")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginUsuarioDTO usuarioDTO;
	UsuarioService usuarioService;
       
	public void init(ServletConfig config) throws ServletException {
		usuarioDTO = new LoginUsuarioDTO();
		usuarioService = new UsuarioService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("iniciosesionindividual.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		usuarioDTO.setCorreo(request.getParameter("correo"));
		usuarioDTO.setContrasena(request.getParameter("contrasena"));
		
		try {
			Usuario u = usuarioService.getUsuario(usuarioDTO);
			if (u != null) {
				HttpSession session = request.getSession();
				session.setAttribute("usuario", u);
				
				// Verificar si hay una URL solicitada previamente
				String urlSolicitada = (String) session.getAttribute("urlSolicitada");
				if (urlSolicitada != null) {
					session.removeAttribute("urlSolicitada");
					response.sendRedirect(urlSolicitada);
				} else {
					// Redirigir a la página principal
					response.sendRedirect("inicio");
				}
			} else {
				// Login fallido
				request.setAttribute("error", "Correo o contraseña incorrectos");
				request.getRequestDispatcher("iniciosesionindividual.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error al iniciar sesión: " + e.getMessage());
			request.getRequestDispatcher("iniciosesionindividual.jsp").forward(request, response);
		}
	}
}