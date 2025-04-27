package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.CuponDAO;
import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class CuponService {
    private CuponDAO cuponDAO;
    
    public CuponService() {
        this.cuponDAO = new CuponDAO();
    }
    
    public List<Cupon> obtenerCuponesPorUsuario(Usuario usuario) {
        Connection con = null;
        List<Cupon> cupones = new ArrayList<>();
        
        try {
            con = AccesoBD.getConnection();
            Suscripcion suscripcion = usuario.getSuscripcion();
            
            if (suscripcion != null) {
                cupones = cuponDAO.obtenerCuponesPorSuscripcion(suscripcion.getId(), con);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    AccesoBD.closeConnection(null, null, con);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return cupones;
    }
    
    public List<Cupon> obtenerCuponesActivosPorUsuario(Usuario usuario) {
        Connection con = null;
        List<Cupon> cupones = new ArrayList<>();
        
        try {
            con = AccesoBD.getConnection();
            Suscripcion suscripcion = usuario.getSuscripcion();
            
            if (suscripcion != null) {
                cupones = cuponDAO.obtenerCuponesActivosPorSuscripcion(suscripcion.getId(), con);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    AccesoBD.closeConnection(null, null, con);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return cupones;
    }
    
    public boolean actualizarEstadoCupon(int cuponId, String nuevoEstado) {
        Connection con = null;
        boolean exito = false;
        
        try {
            con = AccesoBD.getConnection();
            con.setAutoCommit(false);
            
            exito = cuponDAO.actualizarEstadoCupon(cuponId, nuevoEstado, con);
            
            if (exito) {
                con.commit();
            } else {
                con.rollback();
            }
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    AccesoBD.closeConnection(null, null, con);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return exito;
    }
    
    public boolean procesarCompraCupones(Usuario usuario, List<Cupon> cupones) {
        Connection conexion = null;
        boolean resultado = false;
        
        try {
            conexion = AccesoBD.getConnection();
            conexion.setAutoCommit(false);
            
            Suscripcion suscripcion = usuario.getSuscripcion();
            if (suscripcion == null || suscripcion.getId() <= 0) {
                System.out.println("Error: Suscripción inválida o con ID nulo");
                if (conexion != null) {
                    conexion.rollback();
                }
                return false;
            }
            
            // Verificar que la suscripción existe en la base de datos
            boolean suscripcionExiste = verificarSuscripcion(suscripcion.getId(), conexion);
            if (!suscripcionExiste) {
                System.out.println("Error: La suscripción con ID " + suscripcion.getId() + " no existe en la base de datos");
                conexion.rollback();
                return false;
            }
            
            // Llamar al método del DAO para añadir todos los cupones
            resultado = cuponDAO.agregarCuponesUsuario(suscripcion.getId(), cupones, conexion);
            
            if (resultado) {
                conexion.commit();
            } else {
                conexion.rollback();
            }
            
        } catch (Exception e) {
            try {
                if (conexion != null) {
                    conexion.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            resultado = false;
        } finally {
            if (conexion != null) {
                try {
                    conexion.setAutoCommit(true);
                    conexion.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return resultado;
    }

    // Método nuevo para verificar si una suscripción existe
    private boolean verificarSuscripcion(int suscripcionId, Connection conexion) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean existe = false;
        
        try {
            String sql = "SELECT id FROM suscripcion WHERE id = ?";
            ps = conexion.prepareStatement(sql);
            ps.setInt(1, suscripcionId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                existe = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return existe;
    }
    public boolean anadirCuponesToSuscripcion(Suscripcion s, Connection con) {
        return cuponDAO.anadirCuponesToSuscripcion(s, con);
    }
}
