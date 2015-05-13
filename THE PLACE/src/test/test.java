package test;

import biz.PlayerInfoBiz;
import biz.RecordsInfoBiz;



public class test {
	public static void main(String[] args) {
//		System.out.println(new PlayerInfoBiz().findPlayerInfoByName("Yao Ming").getPlayer_face());
		System.out.println(new RecordsInfoBiz().findRecordList().get(0).getRecord_date());
	}
}
