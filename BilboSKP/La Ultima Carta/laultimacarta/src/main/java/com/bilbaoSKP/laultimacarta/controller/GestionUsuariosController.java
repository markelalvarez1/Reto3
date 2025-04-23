package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;
import com.bilbaoSKP.laultimacarta.service.UsuarioService;

/**
 * Servlet implementation class GestionUsuariosController
 */
@WebServlet("/gestionUsuarios")
public class GestionUsuariosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UsuarioService usuarioService; 
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			usuarioService = new UsuarioService();
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Usuario> listaUsuarios = usuarioService.getAllUsuarios();
		int usuariosTotal = listaUsuarios.size();
		int usuariosActivos = obtenerActivos(listaUsuarios);
		int usuariosPendientes = obtenerPendientes(listaUsuarios);
		int usuariosCancelados = obtenerCancelados(listaUsuarios);
		
		request.setAttribute("usuariosTotal", usuariosTotal);
		request.setAttribute("usuariosActivos", usuariosActivos);
		request.setAttribute("usuariosPendientes", usuariosPendientes);
		request.setAttribute("usuariosCancelados", usuariosCancelados);
	
		request.setAttribute("listaUsuarios", listaUsuarios);
		request.setAttribute("paginaActiva", "gestionUsuarios");
		request.getRequestDispatcher("gestionUsuarios.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	private int obtenerCancelados(ArrayList<Usuario> listaUsuarios) {
		int usuarios = 0;
		for(Usuario u : listaUsuarios) {
			if(u.getSuscripcion().getEstado() == EstadoSuscripcionEnum.CANCELADA) {
				usuarios++;
			}
		}
		return usuarios;
	}

	private int obtenerPendientes(ArrayList<Usuario> listaUsuarios) {
		int usuarios = 0;
		for(Usuario u : listaUsuarios) {
			if(u.getSuscripcion().getEstado() == EstadoSuscripcionEnum.PENDIENTE) {
				usuarios++;
			}
		}
		return usuarios;
	}

	private int obtenerActivos(ArrayList<Usuario> listaUsuarios) {
		int usuarios = 0;
		for(Usuario u : listaUsuarios) {
			if(u.getSuscripcion().getEstado() == EstadoSuscripcionEnum.ACTIVA) {
				usuarios++;
			}
		}
		return usuarios;
	}
}
