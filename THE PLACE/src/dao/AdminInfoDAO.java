package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBManager;
import bean.AdminInfo;
import bean.UserInfo;

public class AdminInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	public AdminInfo checkAdminLogin(UserInfo userInfo) {
		System.out.println(userInfo.getUser_email());
		AdminInfo adminInfo = new AdminInfo();
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.admins where admin_email=? and admin_password=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUser_email());
			preparedStatement.setString(2, userInfo.getUser_password());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				adminInfo.setAdmin_id(resultSet.getInt(1));
				adminInfo.setAdmin_name(resultSet.getString(2));
				adminInfo.setAdmin_password(resultSet.getString(3));
				adminInfo.setAdmin_email(resultSet.getString(4));
			} else {
				adminInfo = null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return adminInfo;
	}
}
