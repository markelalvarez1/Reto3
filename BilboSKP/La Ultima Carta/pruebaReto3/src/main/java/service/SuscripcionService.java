package service;

import dao.SuscripcionDAO;
import model.Suscripcion;
import dao.AccesoBD;

import java.sql.Connection;
import java.sql.SQLException;

public class SuscripcionService {

    private SuscripcionDAO suscripcionDAO;

    public SuscripcionService() {
        this.suscripcionDAO = new SuscripcionDAO();
    }

    public void gestionarSuscripcion(int usuarioId) throws SQLException {
        try (Connection conexion = AccesoBD.getConnection()) {
            Suscripcion suscripcion = suscripcionDAO.consultarSuscripcion(usuarioId, conexion);

            if (suscripcion == null) {
                // Crear nueva suscripción
                suscripcion = new Suscripcion(usuarioId, "tipoDefault", "COD" + usuarioId);
                suscripcionDAO.crearSuscripcion(suscripcion, conexion);
                System.out.println("Suscripción creada y cupón de bienvenida asignado.");
            } else if ("pendiente".equalsIgnoreCase(suscripcion.getEstado())) {
                // Cambiar estado a activo
                suscripcionDAO.cambiarEstadoSuscripcion(usuarioId, "activo", conexion);
                System.out.println("Suscripción activada.");
            } else {
                System.out.println("La suscripción ya está activa.");
            }
        }
    }
}
