package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.RankingClaseDAO;
import com.bilbaoSKP.laultimacarta.dao.RankingResetDAO;
import com.bilbaoSKP.laultimacarta.dao.ResultadoPartidaDAO;
import com.bilbaoSKP.laultimacarta.model.RankingClase;
import com.bilbaoSKP.laultimacarta.model.RankingReset;
import com.bilbaoSKP.laultimacarta.model.ResultadoPartida;

public class RankingService {
    
    private RankingClaseDAO rankingClaseDAO;
    private ResultadoPartidaDAO resultadoPartidaDAO;
    private RankingResetDAO rankingResetDAO;
    
    public RankingService() {
        rankingClaseDAO = new RankingClaseDAO();
        resultadoPartidaDAO = new ResultadoPartidaDAO();
        rankingResetDAO = new RankingResetDAO();
    }
    
    public boolean procesarResultadoPartida(ResultadoPartida resultado) {
        Connection con = null;
        boolean exito = false;
        
        try {
            con = AccesoBD.getConnection();
            con.setAutoCommit(false);
            
            // Calcular la puntuación
            resultado.calcularPuntuacion();
            
            // Guardar el resultado
            int resultadoId = resultadoPartidaDAO.guardarResultado(resultado, con);
            
            if (resultadoId > 0 && resultado.getClaseId() > 0 && resultado.getCentroEscolarId() > 0) {
                // Actualizar el ranking de la clase
                exito = rankingClaseDAO.actualizarPuntuacionClase(
                    resultado.getClaseId(), 
                    resultado.getCentroEscolarId(), 
                    resultado.getPuntuacion(),
                    con
                );
                
                if (exito) {
                    con.commit();
                } else {
                    con.rollback();
                }
            } else if (resultadoId > 0) {
                // Si no está asociado a una clase, solo guardamos el resultado
                exito = true;
                con.commit();
            } else {
                con.rollback();
            }
        } catch (Exception e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exito;
    }
    
    public List<RankingClase> obtenerRankingPorCentro(int centroEscolarId) {
        return rankingClaseDAO.obtenerRankingPorCentro(centroEscolarId);
    }
    
    public boolean reiniciarRanking(int usuarioId) {
        Connection con = null;
        boolean exito = false;
        
        try {
            con = AccesoBD.getConnection();
            con.setAutoCommit(false);
            
            // Reiniciar todas las puntuaciones a 0
            boolean resetExitoso = rankingClaseDAO.reiniciarRanking(con);
            
            // Crear entradas para nuevas clases
            boolean nuevasClasesExitoso = rankingClaseDAO.crearEntradasParaNuevasClases(con);
            
            // Registrar el reset
            RankingReset reset = new RankingReset();
            reset.setTipo("manual");
            reset.setUsuarioId(usuarioId);
            
            int resetId = rankingResetDAO.registrarReset(reset, con);
            
            if (resetExitoso && nuevasClasesExitoso && resetId > 0) {
                con.commit();
                exito = true;
            } else {
                con.rollback();
            }
        } catch (Exception e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exito;
    }
    
    public boolean verificarYReiniciarAutomatico() {
        LocalDate hoy = LocalDate.now();
        
        // Verificar si es 1 de septiembre
        if (hoy.getMonthValue() == 9 && hoy.getDayOfMonth() == 1) {
            // Verificar si ya se ha realizado un reset automático hoy
            RankingReset ultimoReset = rankingResetDAO.obtenerUltimoReset();
            
            if (ultimoReset != null) {
                LocalDate fechaUltimoReset = ultimoReset.getFechaReset().toLocalDate();
                
                // Si ya se hizo un reset hoy, no hacer nada
                if (fechaUltimoReset.equals(hoy)) {
                    return true;
                }
            }
            
            // Realizar reset automático
            Connection con = null;
            boolean exito = false;
            
            try {
                con = AccesoBD.getConnection();
                con.setAutoCommit(false);
                
                // Reiniciar todas las puntuaciones a 0
                boolean resetExitoso = rankingClaseDAO.reiniciarRanking(con);
                
                // Crear entradas para nuevas clases
                boolean nuevasClasesExitoso = rankingClaseDAO.crearEntradasParaNuevasClases(con);
                
                // Registrar el reset
                RankingReset reset = new RankingReset();
                reset.setTipo("automatico");
                
                int resetId = rankingResetDAO.registrarReset(reset, con);
                
                if (resetExitoso && nuevasClasesExitoso && resetId > 0) {
                    con.commit();
                    exito = true;
                } else {
                    con.rollback();
                }
            } catch (Exception e) {
                try {
                    if (con != null) {
                        con.rollback();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                e.printStackTrace();
            } finally {
                try {
                    if (con != null) {
                        con.setAutoCommit(true);
                        con.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            return exito;
        }
        
        return true; // No es 1 de septiembre, no hay que hacer nada
    }
}