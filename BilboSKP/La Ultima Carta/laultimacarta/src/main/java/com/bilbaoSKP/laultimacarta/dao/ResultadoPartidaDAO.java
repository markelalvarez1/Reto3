package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.bilbaoSKP.laultimacarta.model.ResultadoPartida;

public class ResultadoPartidaDAO {
    
    public int guardarResultado(ResultadoPartida resultado, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        
        try {
            String sql = "INSERT INTO resultado_partida (partida_id, aciertos, pistas_usadas, tiempo_segundos, puntuacion, clase_id, centro_escolar_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, resultado.getPartidaId());
            ps.setInt(2, resultado.getAciertos());
            ps.setInt(3, resultado.getPistasUsadas());
            ps.setInt(4, resultado.getTiempoSegundos());
            ps.setInt(5, resultado.getPuntuacion());
            
            // Si no está asociado a una clase, estos valores pueden ser null
            if (resultado.getClaseId() > 0) {
                ps.setInt(6, resultado.getClaseId());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            
            if (resultado.getCentroEscolarId() > 0) {
                ps.setInt(7, resultado.getCentroEscolarId());
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return id;
    }
    
    public ResultadoPartida obtenerResultadoPorPartidaId(int partidaId) {
        Connection con = AccesoBD.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultadoPartida resultado = null;
        
        try {
            String sql = "SELECT * FROM resultado_partida WHERE partida_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, partidaId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                resultado = new ResultadoPartida();
                resultado.setId(rs.getInt("id"));
                resultado.setPartidaId(rs.getInt("partida_id"));
                resultado.setAciertos(rs.getInt("aciertos"));
                resultado.setPistasUsadas(rs.getInt("pistas_usadas"));
                resultado.setTiempoSegundos(rs.getInt("tiempo_segundos"));
                resultado.setPuntuacion(rs.getInt("puntuacion"));
                
                // Estos campos pueden ser null
                if (rs.getObject("clase_id") != null) {
                    resultado.setClaseId(rs.getInt("clase_id"));
                }
                
                if (rs.getObject("centro_escolar_id") != null) {
                    resultado.setCentroEscolarId(rs.getInt("centro_escolar_id"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, con);
        }
        
        return resultado;
    }
}