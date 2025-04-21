package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

import com.bilbaoSKP.laultimacarta.model.enums.TipoRankingEnum;

public class Ranking {

	private LocalDate fechaInicio, fechaFin;
	private TipoRankingEnum tipoRanking;
	
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public LocalDate getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(LocalDate fechaFin) {
		this.fechaFin = fechaFin;
	}
	public TipoRankingEnum getTipoRanking() {
		return tipoRanking;
	}
	public void setTipoRanking(TipoRankingEnum tipoRanking) {
		this.tipoRanking = tipoRanking;
	}
	
	public void crearRanking() {}
	public void reiniciarRanking() {}
}
