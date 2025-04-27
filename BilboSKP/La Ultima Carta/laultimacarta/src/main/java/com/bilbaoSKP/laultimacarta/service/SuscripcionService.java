package com.bilbaoSKP.laultimacarta.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.dao.AccesoBD;
import com.bilbaoSKP.laultimacarta.dao.SuscripcionDAO;
import com.bilbaoSKP.laultimacarta.model.CentroEscolar;
import com.bilbaoSKP.laultimacarta.model.Cupon;
import com.bilbaoSKP.laultimacarta.model.CuponBienvenida;
import com.bilbaoSKP.laultimacarta.model.CuponCyberbullying;
import com.bilbaoSKP.laultimacarta.model.Suscripcion;
import com.bilbaoSKP.laultimacarta.model.TipoSuscripcion;
import com.bilbaoSKP.laultimacarta.model.Usuario;
import com.bilbaoSKP.laultimacarta.model.enums.TipoSuscripcionEnum;

public class SuscripcionService {
	SuscripcionDAO suscripcionDAO;
	CuponService cuponService;
	CentroEscolarService centroEscolarService;

	public SuscripcionService() {
		super();
		suscripcionDAO = new SuscripcionDAO();
		cuponService = new CuponService();
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
		if(s != null) {
			s.activar(codigoVerificacion);
		}

		Connection con = AccesoBD.getConnection();
		try {
			con.setAutoCommit(false);
			if(!suscripcionDAO.updateEstadoSuscripcion(s, con)) {
				con.rollback();
				return false;
			}
			
			if(TipoSuscripcionEnum.CENTRO_ESCOLAR.toString().equals(s.getTipoSuscripcion().getTipo())) {
				centroEscolarService = new CentroEscolarService();
				CentroEscolar cs = centroEscolarService.getCentroEscolarBySuscripcion(s);
				ArrayList<Cupon> cupones = CuponCyberbullying.obtenerCupones(cs.getNumeroAlumnos());
				s.setCupones(cupones);
			} else if(TipoSuscripcionEnum.INDIVIDUAL.toString().equals(s.getTipoSuscripcion().getTipo())) {
				CuponBienvenida cupon = CuponBienvenida.nuevoCupon();
				ArrayList<Cupon> cupones = new ArrayList<Cupon>();
				cupones.add(cupon);
				s.setCupones(cupones);
			}
			
			if(!cuponService.anadirCuponesToSuscripcion(s, con)) {
				con.rollback();
				return false;
			}
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			AccesoBD.closeConnection(null, null, con);
		}
		
		return true;
	}

	public Suscripcion getSuscripcionByID(String idSuscripcion) {
		// TODO Auto-generated method stub
		return suscripcionDAO.getSuscripcionByID(idSuscripcion);
	}

} 
