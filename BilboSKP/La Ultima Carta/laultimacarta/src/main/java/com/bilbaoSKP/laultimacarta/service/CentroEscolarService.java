package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.CentroEscolarDAO;
import com.bilbaoSKP.laultimacarta.dto.CentroDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;

public class CentroEscolarService {
	
	CentroEscolarDAO centroEscolarDAO;
	
	public CentroEscolarService() {
		super();
		centroEscolarDAO = new CentroEscolarDAO();
	}
	
	public CentroEscolar crearCentro(String cif, String nombre, String correo, String telefono, String numeroAlumnos,
			String ciudad, String etapaEducativa) {
		CentroEscolar c = new CentroEscolar();
		c.setCIF(cif);
		c.setNombre(nombre);
		c.setCorreo(correo);
		c.setTelefono(Integer.parseInt(telefono));
		c.setNumeroAlumnos(Integer.parseInt(numeroAlumnos));
		c.setEtapaEducativa(etapaEducativa);
		c.setCiudad(ciudad);
		return c;
	}

	public boolean existeCentro(CentroDTO centroDTO) {
		// TODO Auto-generated method stub
		return centroEscolarDAO.existeCentro(centroDTO);
	}

	public boolean registrarCentroEscolar(int usuarioId, CentroDTO centroDTO, Connection con) {
		// TODO Auto-generated method stub
		return centroEscolarDAO.registrarCentroEscolar(usuarioId, centroDTO, con);
	}

	public CentroEscolar getCentroEscolarByUsuarioID(int id) {
		// TODO Auto-generated method stub
		return centroEscolarDAO.getCentroEscolarByUsuarioID(id);
	}

	public CentroEscolar getCentroEscolarBySuscripcion(Suscripcion s) {
		// TODO Auto-generated method stub
		return centroEscolarDAO.getCentroEscolarBySuscripcion(s);
	}

	
	
}
