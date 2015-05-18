package biz;

import java.util.ArrayList;
import java.util.List;

import bean.UserInfo;
import dao.UserInfoDAO;

public class UserInfoBiz {
	UserInfoDAO uidao = new UserInfoDAO();
	
	//follow or unfollow
	public void follow (String my_id, String friend_id, boolean isFollow) {
		int myId = Integer.parseInt(my_id);
		int friendId = Integer.parseInt(friend_id);
		
		uidao.followOthers(myId, friendId, isFollow);
	}
	
	//登录
	public UserInfo checkLogin (UserInfo user) {
		return uidao.checkLogin(user);
	}
	
	//注册
	public boolean signUp (UserInfo user) {
		return uidao.signUp(user);
	}
	
	//通过id查询用户信息
	public UserInfo findUserInfo (int id) {
		return uidao.findUserInfo(id);
	}
	
	//给用户对象添加属性
	public UserInfo improveUserInfo(UserInfo userInfo) {
		int id = userInfo.getUser_id();
		
		userInfo.setUser_postNum(uidao.findPostNum(id));
		userInfo.setUser_follwingNum(uidao.findFollowing(id).size());
		userInfo.setUser_follwedNum(uidao.findFollowed(id).size());
		
//		把用户好友的列表存入用户
		List<Integer> friendsId = new ArrayList<Integer>();
		for (UserInfo info : new UserInfoDAO().findFollowing(id)) {
			friendsId.add(info.getUser_id());
		}
		userInfo.setFriendsId(friendsId);
		
		return userInfo;
	}
	
	//遍历出所有的用户信息（管理员）有用模糊查询
	public List<UserInfo> findAllUsersInfo (String point) {
		return uidao.findAllUserInfo(point);
	}
}
