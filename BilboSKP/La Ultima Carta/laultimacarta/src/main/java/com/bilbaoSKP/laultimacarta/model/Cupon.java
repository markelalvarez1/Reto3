package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;

public class Cupon {

    private int id;
    private int suscripcionId;
    private LocalDate fechaCompra;
    private LocalDate fechaCaducidad;
    private double precio;
    private EstadoCuponEnum estadoCupon;
    
    public Cupon() {
        
    }
    
    public static Cupon nuevoCupon(double precio) {
        Cupon cupon = new Cupon();
        cupon.setFechaCompra(LocalDate.now());
        cupon.setFechaCaducidad(LocalDate.now().plusYears(100));
        cupon.setPrecio(precio);
        cupon.setEstadoCupon(EstadoCuponEnum.DISPONIBLE);
        return cupon;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getSuscripcionId() {
        return suscripcionId;
    }
    
    public void setSuscripcionId(int suscripcionId) {
        this.suscripcionId = suscripcionId;
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
