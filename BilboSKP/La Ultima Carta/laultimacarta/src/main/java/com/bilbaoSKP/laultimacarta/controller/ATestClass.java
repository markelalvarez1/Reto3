package com.bilbaoSKP.laultimacarta.controller;

import com.bilbaoSKP.laultimacarta.service.CodificadorService;

public class ATestClass {

	public static void main(String[] args) {
		String codigo = "1;a124c343a121";
		String codigoCodificado = CodificadorService.codificar(codigo);
		System.out.println(codigoCodificado);
		
		String codigoDescodificado = CodificadorService.decodificar(codigoCodificado);
		System.out.println("Código descodificado " + codigoDescodificado);
	}
	
	

}
