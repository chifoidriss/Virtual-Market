package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vmarket.models.ProduitModel;

@WebServlet({"/home","/Home","/HOME","/acceuil","/Acceuil","/ACCEUIL"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProduitModel prod;
       
    public Home() {
        super();
        prod = new ProduitModel();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
    	request.setAttribute("prodN",prod.listProduit(8));
    	request.setAttribute("prodTopS",prod.listTopSellProduit(8));
    	request.setAttribute("prodTop",prod.listTopSellProduit(3));
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
