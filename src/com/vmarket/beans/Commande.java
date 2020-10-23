package com.vmarket.beans;

public class Commande extends Func {

	private int idCom;
	private int idProd;
	private int qte;
	private int idCli;
	private Produit prod;
	private String adresse;
	
	public Commande() {
		
	}
	
	public Commande(int idCom, int idProd, int qte, int idCli, Produit prod,String adresse) {
		this.setIdCom(idCom);
		this.setIdProd(idProd);
		this.setQte(qte);
		this.setIdCli(idCli);
		this.setProd(prod);
		this.setAdresse(adresse);
	}

	public int getIdCom() {
		return idCom;
	}

	public void setIdCom(int idCom) {
		this.idCom = idCom;
	}

	public int getIdProd() {
		return idProd;
	}

	public void setIdProd(int idProd) {
		this.idProd = idProd;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		this.qte = qte;
	}

	public int getIdCli() {
		return idCli;
	}

	public void setIdCli(int idCli) {
		this.idCli = idCli;
	}

	public Produit getProd() {
		return prod;
	}

	public void setProd(Produit prod) {
		this.prod = prod;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

}
