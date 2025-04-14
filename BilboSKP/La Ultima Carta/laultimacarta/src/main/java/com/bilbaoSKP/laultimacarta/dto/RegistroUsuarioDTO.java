package com.bilbaoSKP.laultimacarta.dto;

public class RegistroUsuarioDTO {
    private String nombre;
    private String apellidos;
    private String dni;
    private String correo;
    private String contrasena;
    private String repetirContrasena;
    private String telefono;

    // Getters and setters
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
    public String getRepetirContrasena() {
        return repetirContrasena;
    }
    public void setRepetirContrasena(String repetirContrasena) {
        this.repetirContrasena = repetirContrasena;
    }
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
