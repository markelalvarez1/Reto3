package com.bilbaoSKP.laultimacarta.model;

public class ResultadoPartida {
    private int id;
    private int partidaId;
    private int aciertos;
    private int pistasUsadas;
    private int tiempoSegundos;
    private int puntuacion;
    private int claseId;
    private int centroEscolarId;

    public ResultadoPartida() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPartidaId() {
        return partidaId;
    }

    public void setPartidaId(int partidaId) {
        this.partidaId = partidaId;
    }

    public int getAciertos() {
        return aciertos;
    }

    public void setAciertos(int aciertos) {
        this.aciertos = aciertos;
    }

    public int getPistasUsadas() {
        return pistasUsadas;
    }

    public void setPistasUsadas(int pistasUsadas) {
        this.pistasUsadas = pistasUsadas;
    }

    public int getTiempoSegundos() {
        return tiempoSegundos;
    }

    public void setTiempoSegundos(int tiempoSegundos) {
        this.tiempoSegundos = tiempoSegundos;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
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

    // Método para calcular la puntuación basada en los datos de la partida
    public void calcularPuntuacion() {
        // Fórmula: Puntuación = (aciertos * 10) - (pistas * 2) + bonus_tiempo
        int bonusTiempo = 0;
        
        // Bonus por tiempo: si completa en menos de 30 minutos (1800 segundos)
        if (tiempoSegundos < 1800) {
            bonusTiempo = 50;
        } else if (tiempoSegundos < 3600) { // menos de 1 hora
            bonusTiempo = 25;
        }
        
        this.puntuacion = (aciertos * 10) - (pistasUsadas * 2) + bonusTiempo;
        
        // Asegurar que la puntuación no sea negativa
        if (this.puntuacion < 0) {
            this.puntuacion = 0;
        }
    }
}