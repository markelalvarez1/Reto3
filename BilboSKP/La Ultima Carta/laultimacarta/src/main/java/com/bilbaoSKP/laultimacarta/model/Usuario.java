package com.bilbaoSKP.laultimacarta.model;

import java.sql.Date;

public class Usuario {

	private int id, telefono;
	private String nombre, apellidos, dni, correo, contrasena;
	private Rol rol;
	private Suscripcion suscripcion;
	
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
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}
	public Suscripcion getSuscripcion() {
		return suscripcion;
	}
	public void setSuscripcion(Suscripcion suscripcion) {
		this.suscripcion = suscripcion;
	}
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", telefono=" + telefono + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", dni=" + dni + ", correo=" + correo + ", contrasena=" + contrasena + ", rol=" + rol
				+ ", suscripcion=" + suscripcion + "]";
	}
	public Partida organizarPartida(EscapeRoom escapeRoom, Date fechaInicio, int cantidadCupones) {
		return null;
	}
	public void cancelarPartida(Partida partida) {	
	}
}
