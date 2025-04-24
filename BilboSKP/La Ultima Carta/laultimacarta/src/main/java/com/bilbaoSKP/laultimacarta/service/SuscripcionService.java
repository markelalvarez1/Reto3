package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;

import com.bilbaoSKP.laultimacarta.dao.SuscripcionDAO;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.TipoSuscripcionEnum;

public class SuscripcionService {
	SuscripcionDAO suscripcionDAO;
	CuponService cuponService;

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

	public boolean activarSuscripcion(String codigo) throws Exception {
		String codigoDescodificado = CodificadorService.decodificar(codigo);	
		String[] myArray =codigoDescodificado.split(";");
		String idSuscripcion=myArray [0];
		String codigoVerificacion=myArray [1];
		Suscripcion s = suscripcionDAO.getSuscripcionByID(idSuscripcion);
		System.out.println(s.getEstado().name());
		if(s != null) {
			s.activar(codigoVerificacion);
		}
		suscripcionDAO.updateEstadoSuscripcion(s);
		if(s.getTipoSuscripcion().getTipo() == TipoSuscripcionEnum.CENTRO_ESCOLAR.toString()) {
			
		}
		boolean exito = cuponService.anadirCuponesBySuscripcion(s);
		return exito;
	}

} 
