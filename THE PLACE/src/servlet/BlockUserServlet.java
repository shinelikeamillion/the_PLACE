package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.AdminInfoBiz;

@WebServlet("/BlockUserServlet")
public class BlockUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		AdminInfoBiz adminInfoBiz = new AdminInfoBiz();
		String userId = request.getParameter("userId");
		String isBlock = request.getParameter("isBlock");
		
		String data = adminInfoBiz.blockUser(userId, isBlock);
		writer.write(data);
	}
}
