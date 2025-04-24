package com.bilbaoSKP.laultimacarta.model;

import java.sql.Date;

public class Responsable extends Usuario {

	private CentroEscolar centroEscolar;

	public Responsable(Usuario u) {
		 this.setId(u.getId());
	     this.setTelefono(u.getTelefono());
	     this.setNombre(u.getNombre());
	     this.setApellidos(u.getApellidos());
	     this.setDni(u.getDni());
	     this.setCorreo(u.getCorreo());
	     this.setContrasena(u.getContrasena());
	     this.setRol(u.getRol());
	     this.setSuscripcion(u.getSuscripcion());
	}

	public CentroEscolar getCentroEscolar() {
		return centroEscolar;
	}

	public void setCentroEscolar(CentroEscolar centroEscolar) {
		this.centroEscolar = centroEscolar;
	}
	
	public Ranking crearRankingEspecial(String nombre) {
		return null;}

	public Partida organizarPartida(EscapeRoom escapeRoom, Date fechaInicio, int cantidadCupones, Ranking ranking, Clase clase) {
		return null;
	}
	
}
