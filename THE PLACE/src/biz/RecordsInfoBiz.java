package biz;

import java.util.List;

import bean.RecordsInfo;
import dao.RecordsInfoDAO;

public class RecordsInfoBiz {
	RecordsInfoDAO recordsInfoDAO = new RecordsInfoDAO();
	
	// 添加记录
	public void addRecords (RecordsInfo record) {
		recordsInfoDAO.addRecords(record);
	}
	
//	遍历记录
	public List<RecordsInfo> findRecordList(String point) {
		return recordsInfoDAO.findRecordList(point);
	}
}
