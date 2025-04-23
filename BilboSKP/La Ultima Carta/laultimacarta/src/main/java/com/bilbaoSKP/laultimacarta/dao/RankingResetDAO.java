package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.bilbaoSKP.laultimacarta.model.RankingReset;

public class RankingResetDAO {
    
    public int registrarReset(RankingReset reset, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        
        try {
            String sql = "INSERT INTO ranking_reset (fecha_reset, tipo, usuario_id) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, Timestamp.valueOf(reset.getFechaReset()));
            ps.setString(2, reset.getTipo());
            
            if (reset.getUsuarioId() > 0) {
                ps.setInt(3, reset.getUsuarioId());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
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
    
    public RankingReset obtenerUltimoReset() {
        Connection con = AccesoBD.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        RankingReset reset = null;
        
        try {
            String sql = "SELECT * FROM ranking_reset ORDER BY fecha_reset DESC LIMIT 1";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                reset = new RankingReset();
                reset.setId(rs.getInt("id"));
                reset.setFechaReset(rs.getTimestamp("fecha_reset").toLocalDateTime());
                reset.setTipo(rs.getString("tipo"));
                
                if (rs.getObject("usuario_id") != null) {
                    reset.setUsuarioId(rs.getInt("usuario_id"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, con);
        }
        
        return reset;
    }
}