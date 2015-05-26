package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserInfo;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//退出
		ServletContext application=this.getServletContext();
		HttpSession session = request.getSession();
		if ( session.getAttribute("USERINFO") != null ) {
			//application中移除用户信息
			List<UserInfo> users =(List<UserInfo>) application.getAttribute("USERS");
			if(users != null){  
				users.remove((UserInfo)session.getAttribute("USERINFO"));  
			} 
			
			request.getSession().removeAttribute("USERINFO");
		} else if ( session.getAttribute("ADMININFO") != null ) {
			request.getSession().removeAttribute("ADMININFO");
		}
		response.sendRedirect("Signin.jsp");
	}

}
