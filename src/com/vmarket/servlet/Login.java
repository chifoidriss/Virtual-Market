package com.vmarket.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vmarket.models.UserModel;

@WebServlet({ "/login", "/Login", "/LOGIN" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserModel u;
	
    public Login() {
        super();
        u = new UserModel();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	request.setAttribute("ephone",request.getParameter("ephone"));
		this.getServletContext().getRequestDispatcher("/WEB-INF/page/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession(true);
		u.connecter(request);
		boolean b = u.connecter(request);
		if(b) {
			response.sendRedirect("home");
		}else {
			doGet(request, response);
		}
	}

}
