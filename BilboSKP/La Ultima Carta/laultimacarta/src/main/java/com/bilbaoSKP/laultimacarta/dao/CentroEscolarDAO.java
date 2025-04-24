package com.bilbaoSKP.laultimacarta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bilbaoSKP.laultimacarta.dto.CentroDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;

public class CentroEscolarDAO {

	public boolean existeCentro(CentroDTO centroDTO) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT cif FROM centroescolar WHERE cif = ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, centroDTO.getCIF());
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

	public boolean registrarCentroEscolar(int usuarioId, CentroDTO centroDTO, Connection conexion) {
		Connection con = conexion;
		PreparedStatement ps = null;
		
		try {
			String sql = "INSERT INTO centroescolar(cif, nombre, telefono, correo, ciudad, etapaEducativa, numeroAlumnos, id_usuario) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, centroDTO.getCIF());
			ps.setString(2, centroDTO.getNombre());
			ps.setInt(3, Integer.valueOf(centroDTO.getTelefono()));
			ps.setString(4, centroDTO.getCorreo());
			ps.setString(5, centroDTO.getCiudad());
			ps.setString(6, centroDTO.getEtapaEducativa());
			ps.setInt(7, Integer.valueOf(centroDTO.getNumeroAlumnos()));
			ps.setInt(8, usuarioId);
			
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

	public CentroEscolar getCentroEscolarByUsuarioID(int id) {
		Connection con = AccesoBD.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		CentroEscolar cs = null;
		try {
			String sql = "SELECT * FROM centroEscolar WHERE id_usuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				cs = new CentroEscolar();
				cs.setId(rs.getInt("id"));
				cs.setCIF(rs.getString("cif"));
				cs.setNombre(rs.getString("nombre"));
				cs.setCiudad(rs.getString("ciudad"));
				cs.setEtapaEducativa(rs.getString("etapaEducativa"));
				cs.setNumeroAlumnos(rs.getInt("numeroAlumnos"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			AccesoBD.closeConnection(rs, ps, con);
		}
		
		return cs;
	}

}
