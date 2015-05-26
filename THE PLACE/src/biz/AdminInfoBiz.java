package biz;

import java.util.List;

import bean.AdminInfo;
import bean.UserInfo;
import dao.AdminInfoDAO;

public class AdminInfoBiz {
	AdminInfoDAO adminInfoDAO = new AdminInfoDAO();
	
	//遍历管理员
	public List<AdminInfo> findAllAdmin(String point){
		return adminInfoDAO.findAllAdmin(point);
	}
	
	//检查管理员登录
	public AdminInfo checkAdminLogin(UserInfo userInfo) {
		return adminInfoDAO.checkAdminLogin(userInfo);
	}
	
	//屏蔽和取消屏蔽
		public String blockPost(String id, String Block){
			int postId = Integer.parseInt(id);
			boolean isBlock = new Boolean(Block);
			
			if (adminInfoDAO.blockpost(postId, isBlock)) {
				if (isBlock) {
					return "已经被您屏蔽掉";
				} else {
					return "已经被您取消屏蔽";
				}
			}
			return "操作失败 ：(";
		}
	
	//拉黑和取消拉黑用户
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
