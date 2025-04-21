package com.bilbaoSKP.laultimacarta.dto;

public class RegistroDTO {

	private int tipoSuscripcionID;
	private UsuarioDTO usuarioDTO;
	private CentroDTO centroDTO;
	
	public int getTipoSuscripcionID() {
		return tipoSuscripcionID;
	}
	public void setTipoSuscripcionID(int tipoSuscripcionID) {
		this.tipoSuscripcionID = tipoSuscripcionID;
	}
	public UsuarioDTO getUsuarioDTO() {
		return usuarioDTO;
	}
	public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
		this.usuarioDTO = usuarioDTO;
	}
	public CentroDTO getCentroDTO() {
		return centroDTO;
	}
	public void setCentroDTO(CentroDTO centroDTO) {
		this.centroDTO = centroDTO;
	}
	
	
}
