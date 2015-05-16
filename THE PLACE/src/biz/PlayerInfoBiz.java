package biz;

import java.util.List;

import bean.PlayerInfo;
import dao.PlayersInfoDAO;

public class PlayerInfoBiz {
	PlayersInfoDAO playersInfoDAO = new PlayersInfoDAO();
	
	public List<String> findPlayerName () {
		return playersInfoDAO.findPlayerNames();
	}
	
	public PlayerInfo findPlayerInfoByName (String name) {
		return playersInfoDAO.findPlayerInfoByName(name);
	}
	
	public List<PlayerInfo> findPlayerInfoByPoint (String point) {
		return playersInfoDAO.findPlayerInfoByPoint(point);
	}
}

