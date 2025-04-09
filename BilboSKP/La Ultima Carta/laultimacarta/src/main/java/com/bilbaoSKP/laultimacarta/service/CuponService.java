package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.CuponDAO;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;

public class CuponService {
	
	CuponDAO cuponDAO;

	public CuponService() {
		cuponDAO = new CuponDAO();
	}
	public boolean anadirCuponBienvenida(Suscripcion s, Connection con) {
		
		return cuponDAO.anadirCuponBienvenida(s, con);
		
	}

}
