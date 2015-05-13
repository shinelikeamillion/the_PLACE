package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecordsInfo;
import biz.RecordsInfoBiz;

@WebServlet("/addRecordsServlet")
public class addRecordsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RecordsInfo recordsInfo = new RecordsInfo();
	RecordsInfoBiz recordsInfoBiz = new RecordsInfoBiz();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		recordsInfo.setRecord_date(request.getParameter("record_date"));
		recordsInfo.setRecord(new String(request.getParameter("record").getBytes("ISO-8859-1"), "utf-8"));
		recordsInfo.setRecord_url(request.getParameter("record_url"));
		
		recordsInfoBiz.addRecords(recordsInfo);
		
		response.sendRedirect("back/RecordsManagement.jsp");
	}

}