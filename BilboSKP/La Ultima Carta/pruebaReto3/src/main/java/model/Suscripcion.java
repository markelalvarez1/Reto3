package model;

import java.time.LocalDate;

public class Suscripcion {
    private int id;
    private int usuarioId;
    private String estado;
    private String tipoSuscripcion;
    private String codigoAcceso;
    private LocalDate fechaInicio;

    // Constructor
    public Suscripcion(int usuarioId, String tipoSuscripcion, String codigoAcceso) {
        this.usuarioId = usuarioId;
        this.estado = "pendiente";
        this.tipoSuscripcion = tipoSuscripcion;
        this.codigoAcceso = codigoAcceso;
        this.fechaInicio = LocalDate.now();
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipoSuscripcion() {
        return tipoSuscripcion;
    }

    public void setTipoSuscripcion(String tipoSuscripcion) {
        this.tipoSuscripcion = tipoSuscripcion;
    }

    public String getCodigoAcceso() {
        return codigoAcceso;
    }

    public void setCodigoAcceso(String codigoAcceso) {
        this.codigoAcceso = codigoAcceso;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
}

