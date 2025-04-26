package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoCuponEnum;

public class CuponCyberbullying extends Cupon {

	 public static CuponCyberbullying nuevoCupon() {
		 	CuponCyberbullying cupon = new CuponCyberbullying();
	        cupon.setFechaCompra(LocalDate.now());
	        cupon.setFechaCaducidad(LocalDate.now().plusYears(1).withMonth(6).withDayOfMonth(30));
	        cupon.setPrecio(0);
	        cupon.setEstadoCupon(EstadoCuponEnum.DISPONIBLE);
	        return cupon;
	    }

	public static ArrayList<Cupon> obtenerCupones(int numeroAlumnos) {
		ArrayList<Cupon> cupones = new ArrayList<Cupon>();
		for(int i = 0; i < numeroAlumnos; i++) {
			cupones.add(CuponCyberbullying.nuevoCupon());
		}
		return cupones;
	}
}
