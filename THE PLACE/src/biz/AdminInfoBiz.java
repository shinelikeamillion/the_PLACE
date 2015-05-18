package biz;

import bean.AdminInfo;
import bean.UserInfo;
import dao.AdminInfoDAO;

public class AdminInfoBiz {
	AdminInfoDAO adminInfoDAO = new AdminInfoDAO();
	//检查管理员登录
	public AdminInfo checkAdminLogin(UserInfo userInfo) {
		return adminInfoDAO.checkAdminLogin(userInfo);
	}
	
	//拉黑和取消拉黑
	public String blockUser(String id, String Block){
		int userId = Integer.parseInt(id);
		boolean isBlock = new Boolean(Block);
		
		if (adminInfoDAO.blockUser(userId, isBlock)) {
			String userName = new UserInfoBiz().findUserInfo(userId).getUser_name();
			if (isBlock) {
				return userName+"  已经被您拉入黑名单";
			} else {
				return userName+"  已经被您拉出黑名单";
			}
		}
		return "操作失败 ：(";
	}
}
