package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;

import bean.ChatInfo;
import bean.UserInfo;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		UserInfo userInfo = (UserInfo)request.getSession().getAttribute("USERINFO");
		String content = request.getParameter("content");
		
		ServletContext application = this.getServletContext();
		 List<String> contentList =(List<String>)application.getAttribute("contentList");
		if (contentList == null){
			 contentList = new ArrayList<String>();
		}
		if (content != null) {
			String data = "<div class=\"content\">"
					+ "<img title="+userInfo.getUser_name()+" src="+userInfo.getUser_face()+" /> "
					+ "<input value="+content+" readonly=\"true\" /></div>";
			contentList.add(data);
		}
		application.setAttribute("contentList", contentList);
			
		StringBuffer sb=new StringBuffer();
		for(String s:contentList){  
			sb.append(s);  
		}  
		writer.write( sb.toString());
	}

}
