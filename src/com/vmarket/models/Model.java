package com.vmarket.models;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.vmarket.beans.ConnectDB;

public abstract class Model {
	private final String UPLOAD_DIRECTORY 	= "file";
	private final int MEMORY_THRESHOLD 	= 1024 * 1024 *5; 	// 5MB
	private final int MAX_FILE_SIZE 	= 1024 * 1024 * 40; // 40MB
	private final int MAX_REQUEST_SIZE	= 1024 * 1024 * 50; // 50MB
	private final String[] EXT_PERMIS	= {".jpg",".jpeg",".png",".bmp",".gif"};

	protected final ConnectDB db;
	protected ResultSet rs;
	protected Hashtable<String,String> post;
	
	public Model() {
		this.db = new ConnectDB();
		this.rs = null;
		post = new Hashtable<String,String>();
	}
	
	public final static boolean contain(String[]tab,String val) {
		for(int i=0; i<tab.length; i++) {
			if(tab[i].equalsIgnoreCase(val))
				return true;
		}
		return false;
	}
	
	protected final boolean exist(String req) {
		rs = db.query(req);
		try {
			int i=0;
			while(rs.next()) {
				i++;
			}
			if(i==1) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			System.out.println("Erreur: "+e);
		}
		return false;
	}
	
	protected final Hashtable<String,String> upload(HttpServletRequest request,String dir) {
		Hashtable<String,String> postU = new Hashtable<String,String>();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);	
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		
		String uploadPath = request.getServletContext().getRealPath("")
				+File.separator+UPLOAD_DIRECTORY+File.separator+dir;
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		try {
			List<FileItem> formItems = upload.parseRequest(request);
			
			String avatar = null;

			if (formItems != null && formItems.size() > 0) {
				for (FileItem item : formItems) {
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String fileExt = fileName.substring(fileName.lastIndexOf('.'));
						
						if(!contain(EXT_PERMIS,fileExt)) {
							request.setAttribute("error","Image incorrecte!!!");
							return null;
						}
						LocalDateTime da = LocalDateTime.now();
						int ye = da.getYear();
						int mn = da.getMonthValue();
						int d = da.getDayOfMonth();
						int h = da.getHour();
						int m = da.getMinute();
						int s = da.getSecond();
						String dd = ye+""+mn+""+d+""+h+""+m+""+s;
						
						fileName = "VM"+dd+fileExt;
						
						String filePath = uploadPath+File.separator+fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);
						
						avatar = UPLOAD_DIRECTORY+File.separator+dir+File.separator+fileName;
						postU.put(item.getFieldName(), avatar);
					}else {
						postU.put(item.getFieldName(), item.getString());
					}
				}
				return postU;
			} else {
				request.setAttribute("error","Erreur rencontrée!!!");
				return null;
			}
		} catch (Exception e) {
			request.setAttribute("error","Erreur rencontrée: " + e.getMessage());
			return null;
		}
	}


	public static boolean validText(String text) {
		if(text.trim().length()>=4 && text.trim().length()<=100)
			return true;
		return false;
	}
	
	public static boolean validString(String text) {
		if(text.trim().length()>=1 && text.trim().length()<=100)
			return true;
		return false;
	}
	
	public static boolean validPhone(String phone) {
		if(phone.trim().length()>=4 && phone.trim().length()<=100)
			return true;
		return false;
	}
	
	public static boolean validEmail(String text) {
		if(text.trim().length()>=4 && text.trim().length()<=100)
			return true;
		return false;
	}
	public static boolean validInt(String text) {
		int val = Integer.valueOf(text).intValue();
		if(val>0)
			return true;
		return false;
	}
	public static boolean validFloat(String text) {
		float val = Float.valueOf(text).floatValue();
		if(val>0)
			return true;
		return false;
	}
}