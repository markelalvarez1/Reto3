package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.service.RankingService;

@WebServlet("/reiniciarRanking")
public class ReiniciarRankingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RankingService rankingService;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        rankingService = new RankingService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Verificar que el usuario está autenticado
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        
        if (usuario == null) {
            // Guardar la URL solicitada para redirigir después del login
            session.setAttribute("urlSolicitada", "reiniciarRanking");
            response.sendRedirect("inicioSesion");
            return;
        }
        
        // Verificar si el usuario es administrador
        if (usuario.getRol().getId() != RolEnum.ADMINISTRADOR.getCodigo()) {
            request.setAttribute("error", "No tienes permisos suficientes para reiniciar el ranking.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        
        // Mostrar la página de confirmación
        request.getRequestDispatcher("confirmarReinicioRanking.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Verificar que el usuario está autenticado
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        
        if (usuario == null) {
            response.sendRedirect("inicioSesion");
            return;
        }
        
        // Verificar si el usuario es administrador
        if (usuario.getRol().getId() != RolEnum.ADMINISTRADOR.getCodigo()) {
            request.setAttribute("error", "No tienes permisos suficientes para reiniciar el ranking.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        
        // Confirmar el reinicio
        String confirmar = request.getParameter("confirmar");
        
        if ("si".equals(confirmar)) {
            boolean exito = rankingService.reiniciarRanking(usuario.getId());
            
            if (exito) {
                request.setAttribute("mensaje", "El ranking ha sido reiniciado correctamente");
            } else {
                request.setAttribute("error", "Error al reiniciar el ranking");
            }
        }
        
        // Redirigir a la página de ranking
        response.sendRedirect("ranking?tipo=clases");
    }
}