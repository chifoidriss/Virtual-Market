package com.vmarket.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.vmarket.beans.ConnectDB;
import com.vmarket.beans.Marque;

public class MarqueModel {
	private ConnectDB db;
	private ResultSet rs;
	
	public MarqueModel() {
		this.db = new ConnectDB();
		this.rs = null;
	}
	
	public List<Marque> listMarque(){
		List<Marque> lm = new ArrayList<Marque>();
		rs = db.query("SELECT * FROM marque");
		try {
			while(rs.next()) {
				Marque marq = new Marque(rs.getInt("idMarq"),rs.getString("nomMarq"));
				lm.add(marq);
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return lm;
	}
	
	public void saveMarque(String nomMarq) {
		db.execute("INSERT INTO marque(nomMarq) VALUES("+nomMarq+")");
	}

}
