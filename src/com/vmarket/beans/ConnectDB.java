package com.vmarket.beans;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class ConnectDB {
	
	private Connection db;
	private String dbhost;
	private String dbname;
	private String dbuser;
	private String dbpassword;

	public ConnectDB() {
		dbhost = "jdbc:mysql://localhost/vmarket";
		dbuser = "root";
		dbpassword = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.db = DriverManager.getConnection(dbhost,dbuser,dbpassword);
		}catch(ClassNotFoundException e) {
			System.out.println("Erreur du Driver: "+e);
		}catch(SQLException e) {
			System.out.println("Erreur Base de donnée: "+e);
		}
	}
	
	public ConnectDB(String name,String user,String password) {
		this.dbname = name;
		this.dbhost = "jdbc:mysql://localhost/"+dbname;
		this.dbuser = user;
		this.dbpassword = password;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.db = DriverManager.getConnection(dbhost,dbuser,dbpassword);
		}catch(ClassNotFoundException e) {
			System.out.println("Erreur du Driver: "+e);
		}catch(SQLException e) {
			System.out.println("Erreur Base de donnée: "+e);
		}
	}
	
	public ResultSet query(String req) {
		try {
			Statement st = db.createStatement();
			return st.executeQuery(req);
		}catch(SQLException e) {
			System.out.println("Erreur: "+e);
			return null;
		}
	}
	
	public ResultSet prepareQuery(String req,String[] val) {
		try {
			PreparedStatement st = db.prepareStatement(req);
			for(int i=0; i<val.length; i++){
				st.setString(i+1, val[i]);
			}
			return st.executeQuery();
		}catch(SQLException e) {
			System.out.println("Erreur: "+e);
			return null;
		}
	}
	
	public boolean execute(String req) {
		try {
			Statement st = db.createStatement();
			st.executeUpdate(req);
			return true;
		}catch(SQLException e) {
			System.out.println("Erreur: "+e);
			return false;
		}
	}
	
	public boolean prepare(String req, String[] val) {
		try {
			PreparedStatement st = db.prepareStatement(req);
			for(int i=0; i<val.length; i++){
				st.setString(i+1, val[i]);
			}
			int bool = st.executeUpdate();
			if(bool==1)
				return true;
		}catch(SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return false;
	}
	
	public boolean prepare(String req, String val) {
		try {
			PreparedStatement st = db.prepareStatement(req);
			st.setString(1, val);
			st.executeUpdate();
			return true;
		}catch(SQLException e) {
			System.out.println("Erreur: "+e);
			return false;
		}
	}
	
	
	public static void main(String []arg) {
		
	}
}
