package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;

public class CuponBienvenida extends Cupon {

	public static CuponBienvenida nuevoCupon() {
		CuponBienvenida cupon = new CuponBienvenida();
		cupon.setFechaCompra(LocalDate.now());
		cupon.setFechaCaducidad(LocalDate.now().plusYears(100));
		cupon.setPrecio(0);
		cupon.setEstadoCupon(EstadoCuponEnum.DISPONIBLE);
		return cupon;
	}

}
