package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.List;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoPartidaEnum;

public class Partida {

	private int id, puntuacion;
	private LocalDate fechaInicio;
	private EstadoPartidaEnum estadoPartida;
	private List<Cupon> cuponesAsignados;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public EstadoPartidaEnum getEstadoPartida() {
		return estadoPartida;
	}
	public void setEstadoPartida(EstadoPartidaEnum estadoPartida) {
		this.estadoPartida = estadoPartida;
	}
	public List<Cupon> getCuponesAsignados() {
		return cuponesAsignados;
	}
	public void setCuponesAsignados(List<Cupon> cuponesAsignados) {
		this.cuponesAsignados = cuponesAsignados;
	}
	public int getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}
	
	private void generarCodigoAcceso() {}
	public void programarCupones(Suscripcion suscripcion) {}
	public void cancelar() {}
	public void iniciarPartida() {}
	public void finalizarPartida() {}
	public int calcularPuntuacionTotal(SesionPartida sesionPartida) {
		return 0;}
	public SesionPartida crearSesion() {
		return null;}
}
