package com.bilbaoSKP.laultimacarta.model.enums;

public enum TipoSuscripcionEnum {

	NORMAL(1),
	GRATUITA(2);

	private final int codigo;
	
	TipoSuscripcionEnum(int codigo) {
		this.codigo = codigo;
	}
	
	public int getCodigo() {
        return codigo;
    }
	
}
