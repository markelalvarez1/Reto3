package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.dto.RegistroDTO;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;

@WebServlet("/pagoExitoso")
public class PagoExitosoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UsuarioService usuarioService;   
   
    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	usuarioService = new UsuarioService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegistroDTO dto = (RegistroDTO) request.getSession().getAttribute("registroDTO");
		
		if (dto == null) {
			response.sendRedirect("registro?error=sesionCaducada");
			return;
		}
		
		if (usuarioService.finalizarRegistro(dto)) {
			request.getSession().removeAttribute("registroDTO");
			response.sendRedirect("registro?exito=true");
		} else {
			response.sendRedirect("registro?error=falloRegistro");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}