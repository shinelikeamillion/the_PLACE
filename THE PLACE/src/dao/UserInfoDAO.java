package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBManager;
import bean.UserInfo;
import biz.PostInfoBiz;

public class UserInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	//遍历所有用户的所有的信息
	public List<UserInfo> findAllUserInfo (String point) {
		//模糊关键词
		point = "%"+point+"%";
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.users where user_name like ? or user_sex like ? or user_email like ?";
		List<UserInfo> allUserList = new ArrayList<UserInfo>();
		UserInfo userInfo;

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, point);
			preparedStatement.setString(2, point);
			preparedStatement.setString(3, point);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				userInfo = new UserInfo();
				userInfo.setUser_id(resultSet.getInt(1));
				userInfo.setUser_name(resultSet.getString(2));
				userInfo.setUser_age(resultSet.getInt(4));
				userInfo.setUser_sex(resultSet.getString(5));
				userInfo.setUser_email(resultSet.getString(6));
				userInfo.setUser_face(resultSet.getString(7));
				userInfo.setUser_pro(resultSet.getString(8));
				userInfo.setReg_time(resultSet.getString(9));
				allUserList.add(userInfo);
			} 
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return allUserList;
	}	
	
	//查询用户信息
	public UserInfo findUserInfo (int id) {
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.users where user_id="+id;
		UserInfo userInfo = new UserInfo();

		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				userInfo.setUser_id(resultSet.getInt(1));
				userInfo.setUser_name(resultSet.getString(2));
				userInfo.setUser_age(resultSet.getInt(4));
				userInfo.setUser_sex(resultSet.getString(5));
				userInfo.setUser_email(resultSet.getString(6));
				userInfo.setUser_face(resultSet.getString(7));
				userInfo.setUser_pro(resultSet.getString(8));
				userInfo.setReg_time(resultSet.getString(9));
			} 
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return userInfo;
	}
	
	//检查用户登录
	public UserInfo checkLogin(UserInfo userInfo) {
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.users where user_email=? and user_password=?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userInfo.getUser_email());
			preparedStatement.setString(2, userInfo.getUser_password());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				userInfo.setUser_id(resultSet.getInt(1));
				userInfo.setUser_name(resultSet.getString(2));
				userInfo.setUser_age(resultSet.getInt(4));
				userInfo.setUser_sex(resultSet.getString(5));
				userInfo.setUser_face(resultSet.getString(7));
				userInfo.setUser_pro(resultSet.getString(8));
				userInfo.setReg_time(resultSet.getString(9));
//这个方式关闭时会有冲突--放弃!
//				userInfo.setUser_postNum(findPostNum(resultSet.getInt(1)));
//				userInfo.setUser_follwingNum(findFollowing(resultSet.getInt(1)));
//				userInfo.setUser_follwedNUm(findFollowed(resultSet.getInt(1)));
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
		String sql = "insert into the_place.users "
				+ "(user_name, user_email, user_password, user_pro, user_age, user_sex, reg_time) "
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
			return false;
		} finally {
			DBManager.close(connection, preparedStatement);
		}
		return true;
	}
	
	//跟新用户信息
	public boolean updateUserInfo(UserInfo userInfo) {
		connection = DBManager.getconConnection();
		String sql = "insert into the_place.users "
				+ "(user_name, user_email, user_password, user_pro, user_age, user_sex, reg_time) "
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
			return false;
		} finally {
			DBManager.close(connection, preparedStatement);
		}
		return true;
	}
	
	//查询用户的发帖数
	public int findPostNum(int id) {
		int postnum = 0;
		
		postnum = new PostInfoBiz().findUserPostsById(id).size();
		
//好蠢哦		
//		connection = DBManager.getconConnection();
//		String sql = "select count(*) from the_place.news where owner_id="+id;
//		try {
//			preparedStatement = connection.prepareStatement(sql);
//			resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				postnum = resultSet.getInt(1);
//			}
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		} finally {
//			DBManager.close(connection, preparedStatement, resultSet);
//		}
		return postnum;
	}
	//查询用户follow人数
		public List<UserInfo> findFollowing(int id) {
			List<UserInfo> userInfoList = new ArrayList<UserInfo>();
			UserInfo userInfo;
			connection = DBManager.getconConnection();
			String sql = "SELECT * FROM the_place.users WHERE user_id IN (SELECT friend_id FROM the_place.relationship WHERE my_id =?)";
			
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					userInfo = new UserInfo();
					userInfo.setUser_id(resultSet.getInt(1));
					userInfo.setUser_name(resultSet.getString(2));
					userInfo.setUser_age(resultSet.getInt(4));
					userInfo.setUser_sex(resultSet.getString(5));
					userInfo.setUser_email(resultSet.getString(6));
					userInfo.setUser_face(resultSet.getString(7));
					userInfo.setUser_pro(resultSet.getString(8));
					userInfoList.add(userInfo);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				DBManager.close(connection, preparedStatement, resultSet);
			}
			return userInfoList;
		}
		
	//查询用户被follow的人数
		public List<UserInfo> findFollowed(int id) {
			List<UserInfo> userInfoList = new ArrayList<UserInfo>();
			UserInfo userInfo;
			connection = DBManager.getconConnection();
			String sql = "SELECT * FROM the_place.users WHERE user_id IN (SELECT friend_id FROM the_place.relationship WHERE friend_id =?)";
			
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					userInfo = new UserInfo();
					userInfo.setUser_id(resultSet.getInt(1));
					userInfo.setUser_name(resultSet.getString(2));
					userInfo.setUser_age(resultSet.getInt(4));
					userInfo.setUser_sex(resultSet.getString(5));
					userInfo.setUser_email(resultSet.getString(6));
					userInfo.setUser_face(resultSet.getString(7));
					userInfo.setUser_pro(resultSet.getString(8));
					userInfoList.add(userInfo);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				DBManager.close(connection, preparedStatement, resultSet);
			}
			return userInfoList;
		}
}
