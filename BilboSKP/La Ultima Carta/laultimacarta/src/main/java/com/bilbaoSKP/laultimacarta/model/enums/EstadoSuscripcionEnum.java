package com.bilbaoSKP.laultimacarta.model.enums;

public enum EstadoSuscripcionEnum {
	ACTIVA,
	PENDIENTE,
	CANCELADA;
	
	public static EstadoSuscripcionEnum fromString(String estado) {
        for (EstadoSuscripcionEnum e : EstadoSuscripcionEnum.values()) {
            if (e.name().equalsIgnoreCase(estado)) {
                return e;
            }
        }
        throw new IllegalArgumentException("Estado desconocido: " + estado);
    }
}
