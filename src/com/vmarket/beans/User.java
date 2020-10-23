package com.vmarket.beans;

import java.sql.Date;

public class User extends Func {

	private int idCli;
	private String nomCli;
	private String prenomCli;
	private String sexe;
	private String email;
	private long phone;
	private String profile;
	private String password;
	private Date datecreate;
	
	public User() {
		
	}
	
	public User(String nomCli, String prenomCli, String email, long phone) {
		super();
		this.setNomCli(nomCli);
		this.setPrenomCli(prenomCli);
		this.setEmail(email);
		this.setPhone(phone);
	}

	public User(int idCli, String nomCli, String prenomCli, String sexe, String email,
				long phone, String profile, String password, Date datecreate) {
		this.setIdCli(idCli);
		this.setNomCli(nomCli);
		this.setPrenomCli(prenomCli);
		this.setSexe(sexe);
		this.setEmail(email);
		this.setPhone(phone);
		this.setProfile(profile);
		this.setPassword(password);
		this.setDatecreate(datecreate);
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

	public String getNomCli() {
		return nomCli.toUpperCase();
	}

	public void setNomCli(String nomCli) {
		this.nomCli = nomCli;
	}

	public String getPrenomCli() {
		return prenomCli;
	}

	public void setPrenomCli(String prenomCli) {
		this.prenomCli = prenomCli;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDatecreate() {
		return datecreate;
	}

	public void setDatecreate(Date datecreate) {
		this.datecreate = datecreate;
	}
	
	public String getName() {
		String cha = "";
		if(sexe.equalsIgnoreCase("M")) {
			cha += "M. ";
		}else {
			cha += "Mme. ";
		}
		cha += getNomCli()+" "+getPrenomCli();
		return cha;
	}

}
