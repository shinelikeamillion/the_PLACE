package test;

import biz.PlayerInfoBiz;



public class test {
	public static void main(String[] args) {
		System.out.println(new PlayerInfoBiz().findPlayerInfoByName("Yao Ming").getPlayer_face());
	}
}
