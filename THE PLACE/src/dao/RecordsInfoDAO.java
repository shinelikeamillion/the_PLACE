package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import bean.RecordsInfo;

public class RecordsInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
//	添加记录
	public void addRecords (RecordsInfo record) {
		connection = DBManager.getconConnection();
		String sql = "insert into the_place.records values(null, ?, ?, ?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, record.getRecord_date());
			preparedStatement.setString(2, record.getRecord());
			preparedStatement.setString(3, record.getRecord_url());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement);
		}
	}
	
//	遍历记录
	public List<RecordsInfo> findRecordList (String point) {
		point = "%"+point+"%";
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.records where record_date like ? or record like ? order by record_date desc";
		List<RecordsInfo> recordsInfoList = new ArrayList<RecordsInfo>();
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, point);
			preparedStatement.setString(2, point);
			resultSet = preparedStatement.executeQuery();
			RecordsInfo recordsInfo;
			while (resultSet.next()) {
				recordsInfo = new RecordsInfo();
				recordsInfo.setRecord_id(resultSet.getInt(1));
				recordsInfo.setRecord_date(resultSet.getString(2));
				recordsInfo.setRecord(resultSet.getString(3));
				recordsInfo.setRecord_url(resultSet.getString(4));
				recordsInfoList.add(recordsInfo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return recordsInfoList;
	}
}
