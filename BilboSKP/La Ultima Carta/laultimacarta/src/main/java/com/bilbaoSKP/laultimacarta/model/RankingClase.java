package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDateTime;

public class RankingClase {
    private int id;
    private int claseId;
    private int centroEscolarId;
    private int puntuacionTotal;
    private LocalDateTime fechaActualizacion;
    private String nombreClase; // Para mostrar en la vista
    private String nombreCentro; // Para mostrar en la vista

    public RankingClase() {
        this.fechaActualizacion = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClaseId() {
        return claseId;
    }

    public void setClaseId(int claseId) {
        this.claseId = claseId;
    }

    public int getCentroEscolarId() {
        return centroEscolarId;
    }

    public void setCentroEscolarId(int centroEscolarId) {
        this.centroEscolarId = centroEscolarId;
    }

    public int getPuntuacionTotal() {
        return puntuacionTotal;
    }

    public void setPuntuacionTotal(int puntuacionTotal) {
        this.puntuacionTotal = puntuacionTotal;
    }

    public LocalDateTime getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(LocalDateTime fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public String getNombreClase() {
        return nombreClase;
    }

    public void setNombreClase(String nombreClase) {
        this.nombreClase = nombreClase;
    }

    public String getNombreCentro() {
        return nombreCentro;
    }

    public void setNombreCentro(String nombreCentro) {
        this.nombreCentro = nombreCentro;
    }
}