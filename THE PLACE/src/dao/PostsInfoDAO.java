package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PostInfo;
import biz.UserInfoBiz;
import db.DBManager;

public class PostsInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	public boolean post (PostInfo postInfo) {
		connection = DBManager.getconConnection();
		String sql = "insert into the_place.news values (null, ?, ?, ?, ?, ?, ?, NOW())";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, postInfo.getOwner_id() );
			preparedStatement.setString(2, postInfo.getPost_title() );
			preparedStatement.setString(3, postInfo.getPost_pics() );
			preparedStatement.setString(4, postInfo.getPost_video() );
			preparedStatement.setString(5, postInfo.getPost_content() );
			preparedStatement.setString(6, postInfo.getPost_tags() );
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		} finally {
			DBManager.close(connection, preparedStatement);
		}
		System.out.println(postInfo.getPost_content());
		System.out.println(postInfo.getPost_tags());
		System.out.println(postInfo.getPost_title());
		System.out.println(postInfo.getPost_pics());
		System.out.println(postInfo.getPost_content());
		return false;
	}
	
	// 通过id遍历用户的推文
	public List<PostInfo> findUserPostsInfoById(int id) {
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.news where owner_id=? order by news_date desc";
		List<PostInfo> postsInfoList = new ArrayList<PostInfo>();

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				PostInfo postInfo = new PostInfo();
				postInfo.setPost_id(resultSet.getInt(1));
				postInfo.setOwner_id(resultSet.getInt(2));
				postInfo.setPost_title(resultSet.getString(3));
				postInfo.setPost_pics(resultSet.getString(4));
				postInfo.setPost_video(resultSet.getString(5));
				postInfo.setPost_content(resultSet.getString(6));
				postInfo.setPost_tags(resultSet.getString(7));
				postInfo.setPost_date(resultSet.getString(8));
				postInfo.setPost_liked(resultSet.getInt(9));
				postInfo.setOwnerInfo(new UserInfoDAO().findUserInfo(id));
				postsInfoList.add(postInfo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}

		return postsInfoList;
	}

	// 模糊查询用户的推文
	public List<PostInfo> findPostsInfoByPoint(String point) {
		point = "%"+point+"%";
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.news where news_title like ? or news_tags like ? or news_text like ? order by news_date desc";
		List<PostInfo> postsInfoList = new ArrayList<PostInfo>();

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, point);
			preparedStatement.setString(2, point);
			preparedStatement.setString(3, point);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				PostInfo postInfo = new PostInfo();
				postInfo.setPost_id(resultSet.getInt(1));
				postInfo.setOwner_id(resultSet.getInt(2));
				postInfo.setPost_title(resultSet.getString(3));
				postInfo.setPost_pics(resultSet.getString(4));
				postInfo.setPost_video(resultSet.getString(5));
				postInfo.setPost_content(resultSet.getString(6));
				postInfo.setPost_tags(resultSet.getString(7));
				postInfo.setPost_date(resultSet.getString(8));
				postInfo.setPost_liked(resultSet.getInt(9));
				postInfo.setOwnerInfo(new UserInfoDAO().findUserInfo(resultSet.getInt(2)));
				postsInfoList.add(postInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}

		return postsInfoList;
	}
	
	// 遍历好友的推文方法有些蠢,不过能用
	public List<PostInfo> findFriendsPostsInfoById(int id) {
		connection = DBManager.getconConnection();
		UserInfoBiz userInfoBiz = new UserInfoBiz();
		
		String sql = "SELECT * FROM the_place.news WHERE owner_id = ? or owner_id IN "
				+ "(SELECT friend_id  FROM the_place.relationship WHERE my_id=? and state=1) "
				+ "order by news_date desc";
		List<PostInfo> postsInfoList = new ArrayList<PostInfo>();

		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.setInt(2, id);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				PostInfo postInfo = new PostInfo();
				postInfo.setPost_id(resultSet.getInt(1));
				postInfo.setOwner_id(resultSet.getInt(2));
				postInfo.setPost_title(resultSet.getString(3));
				postInfo.setPost_pics(resultSet.getString(4));
				postInfo.setPost_video(resultSet.getString(5));
				postInfo.setPost_content(resultSet.getString(6));
				postInfo.setPost_tags(resultSet.getString(7));
				postInfo.setPost_date(resultSet.getString(8));
				postInfo.setPost_liked(resultSet.getInt(9));
				postInfo.setOwnerInfo(userInfoBiz.findUserInfo(resultSet.getInt(2)));
				postsInfoList.add(postInfo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}

		return postsInfoList;
	}
}

/**
 * 下面这个实现起来简单又重复利用代码,但是还没有优化好,赶进度,只能用上面这个先
 */

////遍历好友的推文
//public List<PostInfo> findFriendsPostsInfoById(int id) {
//	connection = DBManager.getconConnection();
//	String sql = "SELECT friend_id  FROM the_place.relationship WHERE my_id=? and state=1";
//	PostInfo postInfo = new PostInfo();
//	List<PostInfo> postsInfoList = new ArrayList<PostInfo>();
//	
//	try {
//		preparedStatement = connection.prepareStatement(sql);
//		preparedStatement.setInt(1, id);
//		resultSet = preparedStatement.executeQuery();
//		while (resultSet.next()) {
//			postsInfoList = findUserPostsInfoById(resultSet.getInt(1));
//		}
//	} catch (SQLException e) {
//		System.out.println(e.getMessage());
//	} finally {
//		DBManager.close(connection, preparedStatement, resultSet);
//	}
//	
//	return postsInfoList;
//}
