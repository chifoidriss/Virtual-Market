package com.vmarket.models;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vmarket.beans.Panier;

public class PanierModel extends Model {
	private String idCli,idProd, qte, action;
	
	public PanierModel(HttpServletRequest request) {
		setAction(request.getParameter("action"));
		setIdProd(request.getParameter("idProd"));
		setQte(request.getParameter("qte"));
		setIdCli(request.getParameter("idCli"));
	}
	
	private void setIdCli(String idCli) {
		this.idCli = idCli;
	}

	private void setIdProd(String idProd) {
		this.idProd = idProd;
	}

	private void setQte(String qte) {
		if(qte != null){
			this.qte = qte;
		}else {
			this.qte = "1";
		}
	}

	private void setAction(String action) {
		if(action != null) {
			this.action = action;
		}else {
			this.action = "show";
		}
	}

	public List<Panier> listPanier(){
		List<Panier> pan = new ArrayList<Panier>();
		rs = db.query("SELECT * FROM panier pa, produit pr"
				+ " WHERE pa.idProd=pr.idProd AND pa.idCli="+idCli);
		ProduitModel p = new ProduitModel();
		try {
			while(rs.next()) {
				Panier pa = new Panier(rs.getInt("idPan"),
						rs.getInt("idProd"),
						rs.getInt("qte"),
						rs.getInt("idCli"),
						p.infoProd(rs.getInt("idProd")));
				pan.add(pa);
			}
			return pan;
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
			return null;
		}
	}

	public void action(HttpServletRequest request) {		
		if(action.equalsIgnoreCase("add")) {
			addPanier(request);
		}else if(action.equalsIgnoreCase("del")) {
			deletePanier(request);
		}else if(action.equalsIgnoreCase("up")) {
			updatePanier(request);
		}else {
			return;
		}
	}
	
	private void addPanier(HttpServletRequest request) {
		if(idProd == null || qte == null) {
			request.setAttribute("error","Remplir tous les champs!!!");
			return;
		}
		int id = existe(idProd);
		if(id!=0) {
			db.execute("UPDATE panier SET qte=qte+"+qte+" WHERE idPan="+id);
			request.setAttribute("success","Ajouté au Panier!!!");
		}else {
			String []val = {idProd,qte,idCli};
			db.prepare("INSERT INTO panier(idProd,qte,idCli) VALUES(?,?,?)",val);
		}
		
	}
	
	private void deletePanier(HttpServletRequest request) {
		if(idProd == null) {
			request.setAttribute("error","Remplir tous les champs!!!");
			System.out.println("Remplir tous les champs!!!");
			return;
		}
		int id = existe(idProd);
		if(id!=0) {
			db.execute("DELETE FROM panier WHERE idPan="+id);
			request.setAttribute("success","Suppression réussie!!!");
			System.out.println("Suppression réussie!!!");
		}else {
			request.setAttribute("error","Ce machin n'existe pas!!!");
			System.out.println("Ce machin n'existe pas!!!");
		}
	}
	
	private void updatePanier(HttpServletRequest request) {
		if(idProd == null || qte == null) {
			request.setAttribute("error","Remplir tous les champs!!!");
			return;
		}
		int id = existe(idProd);
		if(id != 0) {
			db.execute("UPDATE panier SET qte='"+qte+"' WHERE idPan="+id);
			request.setAttribute("success","Modification réussie!!!");
		}else {
			request.setAttribute("error","Ce machin n'existe pas!!!");
		}
	}
	
	private int existe(String idProd) {
		rs = db.query("SELECT * FROM panier "
				+ " WHERE idProd='"+idProd+"' AND idCli='"+idCli+"'");
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
