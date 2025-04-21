package com.bilbaoSKP.laultimacarta.model;

import java.sql.Date;

public class Responsable extends Usuario {

	private CentroEscolar centroEscolar;

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
