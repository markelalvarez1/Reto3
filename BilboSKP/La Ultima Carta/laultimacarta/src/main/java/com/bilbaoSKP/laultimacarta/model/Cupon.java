package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;

public class Cupon {

	private int id;
	private LocalDate fechaCompra, fechaCaducidad;
	private double precio;
	private EstadoCuponEnum estadoCupon;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public EstadoCuponEnum getEstadoCupon() {
		return estadoCupon;
	}

	public void setEstadoCupon(EstadoCuponEnum estadoCupon) {
		this.estadoCupon = estadoCupon;
	}

	
	
	
}
