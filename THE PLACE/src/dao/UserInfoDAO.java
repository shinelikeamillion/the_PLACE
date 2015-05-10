package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBManager;
import bean.UserInfo;

public class UserInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	//检查用户登录
	public UserInfo checkLogin(UserInfo userInfo) {
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.users where user_name=? and user_password=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUser_name());
			preparedStatement.setString(2, userInfo.getUser_password());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				userInfo.setUser_id(resultSet.getInt(1));
				userInfo.setUser_age(resultSet.getInt(4));
				userInfo.setUser_sex(resultSet.getString(5));
				userInfo.setUser_email(resultSet.getString(6));
				userInfo.setUser_face(resultSet.getString(7));
				userInfo.setUser_pro(resultSet.getString(8));
				userInfo.setReg_time(resultSet.getString(9));
			} else {
				userInfo = null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return userInfo;
	}

	//用户注册
	public boolean signUp(UserInfo userInfo) {
		connection = DBManager.getconConnection();
		String sql = "insert into the_place.users (user_name, user_email, user_password, user_pro, user_age, user_sex, reg_time) "
				+ "values( ?, ?, ?, ?, ?, ?, NOW())";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUser_name());
			preparedStatement.setString(2, userInfo.getUser_email());
			preparedStatement.setString(3, userInfo.getUser_password());
			preparedStatement.setString(4, userInfo.getUser_pro());
			preparedStatement.setInt(5, userInfo.getUser_age());
			preparedStatement.setString(6, userInfo.getUser_sex());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement);
		}
		return true;
	}
}
