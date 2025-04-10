package com.bilbaoSKP.laultimacarta.model;

public class CentroEscolar {

	private int id, telefono, numeroAlumnos;
	private String CIF, nombre, correo;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTelefono() {
		return telefono;
	}
	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	public int getNumeroAlumnos() {
		return numeroAlumnos;
	}
	public void setNumeroAlumnos(int numeroAlumnos) {
		this.numeroAlumnos = numeroAlumnos;
	}
	public String getCIF() {
		return CIF;
	}
	public void setCIF(String cIF) {
		CIF = cIF;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
}
