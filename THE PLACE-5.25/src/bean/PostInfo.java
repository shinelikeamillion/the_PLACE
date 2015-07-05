package bean;

public class PostInfo {
	private Integer post_id;
	private Integer owner_id;
	private String post_title;
	private String post_pics;
	private String post_video;
	private String post_content;
	private String post_tags;
	private String post_date;
	private Integer post_liked;
	private Integer post_shared;
	private Integer post_comment;
	private Integer post_type;
	private UserInfo ownerInfo;
	private Integer post_status;
	
	public UserInfo getOwnerInfo() {
		return ownerInfo;
	}
	public void setOwnerInfo(UserInfo userInfo) {
		this.ownerInfo = userInfo;
	}
	public Integer getPost_id() {
		return post_id;
	}
	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}
	public Integer getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(Integer owner_id) {
		this.owner_id = owner_id;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_pics() {
		return post_pics;
	}
	public void setPost_pics(String post_pics) {
		this.post_pics = post_pics;
	}
	public String getPost_video() {
		return post_video;
	}
	public void setPost_video(String post_video) {
		this.post_video = post_video;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_tags() {
		return post_tags;
	}
	public void setPost_tags(String post_tags) {
		this.post_tags = post_tags;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public Integer getPost_liked() {
		return post_liked;
	}
	public void setPost_liked(Integer post_liked) {
		this.post_liked = post_liked;
	}
	public Integer getPost_shared() {
		return post_shared;
	}
	public void setPost_shared(Integer post_shared) {
		this.post_shared = post_shared;
	}
	public Integer getPost_comment() {
		return post_comment;
	}
	public void setPost_comment(Integer post_comment) {
		this.post_comment = post_comment;
	}
	public Integer getPost_type() {
		return post_type;
	}
	public void setPost_type(Integer post_type) {
		this.post_type = post_type;
	}
	public Integer getPost_status() {
		return post_status;
	}
	public void setPost_status(Integer post_status) {
		this.post_status = post_status;
	}
	
	
}
