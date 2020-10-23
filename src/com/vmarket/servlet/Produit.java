package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vmarket.models.ProduitModel;

@WebServlet({ "/Produit", "/produit" })
public class Produit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitModel prod;
   
    public Produit() {
        super();
        prod = new ProduitModel();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
		prod.infoProduit(request);
		request.setAttribute("prodR",prod.listProduit(4));
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/produit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
