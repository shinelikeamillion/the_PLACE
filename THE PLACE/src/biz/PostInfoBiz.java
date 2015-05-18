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
	
	//查询用户的推文
		public List<PostInfo> findPostsInfoByPoint(String point) {
			return postsInfoDAO.findPostsInfoByPoint(point);
		}
	
	//用户发表推文
		public boolean post(PostInfo postInfo) {
			return postsInfoDAO.post(postInfo);
		}
}
