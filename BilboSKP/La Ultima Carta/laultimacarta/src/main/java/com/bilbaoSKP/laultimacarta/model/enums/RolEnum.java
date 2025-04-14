package com.bilbaoSKP.laultimacarta.model.enums;

public enum RolEnum {

	ADMINISTRADOR(1),
	USUARIO(2),
	RESPONSABLE(3);

	private final int codigo;
	
	RolEnum(int codigo) {
		this.codigo = codigo;
	}
	
	public int getCodigo() {
        return codigo;
    }
}
