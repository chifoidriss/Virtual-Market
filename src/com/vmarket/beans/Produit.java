package com.vmarket.beans;

import java.sql.Date;

public class Produit extends Func {
	
	private int idProd;
	private String  nomProd;
	private String desc;
	private int qte;
	private float pu;
	private String avatar;
	private int etat;
	private Date dateadd;
	private int idCat;
	private int idMarq;
	private String nomCat;
	private String nomMarq;
	
	public Produit() { }
	
	public Produit(int idProd, String nomProd, String desc, int qte, float pu, 
					String avatar, int etat, Date dateadd, int idCat, int idMarq) {
		this.setIdProd(idProd);
		this.setNomProd(nomProd);
		this.setDesc(desc);
		this.setQte(qte);
		this.setPu(pu);
		this.setAvatar(avatar);
		this.setEtat(etat);
		this.setDateadd(dateadd);
		this.setIdCat(idCat);
		this.setIdMarq(idMarq);
	}
	
	public int getIdProd() {
		return idProd;
	}

	public void setIdProd(int idProd) {
		if(idProd<0) {
			System.out.println("Entier invalide!!!");
			return;
		}
		this.idProd = idProd;
	}

	public String getNomProd() {
		return nomProd;
	}

	public void setNomProd(String nomProd) {
		if(!validString(nomProd)) {
			System.out.println("nom invalide!!!");
			return;
		}
		this.nomProd = nomProd;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getQte() {
		return qte;
	}

	public void setQte(int qte) {
		if(!validInt(qte)) {
			System.out.println("Qte: Entier invalide!!!");
			return;
		}
		this.qte = qte;
	}

	public float getPu() {
		return pu;
	}

	public void setPu(float pu) {
		if(!validFloat(pu)) {
			System.out.println("PU: Entier invalide!!!");
			return;
		}
		this.pu = pu;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		if(!validString(avatar)) {
			System.out.println("chemin invalide!!!");
			return;
		}
		this.avatar = avatar;
	}

	public int getEtat() {
		return etat;
	}

	public void setEtat(int etat) {
		if(!validInt(etat)) {
			System.out.println("Etat: Entier invalide!!!");
			return;
		}
		this.etat = etat;
	}

	public Date getDateadd() {
		return dateadd;
	}

	public void setDateadd(Date dateadd) {
		this.dateadd = dateadd;
	}

	public int getIdCat() {
		return idCat;
	}

	public void setIdCat(int idCat) {
		if(!validInt(idCat)) {
			System.out.println("idCat: Entier invalide!!!");
			return;
		}
		this.idCat = idCat;
	}

	public int getIdMarq() {
		return idMarq;
	}

	public void setIdMarq(int idMarq) {
		if(!validInt(idMarq)) {
			System.out.println("idMarq: Entier invalide!!!");
			return;
		}
		this.idMarq = idMarq;
	}

	public String getNomCat() {
		return nomCat;
	}

	public void setNomCat(String nomCat) {
		this.nomCat = nomCat;
	}

	public String getNomMarq() {
		return nomMarq;
	}

	public void setNomMarq(String nomMarq) {
		this.nomMarq = nomMarq;
	}
}
