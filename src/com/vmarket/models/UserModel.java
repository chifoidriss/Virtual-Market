package com.vmarket.models;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.vmarket.beans.User;

public class UserModel extends Model {

	public UserModel() { }
	
	public List<User> listClient(){
		String req = "SELECT * FROM user ORDER BY datecreate DESC";
	
		return list(req);
	}
	
	public List<User> listClient(int nb){
		String req = "SELECT * FROM user ORDER BY datecreate DESC LIMIT 0,"+nb;
		
		return list(req);
	}
	
	public void infoClient(HttpServletRequest request){
		int id = 0;
		String val = request.getParameter("idUser");
		if(val != null) {
			id = Integer.valueOf(val).intValue();
		}
		String req = "SELECT * FROM user WHERE idUser="+id;
		if(!super.exist(req)) {
			request.setAttribute("error","Cette Personne n'existe pas!");
			return;
		}
		request.setAttribute("user", list(req).get(0));
	}
	
	private User info(int id){
		String req = "SELECT * FROM user WHERE idCli="+id;
		return list(req).get(0);
	}
	
	private List<User> list(String req){
		List<User> users = new ArrayList<User>();
		rs = db.query(req);
		try {
			while(rs.next()) {
				User prod = new User(rs.getInt("idCli"),
						rs.getString("nomCli"),
						rs.getString("prenomCli"),
						rs.getString("sexe"),
						rs.getString("email"),
						rs.getLong("phone"),
						rs.getString("profile"),
						rs.getString("password"),
						rs.getDate("datecreate"));
				users.add(prod);
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return users;
	}
	
	public boolean saveClient(HttpServletRequest request){
		
		post = upload(request,"user");
		
		if(post == null) {
			return false;
		}
		
		String nomCli = post.get("nomCli");
		String prenomCli = post.get("prenomCli");
		String sexe = post.get("sexe");
		String email = post.get("email");
		String phone = post.get("phone");
		String password = post.get("password");
		String confirm = post.get("confirm");
		String profile = post.get("profile");

		if(profile == null){
			request.setAttribute("error","Au moins un fichier est réquis!!!");
			return false;
		}
		if(!validText(nomCli)||!validText(prenomCli)){
			request.setAttribute("error","Entrer un nom et prénom valides!!!");
			return false;
		}
		if(!validEmail(email)) {
			request.setAttribute("error","Entrer une adresse valide!!!");
			return false;
		}
		if(!validEmail(phone)) {
			request.setAttribute("error","Entrer un numéro valide!!!");
			return false;
		}
		if(!validText(password)||!password.equals(confirm)) {
			request.setAttribute("error","Les mots de passes sont differents!!!");
			return false;
		}
		if(existe(email) != 0) {
			request.setAttribute("error","Cette adresse email existe déjà!!!");
			return false;
		}
		if(existe(phone) != 0) {
			request.setAttribute("error","Ce numéro existe déjà!!!");
			return false;
		}

		String[]val = {nomCli,prenomCli,sexe,email,phone,password,profile};

		boolean b = db.prepare("INSERT INTO user"
				+"(nomCli,prenomCli,sexe,email,phone,password,profile,datecreate)"
				+"VALUES(?,?,?,?,?,?,?,NOW())",val);
		
		if(!b) {
			request.setAttribute("error","Erreur d'enregistrement!!!");
			return false;
		}
		
		request.setAttribute("success","Inscription effectuée!!!");
		return true;
	}
	
	private int existe(String ephone) {
		rs = db.query("SELECT * FROM user WHERE email='"+ephone+"'"
				+ " OR phone='"+ephone+"'");
		try {
			int i=0, id =0;
			while(rs.next()) {
				id = rs.getInt("idCli");
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

	public boolean connecter(HttpServletRequest request) {
		String ephone = request.getParameter("ephone");
		String password = request.getParameter("password");
		if(ephone == null || password == null) {
			request.setAttribute("error","Mauvaise tentative!!!");
			return false; 
		}
		if(!validString(ephone) || !validString(password)) {
			request.setAttribute("error","Remplir tous les champs!!!");
			return false; 
		}
		if(!validEmail(ephone) && !validPhone(ephone)) {
			request.setAttribute("error","Entrer une adresse Email ou un numéro valide!!!");
			return false; 
		}
		if(existe(ephone) == 0) {
			request.setAttribute("error","Utilisateur inconnu!!!");
			return false;
		}
		User us = info(existe(ephone));
		if(!us.getPassword().equals(password)) {
			request.setAttribute("error","Ce Mot de passe ne correspond pas!!!");
			return false;
		}
		
		request.getSession(true).setAttribute("user",us);

		request.setAttribute("success","Utilisateur connecté!!!");
		return true;
	}
}