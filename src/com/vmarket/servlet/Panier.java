package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.vmarket.models.PanierModel;

@WebServlet({ "/panier", "/Panier"})
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Panier() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getSession(true);
		PanierModel p = new PanierModel(request);
		
		p.action(request);
		request.setAttribute("panier",p.listPanier());
		response.sendRedirect("cart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
