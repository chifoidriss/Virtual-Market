package com.vmarket.models;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vmarket.beans.Produit;

public class ProduitModel extends Model{

	public ProduitModel() {
		
	}
	
	public List<Produit> listProduit(){
		String req = "SELECT * FROM marque m, categorie c, produit p"
				+ " WHERE p.idCat=c.idCat AND p.idMarq= m.idMarq ORDER BY dateadd DESC";
	
		return list(req);
	}
	
	public List<Produit> listProduit(int nb){
		String req = "SELECT * FROM marque m, categorie c, produit p"+ 
					" WHERE p.idCat=c.idCat AND p.idMarq= m.idMarq"+
					" ORDER BY dateadd DESC LIMIT 0,"+nb;
		
		return list(req);
	}
	
	public List<Produit> listTopSellProduit(int nb){
		String req = "SELECT * FROM marque m, categorie c, produit p"+ 
				" WHERE p.idCat=c.idCat AND p.idMarq= m.idMarq"+
				" ORDER BY dateadd DESC LIMIT 0,"+nb;
	
		return list(req);
	}
	
	public void infoProduit(HttpServletRequest request) {
		int id = 0;
		String val = request.getParameter("idProd");
		if(val != null) {
			id = Integer.valueOf(val).intValue();
		}
		String req = "SELECT * FROM marque m, categorie c, produit p"+ 
				" WHERE p.idCat=c.idCat AND p.idMarq= m.idMarq AND idProd="+id;
		if(!exist(req)) {
			request.setAttribute("error","Ce produit n'existe pas");
			return;
		}
		request.setAttribute("prod",list(req).get(0));
	}
	
	public Produit infoProd(int id){
		String req = "SELECT * FROM marque m, categorie c, produit p"+ 
				" WHERE p.idCat=c.idCat AND p.idMarq= m.idMarq AND idProd="+id;
		if(!exist(req)) {
			return null;
		}
		return list(req).get(0);
	}
	
	public boolean saveProduit(HttpServletRequest request) {
		post = upload(request,"produit");
		
		if(post == null) {
			return false;
		}
		
		String nomProd = post.get("nomProd");
		String desc = post.get("desc");
		String qte = post.get("qte");
		String pu = post.get("pu");
		String avatar = post.get("avatar");
		String idCat = post.get("idCat");
		String idMarq = post.get("idMarq");
		
		if(avatar == null){
			request.setAttribute("error","Au moins un fichier est réquis!!!");
			return false;
		}
		
		if(!validText(nomProd)){
			request.setAttribute("error","Entrer un nom de produit valide!!!");
			return false;
		}
		
		String[]val = {nomProd,desc,qte,pu,avatar,idCat,idMarq};

		boolean b = db.prepare("INSERT INTO produit"
				+"(nomProd,description,qte,pu,avatar,idCat,idMarq,etat,dateadd)"
				+"VALUES(?,?,?,?,?,?,?,1,NOW())",val);
		if(!b) {
			request.setAttribute("error","Erreur d'enregistrement!!!");
			return false;
		}
		request.setAttribute("success","Enregistrement effectué!!!");
		return true;
	}
	
	private List<Produit> list(String req){
		List<Produit> prods = new ArrayList<Produit>();
		rs = db.query(req);
		try {
			while(rs.next()) {
				Produit prod = new Produit(rs.getInt("idProd"),
						rs.getString("nomProd"),
						rs.getString("description"),
						rs.getInt("qte"),
						rs.getFloat("pu"),
						rs.getString("avatar"),
						rs.getInt("etat"),
						rs.getDate("dateadd"),
						rs.getInt("idCat"),
						rs.getInt("idMarq"));
				prod.setNomCat(rs.getString("nomCat"));
				prod.setNomMarq(rs.getString("nomMarq"));
				prods.add(prod);
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return prods;
	}


}
