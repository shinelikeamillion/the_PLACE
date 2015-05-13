package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PlayerInfo;
import db.DBManager;

public class PlayersInfoDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	//遍历出运动员的名字
	public List<String> findPlayerNames () {
		List<String> playerNames = null;
		connection = DBManager.getconConnection();
		String sql = "select player_name from the_place.players";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			playerNames = new ArrayList<String>();
			while (resultSet.next()) {
				playerNames.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return playerNames;
	}
	
	//通过运动员的名字查到所有资料
	public PlayerInfo findPlayerInfoByName (String name) {
		PlayerInfo playerInfo = new PlayerInfo();
		connection = DBManager.getconConnection();
		String sql = "select * from the_place.players where player_name = '"+name+"'";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				playerInfo.setPlayer_id(resultSet.getInt(1));
				playerInfo.setPlayer_name(resultSet.getString(2));
				playerInfo.setPlayer_country(resultSet.getString(3));
				playerInfo.setPlayer_height(resultSet.getDouble(4));
				playerInfo.setPlayer_weight(resultSet.getDouble(5));
				playerInfo.setPlayer_team(resultSet.getString(6));
				playerInfo.setPlayer_specialty(resultSet.getString(7));
				playerInfo.setPlayer_prefession(resultSet.getString(8));
				playerInfo.setPlayer_face(resultSet.getString(9));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			DBManager.close(connection, preparedStatement, resultSet);
		}
		return playerInfo;
	}
}
