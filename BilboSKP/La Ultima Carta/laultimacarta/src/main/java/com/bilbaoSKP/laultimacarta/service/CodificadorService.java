package com.bilbaoSKP.laultimacarta.service;

import java.math.BigInteger;

public class CodificadorService {

	 private static final BigInteger CLAVE = new BigInteger("987654321"); // Tu "clave secreta" para el cifrado

	    // Codifica cualquier texto (letras y n�meros) y da solo n�meros como resultado
	    public static String codificar(String texto) {
	        byte[] bytes = texto.getBytes();
	        BigInteger valorOriginal = new BigInteger(1, bytes); // Convertir a n�mero
	        BigInteger cifrado = valorOriginal.xor(CLAVE); // Operaci�n reversible
	        return cifrado.toString(); // Solo n�meros
	    }

	    // Descifra el n�mero de vuelta al texto original
	    public static String decodificar(String cifrado) {
	        BigInteger valorCifrado = new BigInteger(cifrado);
	        BigInteger original = valorCifrado.xor(CLAVE); // Revertir operaci�n XOR
	        byte[] bytesOriginal = original.toByteArray();

	        // Manejar posible byte inicial 0 (por signo)
	        if (bytesOriginal[0] == 0) {
	            byte[] recortado = new byte[bytesOriginal.length - 1];
	            System.arraycopy(bytesOriginal, 1, recortado, 0, recortado.length);
	            bytesOriginal = recortado;
	        }

	        return new String(bytesOriginal);
	    }
}
