package biz;

import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

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
	
	//通过id查询用户信息
	public UserInfo findUserInfo (int id) {
		return uidao.findUserInfo(id);
	}
	
	//给用户对象添加属性
	public UserInfo improveUserInfo(UserInfo userInfo) {
		int id = userInfo.getUser_id();
		userInfo.setUser_postNum(uidao.findPostNum(id));
		userInfo.setUser_follwingNum(uidao.findFollowing(id));
		userInfo.setUser_follwedNUm(uidao.findFollowed(id));
		return userInfo;
	}
	
	//遍历出所有的用户信息（管理员）有用模糊查询
	public List<UserInfo> findAllUsersInfo (String point) {
		return uidao.findAllUserInfo(point);
	}
}
