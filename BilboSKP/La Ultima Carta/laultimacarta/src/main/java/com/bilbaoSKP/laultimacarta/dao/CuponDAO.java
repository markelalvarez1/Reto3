package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.CuponBienvenida;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;

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
			System.out.println(c.getTipoCupon());
			ps.setInt(2, c.getTipoCupon());
			ps.setDate(3, Date.valueOf(c.getFechaCompra().format(formatter)));
			ps.setDate(4, Date.valueOf(c.getFechaCaducidad().format(formatter)));
			ps.setDouble(5, c.getPrecio());
			ps.setString(6, c.getEstado());
			
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

}
