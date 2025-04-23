package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDateTime;

public class RankingReset {
    private int id;
    private LocalDateTime fechaReset;
    private String tipo; // "automatico" o "manual"
    private int usuarioId; // ID del administrador que realizó el reset (si fue manual)

    public RankingReset() {
        this.fechaReset = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getFechaReset() {
        return fechaReset;
    }

    public void setFechaReset(LocalDateTime fechaReset) {
        this.fechaReset = fechaReset;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }
}