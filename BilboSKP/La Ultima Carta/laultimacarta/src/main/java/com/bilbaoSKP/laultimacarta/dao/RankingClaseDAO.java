package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.model.RankingClase;

public class RankingClaseDAO {
    
    public boolean actualizarPuntuacionClase(int claseId, int centroEscolarId, int puntuacion, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean exito = false;
        
        try {
            // Primero verificamos si ya existe un registro para esta clase
            String sqlCheck = "SELECT id, puntuacion_total FROM ranking_clase WHERE clase_id = ? AND centro_escolar_id = ?";
            ps = con.prepareStatement(sqlCheck);
            ps.setInt(1, claseId);
            ps.setInt(2, centroEscolarId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                // Ya existe, actualizamos la puntuación
                int idRanking = rs.getInt("id");
                int puntuacionActual = rs.getInt("puntuacion_total");
                int nuevaPuntuacion = puntuacionActual + puntuacion;
                
                String sqlUpdate = "UPDATE ranking_clase SET puntuacion_total = ?, fecha_actualizacion = ? WHERE id = ?";
                ps = con.prepareStatement(sqlUpdate);
                ps.setInt(1, nuevaPuntuacion);
                ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
                ps.setInt(3, idRanking);
                
                exito = ps.executeUpdate() > 0;
            } else {
                // No existe, creamos un nuevo registro
                String sqlInsert = "INSERT INTO ranking_clase (clase_id, centro_escolar_id, puntuacion_total, fecha_actualizacion) "
                        + "VALUES (?, ?, ?, ?)";
                ps = con.prepareStatement(sqlInsert);
                ps.setInt(1, claseId);
                ps.setInt(2, centroEscolarId);
                ps.setInt(3, puntuacion);
                ps.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
                
                exito = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return exito;
    }
    
    public List<RankingClase> obtenerRankingPorCentro(int centroEscolarId) {
        Connection con = AccesoBD.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<RankingClase> ranking = new ArrayList<>();
        
        try {
            String sql = "SELECT r.*, c.nombre as nombre_clase, ce.nombre as nombre_centro "
                    + "FROM ranking_clase r "
                    + "JOIN clase c ON r.clase_id = c.id "
                    + "JOIN centroEscolar ce ON r.centro_escolar_id = ce.id "
                    + "WHERE r.centro_escolar_id = ? "
                    + "ORDER BY r.puntuacion_total DESC";
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, centroEscolarId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                RankingClase rankingClase = new RankingClase();
                rankingClase.setId(rs.getInt("id"));
                rankingClase.setClaseId(rs.getInt("clase_id"));
                rankingClase.setCentroEscolarId(rs.getInt("centro_escolar_id"));
                rankingClase.setPuntuacionTotal(rs.getInt("puntuacion_total"));
                rankingClase.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion").toLocalDateTime());
                rankingClase.setNombreClase(rs.getString("nombre_clase"));
                rankingClase.setNombreCentro(rs.getString("nombre_centro"));
                
                ranking.add(rankingClase);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, con);
        }
        
        return ranking;
    }
    
    public boolean reiniciarRanking(Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        boolean exito = false;
        
        try {
            String sql = "UPDATE ranking_clase SET puntuacion_total = 0, fecha_actualizacion = ?";
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            
            exito = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(null, ps, null);
        }
        
        return exito;
    }
    
    public boolean crearEntradasParaNuevasClases(Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean exito = false;
        
        try {
            // Obtener todas las clases que no tienen entrada en el ranking
            String sql = "INSERT INTO ranking_clase (clase_id, centro_escolar_id, puntuacion_total, fecha_actualizacion) "
                    + "SELECT cc.id_clase, cc.id_centroEscolar, 0, ? "
                    + "FROM clase_centroEscolar cc "
                    + "LEFT JOIN ranking_clase rc ON cc.id_clase = rc.clase_id AND cc.id_centroEscolar = rc.centro_escolar_id "
                    + "WHERE rc.id IS NULL";
            
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            
            int filasAfectadas = ps.executeUpdate();
            exito = true; // Consideramos éxito incluso si no hay nuevas clases para añadir
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return exito;
    }
}