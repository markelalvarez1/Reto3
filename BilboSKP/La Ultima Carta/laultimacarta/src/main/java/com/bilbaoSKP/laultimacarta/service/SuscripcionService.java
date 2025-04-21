package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.SuscripcionDAO;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;

public class SuscripcionService {
	SuscripcionDAO suscripcionDAO;

	public SuscripcionService() {
		super();
		suscripcionDAO = new SuscripcionDAO();
	}

	public TipoSuscripcion getTipoSuscripcionByID(int tipoSuscripcionID) {
		// TODO Auto-generated method stub
		return suscripcionDAO.getTipoSuscripcionByID(tipoSuscripcionID);
	}

	public int registrarSuscripcion(int usuarioId, Suscripcion s, Connection con) {
		// TODO Auto-generated method stub
		return suscripcionDAO.registrarSuscripcion(usuarioId, s, con);
	}

} 
