package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.AdminInfoBiz;


@WebServlet("/BlockPostServlet")
public class BlockPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		AdminInfoBiz adminInfoBiz = new AdminInfoBiz();
		String postId = request.getParameter("postId");
		String isBlock = request.getParameter("isBlock");
		
		String data = adminInfoBiz.blockPost(postId, isBlock);
		writer.write(data);
	}
}
