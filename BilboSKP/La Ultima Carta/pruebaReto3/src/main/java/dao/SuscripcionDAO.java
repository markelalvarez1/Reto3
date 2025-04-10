package dao;
import model.Suscripcion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SuscripcionDAO {

    public Suscripcion consultarSuscripcion(int usuarioId, Connection conexion) throws SQLException {
        String sql = "SELECT * FROM suscripcion WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setInt(1, usuarioId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Suscripcion(
                        rs.getInt("usuario_id"),
                        rs.getString("tipo_suscripcion"),
                        rs.getString("codigoacceso")
                );
            }
        }
        return null;
    }

    public void crearSuscripcion(Suscripcion suscripcion, Connection conexion) throws SQLException {
        String sql = "INSERT INTO suscripcion (usuario_id, estado, tipo_suscripcion, codigoacceso, fechaInicio) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, suscripcion.getUsuarioId());
            ps.setString(2, suscripcion.getEstado());
            ps.setString(3, suscripcion.getTipoSuscripcion());
            ps.setString(4, suscripcion.getCodigoAcceso());
            ps.setDate(5, java.sql.Date.valueOf(suscripcion.getFechaInicio()));

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                suscripcion.setId(rs.getInt(1));
            }
        }
    }

    public void cambiarEstadoSuscripcion(int usuarioId, String estado, Connection conexion) throws SQLException {
        String sql = "UPDATE suscripcion SET estado = ? WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, estado);
            ps.setInt(2, usuarioId);
            ps.executeUpdate();
        }
    }
}
