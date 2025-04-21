package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.UsuarioDTO;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
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
		String exito = request.getParameter("exito");
	    if ("true".equals(exito)) {
	        request.setAttribute("exito", true);
	    }
		request.getRequestDispatcher("registroindividual.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        UsuarioDTO dto = new UsuarioDTO();
        dto.setNombre(request.getParameter("nombre"));
        dto.setApellidos(request.getParameter("apellidos"));
        dto.setDni(request.getParameter("dni"));
        dto.setCorreo(request.getParameter("correo"));
        dto.setContrasena(request.getParameter("contrasena"));
        dto.setRepetirContrasena(request.getParameter("repetirContrasena"));
        dto.setTelefono(request.getParameter("telefono"));

        try {
            Usuario u = usuarioService.validarYCrearUsuario(dto, RolEnum.USUARIO);
            request.getSession().setAttribute("usuarioTemporal", u);

            try {
                StripeService stripe = new StripeService();
                Session stripeSession = stripe.crearSesionDePago();
                response.sendRedirect(stripeSession.getUrl());
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("registro?error=errorPago");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registro?exito=false");
        }
    }
}
