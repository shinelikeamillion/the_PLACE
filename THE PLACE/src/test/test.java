package test;

import dao.UserInfoDAO;
import servlet.CheckLoginServlt;
import bean.UserInfo;
import biz.AdminInfoBiz;
import biz.PlayerInfoBiz;
import biz.PostInfoBiz;
import biz.RecordsInfoBiz;
import biz.UserInfoBiz;



public class test {
	public static void main(String[] args) {
//		System.out.println(new PlayerInfoBiz().findPlayerInfoByName("Yao Ming").getPlayer_face());
		
//		System.out.println(new RecordsInfoBiz().findRecordList().get(0).getRecord_date());
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUser_email("940788048@qq.com");
		userInfo.setUser_password("123456");
		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_postNum());
		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_follwingNum());
		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_follwedNUm());
		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_id());
		
//		System.out.println(new PostInfoBiz().findFriendsPostsById(1).get(0).getOwnerInfo().getUser_name());
		
//		System.out.println(new UserInfoDAO().findFollowed(1));
	}
}
