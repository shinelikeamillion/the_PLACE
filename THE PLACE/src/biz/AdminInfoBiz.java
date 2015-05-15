package biz;

import dao.AdminInfoDAO;
import bean.AdminInfo;
import bean.UserInfo;

public class AdminInfoBiz {
	AdminInfoDAO adminInfoDAO = new AdminInfoDAO();
	//检查管理员登录
	public AdminInfo checkAdminLogin(UserInfo userInfo) {
		return adminInfoDAO.checkAdminLogin(userInfo);
	}
}
