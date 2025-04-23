package com.bilbaoSKP.laultimacarta.model.enums;

public enum TipoSuscripcionEnum {

	INDIVIDUAL(1),
	CENTRO_ESCOLAR(2);

	private final int codigo;
	
	TipoSuscripcionEnum(int codigo) {
		this.codigo = codigo;
	}
	
	public int getCodigo() {
        return codigo;
    }
	
}
