package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//退出
		
		HttpSession session = request.getSession();
		if ( session.getAttribute("USERINFO") != null ) {
			request.getSession().removeAttribute("USERINFO");
		} else if ( session.getAttribute("ADMININFO") != null ) {
			request.getSession().removeAttribute("ADMININFO");
			response.sendRedirect("back/AccountManagement.jsp");
		}
	}

}
