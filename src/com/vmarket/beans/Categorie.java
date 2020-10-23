package com.vmarket.beans;

public class Categorie {
	
	private int idCat;
	private String nomCat;
	
	public Categorie() {
		
	}

	public Categorie(int idCat, String nomCat) {
		this.setIdCat(idCat);
		this.setNomCat(nomCat);
	}

	public int getIdCat() {
		return idCat;
	}

	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}

	public String getNomCat() {
		return nomCat;
	}

	public void setNomCat(String nomCat) {
		this.nomCat = nomCat;
	}

}
