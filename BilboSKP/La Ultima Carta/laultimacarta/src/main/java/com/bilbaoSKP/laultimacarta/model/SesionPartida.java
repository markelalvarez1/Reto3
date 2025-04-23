package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

public class SesionPartida {

	private int id, tiempoJuego, puntuacion;
	private LocalDate fechaInicio, fechaFin;
	private String rolElegido;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTiempoJuego() {
		return tiempoJuego;
	}
	public void setTiempoJuego(int tiempoJuego) {
		this.tiempoJuego = tiempoJuego;
	}
	public int getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}
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
	public String getRolElegido() {
		return rolElegido;
	}
	public void setRolElegido(String rolElegido) {
		this.rolElegido = rolElegido;
	}
	
}
