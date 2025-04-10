package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.CentroEscolarDAO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;

public class CentroEscolarService {
	
	CentroEscolarDAO centroEscolarDAO;
	
	

	public CentroEscolarService() {
		super();
		centroEscolarDAO = new CentroEscolarDAO();
	}



	public boolean crearCentroEscolar(CentroEscolar c, int idUsuario, Connection con) {
		// TODO Auto-generated method stub
		return centroEscolarDAO.crearCentroEscolar(c, idUsuario, con);
	}

}
