package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.PostInfo;
import biz.PostInfoBiz;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostInfo postInfo = new PostInfo();
	PostInfoBiz postInfoBiz = new PostInfoBiz();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter outWriter = response.getWriter();
		
		postInfo.setOwner_id(Integer.parseInt(request.getParameter("owner_id")));
		postInfo.setPost_title(request.getParameter("post_title"));
		postInfo.setPost_pics(request.getParameter("post_pics"));
		postInfo.setPost_pics(request.getParameter("post_video"));
		postInfo.setPost_content(request.getParameter("post_content"));
		postInfo.setPost_tags(request.getParameter("post_tags"));
		
		boolean isScuessed = postInfoBiz.post(postInfo);
		
		outWriter.write(isScuessed+"");
	}

}
