package com.vmarket.beans;

public class Panier extends Func {
	private int idPan;
	private int idProd;
	private int qte;
	private int idCli;
	private Produit prod;

	public Panier() { }
	
	public Panier(int idPan, int idProd, int qte, int idCli, Produit prod) {
		this.idPan = idPan;
		this.idProd = idProd;
		this.qte = qte;
		this.idCli = idCli;
		this.setProd(prod);
	}

	public int getIdProd() {
		return idProd;
	}

	public void setIdProd(int idProd) {
		if(!validInt(idProd)) {
			System.out.println("Entier invalide!!!");
			return;
		}
		this.idProd = idProd;
	}

	public int getIdCli() {
		return idCli;
	}

	public void setIdCli(int idCli) {
		if(!validInt(idCli)) {
			System.out.println("Entier invalide!!!");
			return;
		}
		this.idCli = idCli;
	}

	public int getIdPan() {
		return idPan;
	}

	public void setIdPan(int idPan) {
		if(!validInt(idPan)) {
			System.out.println("Entier invalide!!!");
			return;
		}
		this.idPan = idPan;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		if(!validInt(qte)) {
			System.out.println("Entier invalide!!!");
			return;
		}
		this.qte = qte;
	}

	public Produit getProd() {
		return prod;
	}

	public void setProd(Produit prod) {
		this.prod = prod;
	}
	
}
