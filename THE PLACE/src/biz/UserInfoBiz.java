package biz;

import bean.UserInfo;
import dao.UserInfoDAO;

public class UserInfoBiz {
	UserInfoDAO uidao = new UserInfoDAO();
	
	//登录
	public UserInfo checkLogin (UserInfo user) {
		return uidao.checkLogin(user);
	}
	
	//注册
	public boolean signUp (UserInfo user) {
		return uidao.signUp(user);
	}
}
