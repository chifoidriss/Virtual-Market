package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/Error", "/error" })
public class Error extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Error() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String message = request.getParameter("message");
		session.setAttribute("exp", "Bla bla!!!");
		request.setAttribute("expe",session.getAttribute("exp"));
		request.setAttribute("message",message);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
