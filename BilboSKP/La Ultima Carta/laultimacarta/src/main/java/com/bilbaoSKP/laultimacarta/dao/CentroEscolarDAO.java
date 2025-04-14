package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;

public class CentroEscolarDAO {

	public boolean existeCentro(CentroEscolar c) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT cif FROM centroescolar WHERE cif = ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, c.getCIF());
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		return false;
	}

	public static boolean registrarCentroEscolar(Responsable r, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		
		try {
			String sql = "INSERT INTO centroescolar(cif, nombre, telefono, correo, ciudad, etapaEducativa, numeroAlumnos, id_usuario) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, r.getCentroEscolar().getCIF());
			ps.setString(2, r.getCentroEscolar().getNombre());
			ps.setInt(3, r.getCentroEscolar().getTelefono());
			ps.setString(4, r.getCentroEscolar().getCorreo());
			ps.setString(5, r.getCentroEscolar().getCiudad());
			ps.setString(6, r.getCentroEscolar().getEtapaEducativa());
			ps.setInt(7, r.getCentroEscolar().getNumeroAlumnos());
			ps.setInt(8, r.getId());
			
			if(ps.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			AccesoBD.closeConnection(null, ps, null);
		}
		
		return false;
	}

}
