package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.SuscripcionDAO;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class SuscripcionService {
	SuscripcionDAO suscripcionDAO;

	public SuscripcionService() {
		super();
		suscripcionDAO = new SuscripcionDAO();
	}

	public Suscripcion crearSuscripcion(Usuario u, int tipoSuscripcion, Connection conexion) {
		// TODO Auto-generated method stub
		return suscripcionDAO.crearSuscripcion(u, tipoSuscripcion, conexion);
	}

} 
