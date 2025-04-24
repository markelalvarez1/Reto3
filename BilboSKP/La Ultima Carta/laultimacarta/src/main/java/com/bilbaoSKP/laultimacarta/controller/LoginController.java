package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.dto.LoginUsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.CodificadorService;
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
		usuarioDTO.setRecuerdame(request.getParameter("recuerdame"));
		try {
			Usuario u = usuarioService.getUsuario(usuarioDTO);
			if (u != null) {

				request.getSession().setAttribute("usuario", u);
				if(usuarioDTO.getRecuerdame() != null) {
					String idCodificado = CodificadorService.codificar(String.valueOf(u.getId()));
					Cookie c = new Cookie("usuario", idCodificado);
					c.setMaxAge(60*60*24*30);
					response.addCookie(c);
				}
				response.sendRedirect("inicio");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error al iniciar sesión: " + e.getMessage());
			request.getRequestDispatcher("iniciosesionindividual.jsp").forward(request, response);
		}
	}
}