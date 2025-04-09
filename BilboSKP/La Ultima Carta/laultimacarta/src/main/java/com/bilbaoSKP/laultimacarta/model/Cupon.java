package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

public class Cupon {

	private int id, tipoCupon;
	private LocalDate fechaCompra, fechaCaducidad;
	private double precio;
	private String estado;
	
	public Cupon() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTipoCupon() {
		return tipoCupon;
	}

	public void setTipoCupon(int tipoCupon) {
		this.tipoCupon = tipoCupon;
	}

	public LocalDate getFechaCompra() {
		return fechaCompra;
	}

	public void setFechaCompra(LocalDate fechaCompra) {
		this.fechaCompra = fechaCompra;
	}

	public LocalDate getFechaCaducidad() {
		return fechaCaducidad;
	}

	public void setFechaCaducidad(LocalDate fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
}
