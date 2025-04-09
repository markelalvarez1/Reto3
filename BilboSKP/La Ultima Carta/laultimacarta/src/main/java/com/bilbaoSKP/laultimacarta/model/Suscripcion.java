package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Random;

public class Suscripcion {

	private int id;
	private LocalDate fechaInicio;
	private String estado, codigoAcceso;
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
	public String getCodigoAcceso() {
		return codigoAcceso;
	}
	public void setCodigoAcceso(String codigoAcceso) {
		this.codigoAcceso = codigoAcceso;
	}
	
	public static Suscripcion nuevaSuscripcion() {
		Suscripcion s = new Suscripcion();
		s.setEstado("pendiente");
		s.setFechaInicio(LocalDate.now());
		s.setCodigoAcceso(generarCodigoAcceso());
		return s;
	}
	private static String generarCodigoAcceso() {
		String codigo = "";
		Random ramon = new Random();
		StringBuilder str = new StringBuilder();
		for(int i = 0; i < 3; i++) {
			char letra = (char) (ramon.nextInt(26) + 'a');
			int numero = ramon.nextInt(899) + 100;
			str.append(letra).append(numero);
		}
		codigo = str.toString();
		return codigo;
	}
	
}