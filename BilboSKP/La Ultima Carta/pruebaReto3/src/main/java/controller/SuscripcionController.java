package controller;

import service.SuscripcionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/gestionarSuscripcion")
public class SuscripcionController extends HttpServlet {

    private SuscripcionService suscripcionService;

    public SuscripcionController() {
        this.suscripcionService = new SuscripcionService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
            suscripcionService.gestionarSuscripcion(usuarioId);
            response.getWriter().write("Suscripción gestionada con éxito");
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

