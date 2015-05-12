package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.AddDefaultCharsetFilter.ResponseWrapper;

import bean.PlayerInfo;
import bean.UserInfo;
import biz.PlayerInfoBiz;

@WebServlet("/findPlayerByNameServlet")
public class findPlayerByNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PlayerInfo playerInfo = new PlayerInfo();
	PlayerInfoBiz playerInfoBiz = new PlayerInfoBiz();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String playerName = request.getParameter("playerName");
		
		playerInfo = playerInfoBiz.findPlayerInfoByName(playerName);
		request.getSession().setAttribute("playerInfo", playerInfo);
		
		System.out.println(playerName);
		
		out.print(playerInfo);
		
	}

}
