package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vmarket.models.UserModel;

@WebServlet({ "/sigin", "/Sigin", "/SIGIN" })
public class Sigin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserModel u;
       
    public Sigin() {
        super();
        this.u = new UserModel();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
		
		/*
		 * request.setAttribute("nomCli",u.post(request).get("nomCli"));
		 * request.setAttribute("prenomCli",u.post(request).get("prenomCli"));
		 * request.setAttribute("email",u.post(request).get("email"));
		 * request.setAttribute("phone",u.post(request).get("phone"));
		 * request.setAttribute("password",u.post(request).get("password"));
		 */
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/sigin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean b = u.saveClient(request);
		if(b) {
			response.sendRedirect("login");
		}else {
			doGet(request, response);
		}
	}

}
