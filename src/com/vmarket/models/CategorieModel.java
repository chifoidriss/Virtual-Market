package com.vmarket.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.vmarket.beans.Categorie;
import com.vmarket.beans.ConnectDB;

public class CategorieModel {
	private ConnectDB db;
	private ResultSet rs;
	
	public CategorieModel() {
		this.db = new ConnectDB();
		this.rs = null;
	}
	
	public List<Categorie> listCategorie(){
		List<Categorie> lc = new ArrayList<Categorie>();
		rs = db.query("SELECT * FROM categorie");
		try {
			while(rs.next()) {
				Categorie cat = new Categorie(rs.getInt("idCat"),rs.getString("nomCat"));
				lc.add(cat);
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return lc;
	}
	
	public void saveCategorie(String nomCat) {
		db.execute("INSERT INTO categorie(nomCat) VALUES("+nomCat+")");
	}

}
