package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AdminInfo;
import bean.UserInfo;
import biz.AdminInfoBiz;
import biz.UserInfoBiz;


@WebServlet("/CheckLoginServlt")
public class CheckLoginServlt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html ; charset=urf-8");
	
		UserInfo userInfo = new UserInfo();
		userInfo.setUser_email(request.getParameter("email"));
		userInfo.setUser_password(request.getParameter("password"));
		
		//判断是管理员还是用户登录
		AdminInfo adminInfo = new AdminInfo();
		AdminInfoBiz adminInfoBiz = new AdminInfoBiz();
		adminInfo = adminInfoBiz.checkAdminLogin(userInfo);
		UserInfoBiz userInfoBiz = new UserInfoBiz();
		userInfo = userInfoBiz.checkLogin(userInfo);
		
		if (adminInfo != null) {
			System.out.println("登录成功");
			request.getSession().setAttribute("ADMININFO", adminInfo);
			response.sendRedirect("back/AccountManagement.jsp");
		}  else if ( userInfo != null ) {
			if ((int)userInfo.getUser_status() == 1) {
				response.sendRedirect("Signin.jsp?erroMsg=3");
			} else {
				userInfo = userInfoBiz.improveUserInfo(userInfo);
				
				request.getSession().setAttribute("USERINFO", userInfo);
				response.sendRedirect("index.jsp");
			}
		} else {
			response.sendRedirect("Signin.jsp?erroMsg=1");
		}
//		System.out.println(request.getParameter("email"));
	}

}
