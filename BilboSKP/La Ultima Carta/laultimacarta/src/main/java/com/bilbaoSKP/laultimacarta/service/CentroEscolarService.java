package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.CentroEscolarDAO;
import com.bilbaoSKP.laultimacarta.dto.RegistroCentroDTO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Responsable;

public class CentroEscolarService {
	
	CentroEscolarDAO centroEscolarDAO;
	
	public CentroEscolarService() {
		super();
		centroEscolarDAO = new CentroEscolarDAO();
	}

	public boolean registrarCentroEscolar(Responsable r, Connection con) {

		return CentroEscolarDAO.registrarCentroEscolar(r, con);
	}
	
	public CentroEscolar validarYCrearCentro(RegistroCentroDTO dtoCentro) throws Exception {
		
		if(!validarCampos(dtoCentro.getCIF(), dtoCentro.getNombre(), dtoCentro.getCorreo(), dtoCentro.getNumeroAlumnos(), dtoCentro.getCiudad())) {
			throw new Exception("datoIncorrecto");
		}
		if(!validarTelefono(dtoCentro.getTelefono())) {
			throw new Exception("telefonoIncorrecto");
		}
		CentroEscolar c = crearCentro(dtoCentro.getCIF(), dtoCentro.getNombre(), dtoCentro.getCorreo(), dtoCentro.getTelefono(), dtoCentro.getNumeroAlumnos(), dtoCentro.getCiudad(), dtoCentro.getEtapaEducativa());
		
		if(centroEscolarDAO.existeCentro(c)) {
			throw new Exception("centroExiste");
		}
		
		return c;
	}

	private CentroEscolar crearCentro(String cif, String nombre, String correo, String telefono, String numeroAlumnos,
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

	private boolean validarTelefono(String telefono) {
		try {
			int tlf = Integer.parseInt(telefono);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	private boolean validarCampos(String... strings) {

		for (String campo : strings) {
			if (campo == null || campo.isEmpty()) {
				return false;
			}
		}
		return true;
	}

	
	
}
