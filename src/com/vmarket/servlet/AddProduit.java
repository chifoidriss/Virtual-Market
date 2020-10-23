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


@WebServlet({"/AddProduit","/addProduit","/addproduit"})
public class AddProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategorieModel cat;
	private MarqueModel marq;
	private ProduitModel p;

    public AddProduit() {
        super();
        cat = new CategorieModel();
		marq = new MarqueModel();
		p = new ProduitModel();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
		
		request.setAttribute("cat", cat.listCategorie());
		request.setAttribute("marq", marq.listMarque());
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/addProduit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		p.saveProduit(request);
		doGet(request, response);
	}

}
