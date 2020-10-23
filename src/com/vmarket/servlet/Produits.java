package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vmarket.models.CategorieModel;
import com.vmarket.models.MarqueModel;
import com.vmarket.models.ProduitModel;

@WebServlet({ "/Produits", "/produits", "/Boutique","/boutique","/store","/Store" })
public class Produits extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitModel prod;
	private CategorieModel cat;
	private MarqueModel marq;
	
    public Produits() {
        super();
        prod = new ProduitModel();
        cat = new CategorieModel();
        marq = new MarqueModel();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	request.getSession(true);
    	request.setAttribute("prod",prod.listProduit(20));
    	request.setAttribute("prodTopS",prod.listTopSellProduit(3));
    	request.setAttribute("cat",cat.listCategorie());
    	request.setAttribute("marq",marq.listMarque());
		
    	this.getServletContext().getRequestDispatcher("/WEB-INF/page/produits.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
