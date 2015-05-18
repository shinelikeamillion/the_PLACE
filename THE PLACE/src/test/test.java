package test;

import bean.PlayerInfo;
import bean.PostInfo;
import biz.PlayerInfoBiz;
import biz.PostInfoBiz;
import dao.PlayersInfoDAO;
import dao.UserInfoDAO;

public class test {
	public static void main(String[] args) {
//		System.out.println(new PlayerInfoBiz().findPlayerInfoByName("Yao Ming").getPlayer_face());
		
//		System.out.println(new RecordsInfoBiz().findRecordList().get(0).getRecord_date());
		
//		UserInfo userInfo = new UserInfo();
//		userInfo.setUser_email("940788048@qq.com");
//		userInfo.setUser_password("123456");
//		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_postNum());
//		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_follwingNum());
//		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_follwedNUm());
//		System.out.println(new UserInfoBiz().checkLogin(userInfo).getUser_id());
		
//		System.out.println(new PlayersInfoDAO().findPlayerInfoByName("Michael Jeffrey Jordan"));
		
//		System.out.println(new UserInfoDAO().findFollowed(1));
		
//		for (PlayerInfo info : new PlayerInfoBiz().findPlayerInfoByPoint("")) {
			
//			System.out.print(info.getPlayer_country());
//			System.out.print(info.getPlayer_name());
//			System.out.print(info.getUser_pro());
//			System.out.print(info.getUser_sex());
//			System.out.print(info.getUser_age());
//			System.out.println();
//		}
		
		for (PostInfo info : new PostInfoBiz().findPostsInfoByPoint("感谢")) {
		
			System.out.print(info.getPost_date());
			System.out.print(info.getPost_pics());
			System.out.println();
		}
		
	}
}
