package com.vmarket.models;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vmarket.beans.Commande;

public class CommandeModel extends Model {

	private String idCli,idProd;
	
	public CommandeModel(HttpServletRequest request) {
		
	}

	public List<Commande> listCommande(){
		List<Commande> com = new ArrayList<Commande>();
		rs = db.query("SELECT * FROM commande c, produit p"
				+ " WHERE c.idProd=p.idProd AND c.idCli="+idCli);
		ProduitModel p = new ProduitModel();
		try {
			while(rs.next()) {
				Commande co = new Commande(rs.getInt("idCom"),
						rs.getInt("idProd"),
						rs.getInt("qte"),
						rs.getInt("idCli"),
						p.infoProd(rs.getInt("idProd")),
						rs.getString("adresse"));
				com.add(co);
			}
			return com;
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
			return null;
		}
	}
	
	public void addCommande(HttpServletRequest request) {
		
	}
	
	public void deleteCommande(HttpServletRequest request) {
		if(idProd == null) {
			request.setAttribute("error","Remplir tous les champs!!!");
			return;
		}
		int id = existe(idProd);
		if(id!=0) {
			db.execute("DELETE FROM commande WHERE idCom="+id);
			request.setAttribute("success","Suppression réussie!!!");
		}else {
			request.setAttribute("error","Ce machin n'existe pas!!!");
		}
	}

	
	private int existe(String idCom) {
		rs = db.query("SELECT * FROM commande "
				+ " WHERE idCom='"+idCom+"' AND idCli='"+idCli+"'");
		try {
			int i=0, id = 0;
			while(rs.next()) {
				id = rs.getInt("idPan");
				i++;
			}
			if(i==1) {
				return id;
			}else {
				return 0;
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
			return 0;
		}
	}
	
	
}
