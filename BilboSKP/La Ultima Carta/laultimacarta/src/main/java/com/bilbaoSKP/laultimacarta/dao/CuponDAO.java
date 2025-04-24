package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.CuponBienvenida;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;

public class CuponDAO {

	public boolean anadirCuponBienvenida(Suscripcion s, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		
		try {
			CuponBienvenida c = new CuponBienvenida();
			String sql = "INSERT INTO cupon (suscripcion_id, cupon_tipo_id, fechaCompra, fechaCaducidad, precio, estado) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			ps = con.prepareStatement(sql);
			ps.setInt(1, s.getId());

			ps.setDate(3, Date.valueOf(c.getFechaCompra().format(formatter)));
			ps.setDate(4, Date.valueOf(c.getFechaCaducidad().format(formatter)));
			ps.setDouble(5, c.getPrecio());
			ps.setString(6, c.getEstadoCupon().name());
			
			if(ps.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return false;
	}
	public Cupon crearCupon(Cupon cupon, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            String sql = "INSERT INTO cupon (suscripcion_id, fechaCompra, fechaCaducidad, precio, estado) "
                    + "VALUES (?, ?, ?, ?, ?)";
            
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cupon.getSuscripcionId());
            ps.setDate(2, Date.valueOf(cupon.getFechaCompra()));
            ps.setDate(3, Date.valueOf(cupon.getFechaCaducidad()));
            ps.setDouble(4, cupon.getPrecio());
            ps.setString(5, cupon.getEstadoCupon().name());
            
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cupon.setId(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return cupon;
    }
    
    public List<Cupon> obtenerCuponesPorSuscripcion(int suscripcionId, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Cupon> cupones = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM cupon WHERE suscripcion_id = ?";
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, suscripcionId);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                Cupon cupon = new Cupon();
                cupon.setId(rs.getInt("id"));
                cupon.setSuscripcionId(rs.getInt("suscripcion_id"));
                cupon.setFechaCompra(rs.getDate("fechaCompra").toLocalDate());
                cupon.setFechaCaducidad(rs.getDate("fechaCaducidad").toLocalDate());
                cupon.setPrecio(rs.getDouble("precio"));
                cupon.setEstadoCupon(EstadoCuponEnum.valueOf(rs.getString("estado")));
                
                cupones.add(cupon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return cupones;
    }
    
    public List<Cupon> obtenerCuponesActivosPorSuscripcion(int suscripcionId, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Cupon> cupones = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM cupon WHERE suscripcion_id = ? AND estado = 'activo' AND fechaCaducidad >= CURDATE()";
            
            ps = con.prepareStatement(sql);
            ps.setInt(1, suscripcionId);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                Cupon cupon = new Cupon();
                cupon.setId(rs.getInt("id"));
                cupon.setSuscripcionId(rs.getInt("suscripcion_id"));
                cupon.setFechaCompra(rs.getDate("fechaCompra").toLocalDate());
                cupon.setFechaCaducidad(rs.getDate("fechaCaducidad").toLocalDate());
                cupon.setPrecio(rs.getDouble("precio"));
                cupon.setEstadoCupon(EstadoCuponEnum.valueOf(rs.getString("estado")));
                
                cupones.add(cupon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(rs, ps, null);
        }
        
        return cupones;
    }
    
    public boolean actualizarEstadoCupon(int cuponId, String nuevoEstado, Connection conexion) {
        Connection con = conexion;
        PreparedStatement ps = null;
        boolean exito = false;
        
        try {
            String sql = "UPDATE cupon SET estado = ? WHERE id = ?";
            
            ps = con.prepareStatement(sql);
            ps.setString(1, nuevoEstado);
            ps.setInt(2, cuponId);
            
            int filasActualizadas = ps.executeUpdate();
            exito = (filasActualizadas > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            AccesoBD.closeConnection(null, ps, null);
        }
        
        return exito;
    }
    
    public List<Cupon> crearCuponesMasivos(int suscripcionId, double precio, int cantidad, String tipo, Connection conexion) {
        List<Cupon> cuponesCreados = new ArrayList<>();
        
        for (int i = 0; i < cantidad; i++) {
            Cupon cupon = Cupon.nuevoCupon(suscripcionId, precio, tipo);
            Cupon cuponCreado = crearCupon(cupon, conexion);
            if (cuponCreado != null) {
                cuponesCreados.add(cuponCreado);
            }
        }
        
        return cuponesCreados;
    }
}



