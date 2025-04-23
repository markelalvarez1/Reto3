package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
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
	public boolean anadirCuponBienvenida(Suscripcion s, Connection con) {
		
		return cuponDAO.anadirCuponBienvenida(s, con);
		
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
    
    public List<Cupon> comprarCupones(Usuario usuario, List<ItemCarrito> items) {
        Connection con = null;
        List<Cupon> cuponesComprados = new ArrayList<>();
        
        try {
            con = AccesoBD.getConnection();
            con.setAutoCommit(false);
            
            Suscripcion suscripcion = usuario.getSuscripcion();
            if (suscripcion == null) {
                con.rollback();
                return cuponesComprados;
            }
            
            for (ItemCarrito item : items) {
                List<Cupon> cupones = cuponDAO.crearCuponesMasivos(
                    suscripcion.getId(), 
                    item.getPrecio(), 
                    item.getCantidad(), 
                    item.getTipo(), 
                    con
                );
                
                if (!cupones.isEmpty()) {
                    cuponesComprados.addAll(cupones);
                } else {
                    con.rollback();
                    return new ArrayList<>();
                }
            }
            
            con.commit();
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
        
        return cuponesComprados;
    }
    
    // Clase interna para representar un item del carrito
    public static class ItemCarrito {
        private String id;
        private String tipo;
        private double precio;
        private int cantidad;
        
        public ItemCarrito(String id, String tipo, double precio, int cantidad) {
            this.id = id;
            this.tipo = tipo;
            this.precio = precio;
            this.cantidad = cantidad;
        }
        
        public String getId() {
            return id;
        }
        
        public String getTipo() {
            return tipo;
        }
        
        public double getPrecio() {
            return precio;
        }
        
        public int getCantidad() {
            return cantidad;
        }
    }
}
