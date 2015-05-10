package biz;

import bean.RecordsInfo;
import dao.RecordsInfoDAO;

public class RecordsInfoBiz {
	RecordsInfoDAO recordsInfoDAO = new RecordsInfoDAO();
	
	//想记录表里面添加记录
	public void addRecords (RecordsInfo record) {
		recordsInfoDAO.addRecords(record);
	}
}
