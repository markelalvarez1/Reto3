package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;

public class Cupon {
    private int id;
    private int suscripcionId;
    private LocalDate fechaCompra;
    private LocalDate fechaCaducidad;
    private double precio;
    private String estado;
    private String tipo;
    
    public Cupon() {
        
    }
    
    public static Cupon nuevoCupon(int suscripcionId, double precio, String tipo) {
        Cupon cupon = new Cupon();
        cupon.setSuscripcionId(suscripcionId);
        cupon.setFechaCompra(LocalDate.now());
        cupon.setFechaCaducidad(LocalDate.now().plusYears(1)); // Validez de 1 año
        cupon.setPrecio(precio);
        cupon.setEstado("activo");
        cupon.setTipo(tipo);
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
    
    public String getEstado() {
        return estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public String getTipo() {
        return tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    @Override
    public String toString() {
        return "Cupon [id=" + id + ", suscripcionId=" + suscripcionId + ", fechaCompra=" + fechaCompra
                + ", fechaCaducidad=" + fechaCaducidad + ", precio=" + precio + ", estado=" + estado 
                + ", tipo=" + tipo + "]";
    }
}
