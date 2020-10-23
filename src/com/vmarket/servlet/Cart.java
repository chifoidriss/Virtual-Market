package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.vmarket.models.PanierModel;

@WebServlet({ "/Cart", "/cart" })
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Cart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
		PanierModel p = new PanierModel(request);
		
		request.setAttribute("panier",p.listPanier());
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/panier.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
