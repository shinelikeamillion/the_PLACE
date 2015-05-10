package test;

import bean.UserInfo;
import biz.UserInfoBiz;

public class test {
	public static void main(String[] args) {
		UserInfo ui = new UserInfo();
		ui.setUser_name("¡ı∑…");
		ui.setUser_password("123456");
		System.out.println(new UserInfoBiz().checkLogin(ui).getUser_email());
	}
}
