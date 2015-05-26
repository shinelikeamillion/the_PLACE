package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserInfo;
import biz.UserInfoBiz;

@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String my_id = ((UserInfo)request.getSession().getAttribute("USERINFO")).getUser_id().toString();
		String friend_id = request.getParameter("friend_id");
		String status = request.getParameter("status");
		boolean isFollow = true;
		if (status.equals("Following")) {
			isFollow = false;
		}
		System.out.println(isFollow);
		new UserInfoBiz().follow(my_id, friend_id, isFollow);
		new UserInfoBiz().improveUserInfo((UserInfo)request.getSession().getAttribute("USERINFO"));
	}

}
