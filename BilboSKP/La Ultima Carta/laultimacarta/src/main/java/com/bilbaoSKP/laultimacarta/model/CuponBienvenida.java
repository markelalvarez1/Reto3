package com.bilbaoSKP.laultimacarta.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class CuponBienvenida extends Cupon {

	public CuponBienvenida() {
		super();
		this.setFechaCompra(LocalDate.now());
		this.setEstado("disponible");
		this.setFechaCaducidad(this.getFechaCompra().plusYears(100));
		this.setPrecio(BigDecimal.ZERO.doubleValue());
		this.setTipoCupon(TipoCuponEnum.NORMAL.getId());
	}

	
}
