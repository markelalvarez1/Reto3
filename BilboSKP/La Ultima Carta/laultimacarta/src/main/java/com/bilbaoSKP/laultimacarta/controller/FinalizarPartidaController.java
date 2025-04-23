package com.bilbaoSKP.laultimacarta.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilbaoSKP.laultimacarta.model.ResultadoPartida;
import com.bilbaoSKP.laultimacarta.service.RankingService;

@WebServlet("/finalizarPartida")
public class FinalizarPartidaController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RankingService rankingService;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        rankingService = new RankingService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Este método no debería ser accesible directamente
        response.sendRedirect("inicio");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener datos de la partida finalizada
            int partidaId = Integer.parseInt(request.getParameter("partidaId"));
            int aciertos = Integer.parseInt(request.getParameter("aciertos"));
            int pistasUsadas = Integer.parseInt(request.getParameter("pistasUsadas"));
            int tiempoSegundos = Integer.parseInt(request.getParameter("tiempoSegundos"));
            
            // Crear objeto de resultado
            ResultadoPartida resultado = new ResultadoPartida();
            resultado.setPartidaId(partidaId);
            resultado.setAciertos(aciertos);
            resultado.setPistasUsadas(pistasUsadas);
            resultado.setTiempoSegundos(tiempoSegundos);
            
            // Asociar a clase si está disponible
            String claseIdStr = request.getParameter("claseId");
            String centroIdStr = request.getParameter("centroEscolarId");
            
            if (claseIdStr != null && !claseIdStr.isEmpty() && centroIdStr != null && !centroIdStr.isEmpty()) {
                int claseId = Integer.parseInt(claseIdStr);
                int centroId = Integer.parseInt(centroIdStr);
                resultado.setClaseId(claseId);
                resultado.setCentroEscolarId(centroId);
            }
            
            // Procesar el resultado y actualizar el ranking
            boolean exito = rankingService.procesarResultadoPartida(resultado);
            
            if (exito) {
                request.setAttribute("mensaje", "Partida finalizada correctamente. Puntuación: " + resultado.getPuntuacion());
                request.getRequestDispatcher("resultadoPartida.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Error al procesar el resultado de la partida");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar la partida: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
