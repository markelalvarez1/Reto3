package com.bilbaoSKP.laultimacarta.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Random;

import com.bilbaoSKP.laultimacarta.model.enums.EstadoSuscripcionEnum;
import com.bilbaoSKP.laultimacarta.model.enums.TipoSuscripcionEnum;

public class Suscripcion {

	private int id;
	private TipoSuscripcion tipoSuscripcion;
	private LocalDate fechaInicio;
	private String codigoAcceso;
	private EstadoSuscripcionEnum estado;
	private List<Cupon> cupones;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public EstadoSuscripcionEnum getEstado() {
		return estado;
	}
	public void setEstado(EstadoSuscripcionEnum estado) {
		this.estado = estado;
	}
	public List<Cupon> getCupones() {
		return cupones;
	}
	public void setCupones(List<Cupon> cupones) {
		this.cupones = cupones;
	}
	public String getCodigoAcceso() {
		return codigoAcceso;
	}
	public void setCodigoAcceso(String codigoAcceso) {
		this.codigoAcceso = codigoAcceso;
	}
	public TipoSuscripcion getTipoSuscripcion() {
		return tipoSuscripcion;
	}
	public void setTipoSuscripcion(TipoSuscripcion tipoSuscripcion) {
		this.tipoSuscripcion = tipoSuscripcion;
	}
	public static Suscripcion nuevaSuscripcion() {
		Suscripcion s = new Suscripcion();
		TipoSuscripcion ts = new TipoSuscripcion();
		s.setEstado(EstadoSuscripcionEnum.PENDIENTE);
		s.setFechaInicio(LocalDate.now());
		s.setCodigoAcceso(generarCodigoAcceso());
		ts.setId(TipoSuscripcionEnum.NORMAL.getCodigo());
		s.setTipoSuscripcion(ts);
		return s;
	}
	
	public static Suscripcion nuevaSuscripcionGratuita() {
		Suscripcion s = new Suscripcion();
		TipoSuscripcion ts = new TipoSuscripcion();
		s.setEstado(EstadoSuscripcionEnum.PENDIENTE);
		s.setFechaInicio(LocalDate.now());
		ts.setId(TipoSuscripcionEnum.GRATUITA.getCodigo());
		s.setTipoSuscripcion(ts);
		return s;
	}
	
	private static String generarCodigoAcceso() {
		String codigo = "";
		Random ramon = new Random();
		StringBuilder str = new StringBuilder();
		for(int i = 0; i < 3; i++) {
			char letra = (char) (ramon.nextInt(26) + 'a');
			int numero = ramon.nextInt(899) + 100;
			str.append(letra).append(numero);
		}
		codigo = str.toString();
		return codigo;
	}
	
}