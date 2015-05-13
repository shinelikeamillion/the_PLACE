package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RecordsInfo;
import biz.RecordsInfoBiz;

@WebServlet("/FindRecordsServlet")
public class FindRecordsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private RecordsInfoBiz recordsInfoBiz = new RecordsInfoBiz();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RecordsInfo> recordList = recordsInfoBiz.findRecordList();
		
		request.getSession().setAttribute("ALL_RECORDS_LIST", recordList);
		
		response.sendRedirect("back/RecordsManagement.jsp");
	}

}
