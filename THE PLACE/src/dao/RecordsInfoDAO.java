package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBManager;
import bean.RecordsInfo;

public class RecordsInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
//	插入记录数据
	public void addRecords (RecordsInfo record) {
		connection = DBManager.getconConnection();
		String sql = "insert into the_place.records values(null, ?, ?, ?)";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, record.getRecord_date());
			preparedStatement.setString(2, record.getRecord_date());
			preparedStatement.setString(3, record.getRecord_url());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement);
		}
	}
}
