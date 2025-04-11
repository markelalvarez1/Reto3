package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.Responsable;
import com.bilbaoSKP.laultimacarta.model.Rol;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.StripeService;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;
import com.stripe.model.checkout.Session;


@WebServlet("/registro")
public class RegistroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		usuarioService = new UsuarioService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("registroindividual.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario u = verificarUsuario(request, response);
		
		if (usuarioService.existeUsuario(u)) {
			response.sendRedirect("registro");
			return;
		}
		
		if (u != null) {
			request.getSession().setAttribute("usuarioTemporal", u);
			request.getSession().setAttribute("tipoSuscripcion", request.getParameter("tipoSuscripcion"));
			
			try {
				StripeService stripe = new StripeService();
				Session stripeSession = stripe.crearSesionDePago();  // Puedes pasar aquí info de tipoSuscripcion si lo necesitas
				response.sendRedirect(stripeSession.getUrl());
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("resgistro?error=stripeError");
			}
		} else {
			response.sendRedirect("registro?error=1");
		}
		
		
	}

	private Usuario verificarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String dni = request.getParameter("dni");
		String correo = request.getParameter("correo");
		String contrasena = request.getParameter("contrasena");
		String telefono = request.getParameter("telefono");
		String rol = request.getParameter("rol");

		if (!validarCampos(nombre, apellidos, dni, correo, contrasena, telefono)) {
			response.sendRedirect("registro");
		}

		if (!validarTelefono(telefono)) {
			response.sendRedirect("registro");
		}

		Usuario u = crearUsuario(rol, nombre, apellidos, dni, correo, contrasena, telefono);
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
}
