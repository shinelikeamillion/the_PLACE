package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserInfo;
import biz.UserInfoBiz;

@WebServlet("/addUsersServlet")
public class addUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserInfoBiz userInfoBiz = new UserInfoBiz();
	UserInfo user = new UserInfo();

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		user.setUser_name(request.getParameter("user_name"));
		user.setUser_email(request.getParameter("user_email"));
		user.setUser_password(request.getParameter("user_password"));
		user.setUser_pro(request.getParameter("user_pro"));
		user.setUser_sex(request.getParameter("user_sex"));
		user.setUser_age(Integer.parseInt(request.getParameter("user_age")));
		
		userInfoBiz.signUp(user);
		
		session.setAttribute("USER", user);
		
		response.sendRedirect("Signup.jsp");
	}

}
