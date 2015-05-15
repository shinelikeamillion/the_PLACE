package biz;

import java.util.List;

import bean.PostInfo;
import dao.PostsInfoDAO;

public class PostInfoBiz {
	PostsInfoDAO postsInfoDAO = new PostsInfoDAO();
	
	//通过id遍历出用户的推文
	public List<PostInfo> findUserPostsById(int id) {
		return postsInfoDAO.findUserPostsInfoById(id);
	}
	
	//通过id遍历出好友的推文
	public List<PostInfo> findFriendsPostsById(int id) {
		return postsInfoDAO.findFriendsPostsInfoById(id);
	}
}
