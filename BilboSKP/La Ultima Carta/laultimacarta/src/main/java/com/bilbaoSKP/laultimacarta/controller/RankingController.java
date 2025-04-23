package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;
<<<<<<< HEAD
import java.util.List;

import javax.servlet.ServletConfig;
=======
>>>>>>> eed91d3f20a17eb28d8b6194cb32f4af5c8677e8
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;

import com.bilbaoSKP.laultimacarta.model.RankingClase;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.RolEnum;
import com.bilbaoSKP.laultimacarta.service.RankingService;

@WebServlet("/ranking")
public class RankingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RankingService rankingService;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        rankingService = new RankingService();
        
        // Verificar si es necesario un reinicio automático (1 de septiembre)
        rankingService.verificarYReiniciarAutomatico();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el tipo de ranking (nacional o clases)
        String tipo = request.getParameter("tipo");
        HttpSession session = request.getSession();
        
        // Si es ranking de clases, verificar permisos
        if ("clases".equals(tipo)) {
            // Verificar que el usuario está autenticado
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            
            if (usuario == null) {
                // Guardar la URL solicitada para redirigir después del login
                session.setAttribute("urlSolicitada", "ranking?tipo=clases");
                response.sendRedirect("inicioSesion");
                return;
            }
            
            // Verificar si el usuario es administrador
            if (usuario.getRol().getId() != RolEnum.ADMINISTRADOR.getCodigo()) {
                request.setAttribute("error", "No tienes permisos suficientes para acceder al ranking de clases.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            // El usuario es administrador, obtener datos del ranking
            List<RankingClase> ranking = rankingService.obtenerRankingPorCentro(0); // 0 para obtener todos los centros
            request.setAttribute("rankingClases", ranking);
        }
        
        // Redirigir a la página de ranking (ahora maneja ambos tipos)
        request.getRequestDispatcher("ranking.jsp").forward(request, response);
    }
}
=======

/**
 * Servlet implementation class RankingController
 */
@WebServlet("/ranking")
public class RankingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("private/ranking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
>>>>>>> eed91d3f20a17eb28d8b6194cb32f4af5c8677e8
