package com.vmarket.beans;

public class Marque {

	private int idMarq;
	private String nomMarq;
	
	public Marque() {
	}
	
	public Marque(int idMarq, String nomMarq) {
		this.setIdMarq(idMarq);
		this.setNomMarq(nomMarq);
	}

	public int getIdMarq() {
		return idMarq;
	}

	public void setIdMarq(int idMarq) {
		this.idMarq = idMarq;
	}

	public String getNomMarq() {
		return nomMarq;
	}

	public void setNomMarq(String nomMarq) {
		this.nomMarq = nomMarq;
	}

	

}
