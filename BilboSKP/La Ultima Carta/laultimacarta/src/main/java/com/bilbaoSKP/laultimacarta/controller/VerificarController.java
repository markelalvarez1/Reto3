package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.service.SuscripcionService;

@WebServlet("/verificar")
public class VerificarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SuscripcionService suscripcionService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		suscripcionService = new SuscripcionService();
		super.init(config);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codigo");
		if(codigo == null || codigo.isBlank()) {
			request.getRequestDispatcher("verificar.jsp?exito=false").forward(request, response);
		}
		
		try {
			if(suscripcionService.activarSuscripcion(codigo)) {
				request.getRequestDispatcher("verificar.jsp?exito=true").forward(request, response);
			} else {
				request.getRequestDispatcher("verificar.jsp?exito=false").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("verificar.jsp?exito=false").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
