package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Random;

public class Suscripcion {

	private int id, codigoAcceso;
	private LocalDate fechaInicio;
	private String estado;
	private List<Cupon> cupones;
	
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
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public List<Cupon> getCupones() {
		return cupones;
	}
	public void setCupones(List<Cupon> cupones) {
		this.cupones = cupones;
	}
	public int getCodigoAcceso() {
		return codigoAcceso;
	}
	public void setCodigoAcceso(int codigoAcceso) {
		this.codigoAcceso = codigoAcceso;
	}
	
	public static Suscripcion nuevaSuscripcion() {
		Suscripcion s = new Suscripcion();
		s.setEstado("pendiente");
		s.setFechaInicio(LocalDate.now());
		Random rand = new Random();
		s.setCodigoAcceso(rand.nextInt(4000) + (rand.nextInt(999) + 1000));
		return s;
	}
	
	
	
}
