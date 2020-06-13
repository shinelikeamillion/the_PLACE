<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	int id;
	if (session.getAttribute("USERINFO") == null) {
		response.sendRedirect("Signin.jsp?erroMsg=2");
	} else {
		PostInfoBiz postInfoBiz = new PostInfoBiz();
		id = ((UserInfo)session.getAttribute("USERINFO")).getUser_id();
		List<PostInfo> friendsPostList = new ArrayList<PostInfo>();
		friendsPostList = postInfoBiz.findFriendsPostsById(id);
		
		pageContext.setAttribute("FRIENDS_POSTS_LIST", friendsPostList);
	}
%>

<head>
	<title>index</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="dist/css/material.min.css" rel="stylesheet" type="text/css">

	<style type="text/css">
		html,
		body {
			width: 100%;
			height: 100%;
			margin: 0px;
			background-color: #36465d;
			font-family: 'Open Sans', arial;
		}

		body a {
			color: #9E9E9E;
			text-decoration: none;
		}

		.header-bar {
			top: 0;
			width: 100%;
			min-width: 700px;
			color: #ffffff;
			height: 64px;
			box-shadow: rgba(255, 255, 255, 0.2) 0px 2px 2px;
			background-color: #36465d;
			position: fixed;
			z-index: 2;
		}

		.header-bar div {
			padding: 20px;
			display: inline;
		}

		.logo {
			width: 56px;
			margin: 4px;
			float: left;
			cusor: pointer;
		}

		.logo-search-bar div {
			float: left;
		}

		.search input {
			color: #ffffff;
			font-size: 18px;
			font-weight: 500;
			padding-left: 30px;
			width: 180px;
			height: 30px;
			border: none;
			border-radius: 50%;
			background-color: #1D242D;
			position: absolute;
		}

		.search span {
			font-size: 30px;
			text-align: center;
			color: #9E9E9E;
			position: absolute;
		}

		.user-bar {
			float: right;
		}

		.user-bar div {
			font-size: 25px;
			width: 50px;
			height: 30px;
		}

		.container {
			width: 100%;
			height: 600px;
			background-color: #36465d;
		}

		.discover-posts {
			margin-top: 90px;
			margin-left: 200px;
			margin-right: 50px;
		}

		/*userpost弹窗样式*/
		.user-post {
			float: left;
			padding-top: 20px;
			width: 650px;
		}

		.user-post textarea {
			max-width: 94%;
			margin: 0 20px;
			overflow: auto;
			max-height: 5em;
		}

		.user-face img {
			height: 64px;
			width: 64px;
			float: left;
			border-radius: 3px;
		}

		.user-news {
			width: 540px;
			color: #9E9E9E;
			background-color: #ffffff;
			font-weight: 500;
			float: left;
			margin-left: 20px;
			margin-right: 20px;
			margin-bottom: 20px;
			border-radius: 3px;
		}

		.user-name {
			font-family: "微软雅黑";
			font-weight: 600;
			padding: 10px;
			text-transform: uppercase;
		}

		.user-news img {
			width: 100%;
		}

		.post-title {
			font-size: .8em;
			font-weight: 800;
			padding-left: 20px;
			padding-top: 10px;
			padding-bottom: 10px;
			text-align: left;
		}

		.notes {
			color: #424242;
		}

		.post-footer {
			font-weight: 600;
			padding-left: 20px;
			padding-bottom: 10px;
		}

		#like {
			padding-right: 20px 20px 20px 20px;
			float: right;
			font-size: 25px;
			cursor: pointer;
		}

		.right-banner {
			margin-left: 660px;
			color: #ffffff;
			margin-top: 20px;
			width: 200px;
			position: fixed;
		}

		.post-bubble {
			display: none;
			position: absolute;
			width: 250px;
			height: 80px;
			color: #9E9E9E;
			background-color: #ffffff;
			top: 66px;
			right: 80px;
			border-radius: 3px;
			z-index: 9;
		}

		.post-bubble:before {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 0 10px 10px 10px;
			border-color: transparent transparent #ffffff;
			display: block;
			width: 0;
			z-index: 1;
			left: 193px;
			top: -9px;
		}

		.post-bubble a {
			padding: 20px;
			float: left;
			color: #616161;
			font-size: 40px;
			font-weight: 900;
			text-shadow: 4px 1px rgba(0, 0, 0, .3);
		}

		.post-bubble span {
			position: absolute;
			margin-left: -55px;
			font-weight: 500;
			bottom: 0;
		}

		.face-bubble {
			display: none;
			position: absolute;
			width: 300px;
			height: 180px;
			color: #9E9E9E;
			background-color: #ffffff;
			top: 66px;
			right: 20px;
			z-index: 9;
		}

		.face-bubble:before {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 0 10px 10px 10px;
			border-color: transparent transparent #ffffff;
			display: block;
			width: 0;
			z-index: 1;
			left: 258px;
			top: -9px;
		}

		.user-profile {
			padding: 20px;
		}

		.face-icon {
			width: 90px;
			height: 90px;
			float: left;
		}

		.face-icon img {
			width: 100%;
			height: 100%;
		}

		.change-face {
			top: 92px;
			width: 90px;
			color: #ffffff;
			font-size: 13px;
			font-weight: 600;
			text-align: center;
			background-color: rgba(78, 144, 254, .7);
			position: absolute;
			cursor: pointer;
		}

		.name-email {
			float: left;
			margin-left: 20px;
			font-size: 15px;
		}

		.signout-button {
			width: 100%;
			height: 50px;
			background-color: #BBDEFB;
			bottom: 0px;
			position: absolute;
			text-align: right;
		}

		.signout-button .btn {
			top: -10px;
			height: 50px;
			font-size: 18px;
		}

		.right-banner {
			vertical-align：middle;
		}

		.right-banner a {
			width: 100%;
			font-size: 20px;
			line-height: 20px;
		}

		.right-banner span {
			font-size: 16px;
			float: right;
			line-height: 20px;
		}

		.profile-link {
			color: #ffffff;
			background-color: rgba(78, 144, 254, .7);
			width: 90px;
			height: 20px;
			padding: .5em;
			margin-top: 17px;
			margin-left: 35px;
			position: absolute;
			cursor: pointer;
		}

		.select {
			color: #D84315;
		}

		/*post弹窗样式*/
		/*弹窗背景*/
		.overlay {
			position: fixed;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			z-index: 5;
			background: rgba(0, 0, 0, 0.7);
			-webkit-transition: all 0.3s;
			-moz-transition: all 0.3s;
			transition: all 0.3s;
		}

		.post-dialog {
			min-width: 35%;
			position: fixed;
			margin: 100px 25%;
			display: block;
			box-shadow: #000000;
			color: #a1a1a1;
			text-align: left;
			z-index: 99;
		}

		.post-dialog img {
			width: 54px;
			float: left;
			border-radius: 4px;
		}

		.post-Form {
			width: 70%;
			background: #ffffff;
			margin-left: 30px;
			float: left;
			padding: 10px;
			border-radius: 4px;
			box-shadow: 5px 5px 15px #888888;
		}

		.post-Form input,
		textarea {
			width: 100%;
			border: none;
			padding: 5px;
			margin-top: 2px;
			border-radius: 2px;
		}

		.post-Form textarea {
			color: #a1a1a1;
			font-size: 1.4em;
			font-weight: 300;
		}

		.post-Form a {
			position: absolute;
			font-size: 2em;
		}

		.post-Form .close-btn,
		.submit-btn {
			width: 8%;

		}

		.back-btn {
			opacity: 0;
			cursor: pointer;
		}

		.show {
			opacity: 1;
			visibility: visible;
		}

		.hidden {
			opacity: 0;
			visibility: hidden;
		}

		.like {
			color: #F44336;
		}

		#post-video embed {
			width: 100%;
			height: 350px;
		}
	</style>
</head>

<body>
	<div class="overlay hidden"></div>
	<!--
	作者：XXX@qq.com
	时间：2015-05-16
	描述：导航栏
-->
	<div class="header-bar">
		<a href="index.jsp"><img class="logo" src="images/logo.png" /></a>
		<div class="logo-search-bar">
			<div class="search">
				<div class="search-form">
					<input class="point " type="text" placeholder="Search the PLACE" />
					<span class="mdi-action-find-replace"></span>
					<input type="hidden" />
				</div>
			</div>
		</div>
		<div class="user-bar">
			<div class="">
				<a class="mdi-action-polymer select" href="#"></a>
			</div>
			<div class="">
				<a class="mdi-action-receipt" href="Knowlage&Culture.html"></a>
			</div>
			<div class="">
				<a class="mdi-action-explore" href="Search.jsp?point="></a>
			</div>
			<div class="">
				<a class="mdi-communication-textsms" href="Chat.jsp"></a>
			</div>
			<div class="">
				<a class="mdi-social-notifications-paused" href="#"></a>
			</div>
			<div class="bubble-btn">
				<a class="mdi-av-playlist-add" id="post-btn" href="#"></a>
			</div>
			<div class="bubble-btn">
				<a class="mdi-action-account-circle" id="face-btn" href="#"></a>
			</div>
		</div>
	</div>
	<!-- post按钮 -->
	<div class="post-bubble shadow-z-4 bubble">
		<label for="postText"><a class="mdi-action-translate" href="#"></a><span>Text</span></label>
		<label for="postPic"><a class="mdi-image-color-lens" style="color: #FFA000" href="#"></a>
			<span>Photo</span></label>
		<label for="postVideo"><a class="mdi-av-videocam" style="color: #F44336" href="#"></a>
			<span>Video</span></label>
	</div>
	<!-- post窗口 -->
	<!--
	作者：XXX@qq.com
	时间：2015-05-16
	描述：post窗口
-->
	<div class="post-dialog hidden">
		<img class="user-face" src="${ USERINFO.user_face }" />
		<form id="textForm" class="post-Form" action="./PostServlet" method="get">
			<input type="hidden" name="owner_id" id="owner_id" value="${ USERINFO.user_id }" />
			<label style="padding: 5px; width: 100%;">${ USERINFO.user_name }</label>
			<input style="font-size: 2em;" id="post_title" placeholder="Title:" name="post_title" />
			<input id="input-pics" type="file" id="post_pics" value="your pics" name="post_pics" />
			<input id="input-url" placeholder="videoWebPath:" id="post_url" name="post_url" />
			<textarea rows="3" placeholder="Your text here" id="post_content" name="post_content"></textarea>
			<input placeholder="tags : #tag1 #tag2" id="post_tags" name="post_tags" />
			<div class="close-btn" style="float: left;">
				<a class="mdi-content-clear" style="font-size: 1.6em; color: #e74c3c;"></a>
				<input type="reset" class="back-btn" value="" />
			</div>
			<div class="submit-btn" style="float: right;">
				<a class="mdi-content-send" style="font-size: 1.6em; color: #0066FF;"></a>
				<input class="back-btn" value="" />
			</div>
		</form>
	</div>
	<%-- 与上面合并了 		
<!--
	作者：XXX@qq.com
	时间：2015-05-16
	描述：发送图片
-->
		<div class="post-dialog hidden"id="postPic" >
			<img class="user-face" src="${ USERINFO.user_face }"/>
			<form id="picForm" class="post-Form" action="" method="get">
				<input type="hidden" name="owner_id" value="${ USERINFO.user_id }" />
				<label style="padding: 5px; width: 100%;" >${ USERINFO.user_name }</label>
				<input style="font-size: 2em;" placeholder="Title:" />
				<input type="file" value="your pics"name="post_pics"/>
				<textarea rows="3" placeholder="Your text here" ></textarea>
				<input placeholder="tags : #tag1 #tag2" name="post_tags"/>
				<div class="close-btn" style="float: left;">
					<a class="mdi-content-clear" style="font-size: 1.6em; color: #e74c3c;"></a>
					<input type="reset" class="back-btn" value=""/>
				</div>
				<div class="submit-btn" style="float: right;">
					<a class="mdi-content-send" style="font-size: 1.6em; color: #0066FF;"></a>
					<input type="submit" class="back-btn" value="" />
				</div>
			</form>
		</div>

<!--
	作者：XXX@qq.com
	时间：2015-05-16
	描述：发视频
-->
		<div class="post-dialog hidden" id="postVideo">
			<img class="user-face" src="${ USERINFO.user_face }"/>
			<form id="videoForm" class="post-Form" action="" method="get">
				<input type="hidden" name="owner_id" value="${ USERINFO.user_id }" />
				<label style="padding: 5px;  width: 100%;" >${ USERINFO.user_name }</label>
				<input style="font-size: 2em;" placeholder="Title:" name="post_title"/>
				<input placeholder="videoWebPath:" name="post_url"/>
				<textarea rows="3" placeholder="Your text here" name="post_content"></textarea>
				<input placeholder="tags : #tag1 #tag2" name="post_tags"/>
				<div class="close-btn" style="float: left;">
					<a class="mdi-content-clear" style="font-size: 1.6em; color: #e74c3c;"></a>
					<input type="reset" class="back-btn" value=""/>
				</div>
				<div class="submit-btn" style="float: right;">
					<a class="mdi-content-send" style="font-size: 1.6em; color: #0066FF;"></a>
					<input type="" class="back-btn" value="" />
				</div>
			</form>
		</div> --%>


	<!-- 用户界面弹窗 -->
	<div class="face-bubble shadow-z-4 bubble">
		<div class="user-profile">
			<div class="face-icon">
				<img src="${ USERINFO.user_face }" /> <span class="change-face">Change-face</span>
			</div>
			<div class="name-email">
				<span>${ USERINFO.user_name }</span>
				<br> <span>${ USERINFO.user_email }</span>
				<br>
				<a class="profile-link">View profile</a>
			</div>
		</div>
		<div class="signout-button">
			<input type="button" class="btn btn-default" value="SignOut" />
		</div>
	</div>
	<!-- 右边的板块 -->
	<div class="container">
		<div class="discover-posts">
			<div class="posts-hoder">
				<div class="right-banner">
					<strong>Userinfomation:</strong>
					<hr>
					<a class="mdi-action-subject" href="#"> Posts<span>${ USERINFO.user_postNum }</span><br>

					</a> <a class="mdi-social-people-outline" href="#">

						Followers<span>${ USERINFO.user_follwedNum }</span>

					</a>
					<br> <a class="mdi-content-gesture" href="#">

						Activity<span></span>

					</a>
					<br>
					<hr> ACCOUNT
					<hr>
					<a class="mdi-action-favorite" style="color: #F44336" href="#">

						Liked <span></span>

					</a>
					<br> <a class="mdi-social-people" href="#"> Following <span>${ USERINFO.user_follwingNum }</span>

					</a>
					<br> <a class="mdi-social-person-add" href="Search.jsp?find=users"> Find Others <span></span>

					</a>
					<br>
					<hr> RADAR
					<br>
					<div class="mdi-social-whatshot"> Gusst you like

					</div>
					<br>

				</div>
				<!-- 左边的post页面  注释掉的是测试样式-->
				<%-- 				<div class="user-post">
						<div class="user-face ">
							<img src="userfaces/jianeite.png" />
						</div>
						<div class="user-news">
							<div class="user-name">${ USERINFO.user_name }</div>
							<div class="post-content">
								<img src="news/drunk.png" />
							</div>
							<div class="post-title">first test post</div>
							<div class="post-footer">
								<label class="notes">notes</label>
								<label class="repost" ></label>
								<label class="mdi-action-favorite" id="like" ></label>
							</div>
						</div>
					</div> --%>


				<c:forEach var="friendsPosts" items="${ FRIENDS_POSTS_LIST }">

					<c:if test="${ friendsPosts.post_status == 0 }">
						<div class="user-post">
							<div class="user-face ">
								<img src="${ friendsPosts.ownerInfo.user_face }" />
							</div>
							<div class="user-news">
								<div class="user-name">${ friendsPosts.ownerInfo.user_name }</div>
								<div class="post-content">
									<c:if test="${ not empty friendsPosts.post_pics  }">
										<img src="${ friendsPosts.post_pics }" />
									</c:if>
									<div id="post-content"></div>
									<c:if test="${ not empty friendsPosts.post_video  }">
										<div id="post-video">${ friendsPosts.post_video }</div>
									</c:if>
								</div>
								<div class="post-title">Title：${ friendsPosts.post_title } { ${ friendsPosts.post_tags
									}}</div>
								<textarea readonly>${ friendsPosts.post_content }</textarea>
								<div class="post-footer">
									<label class="notes">notes</label>
									<label class="repost"></label>
									<label class="mdi-action-favorite" id="like">${ friendsPosts.post_liked }</label>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(function () {

			//点击其他地方弹窗消失（实现了一半,不信你点导航栏!）
			$(".container, .logo-search-bar").click(function () {
				$(".bubble").hide();
			});
			//对post-bubble按钮的操作
			$("#post-btn").click(function () {
				$(".face-bubble").hide();
				$(".post-bubble").toggle(500);
			});
			$("label > a").mouseover(function () {
				$(this).animate({
					padding: '10px 20px 20px 20px'
				}, 200).animate({
					padding: '20px 20px 20px 20px'
				}, 300);
			});
			//对face-bubble的操作
			$("#face-btn").click(function () {
				$(".post-bubble").hide();
				if ($(".face-bubble").is(":hidden")) {
					$(".face-bubble").fadeIn();
				} else {
					$(".face-bubble").fadeOut();
				}
			});
			//对搜索动画的操作
			$(".search input").focus(function () {
				$(this).animate({
					height: "50px"
				}, 'slow');
			});
			$(".search input").blur(function () {
				$(this).animate({
					height: "30px"
				}, 'slow');
			});
			//回车进行搜索
			$("body").keydown(function () {
				//keyCode=13是回车键,先判断是否是回车键，然后再判断搜索框是否是焦点
				if (event.keyCode == "13") {
					if ($(".point").is(":focus")) {
						var point = $(".point").val();
						location.href = "Search.jsp?point=" + point;
					}
				}
			});
			//退出
			$(".signout-button").click(function () {
				$.get("./Logout", null, function () {
					window.location.reload();
				});
			});
			//喜欢
			$(".mdi-action-favorite").click(function () {
				if (!$(this).hasClass("like")) {
					$(this).addClass("like");
					$(this).html(parseInt($(this).html()) + 1);
					//将数据插入数据库

				} else {
					$(this).removeClass("like");
					$(this).html(parseInt($(this).html()) - 1);
				}
			});
			//查看自己的推文
			$(".mdi-action-subject").click(function () {
				var userNmae = $('.name-email span:first-child').html();
				location.href = "Search.jsp?point=" + userNmae;
			});
			//				打开post窗口
			$('.post-bubble label').click(function () {
				$("#input-pics, #input-url, #input-content").show();
				var dialog = $(this).attr('for');
				$(".post-bubble").hide();
				$(".overlay").removeClass("hidden");
				if (dialog == "postText") {
					$(".post-dialog").removeClass("hidden");
					$("#input-pics, #input-url").hide();
				} else if (dialog == "postPic") {
					$(".post-dialog").removeClass("hidden");
					$("#input-url").hide();
				} else if (dialog == "postVideo") {
					$(".post-dialog").removeClass("hidden");
					$("#input-pics").hide();
				}
			});
			//				关闭post窗口
			$(".close-btn , .overlay").click(function closeDialog() {
				$(".overlay, .post-dialog").addClass("hidden");
				$(".submit-btn").children("a").attr("class", "mdi-content-send");
				$(".submit-btn").children("a").css("font-size", "2em");
				$(".close-btn").children("a").html("");
			});
			//				发表按钮
			$(".submit-btn").click(function () {
				var owner_id = $("#owner_id").val();
				var post_title = $("#post_title").val();
				var post_pics = $("#post_pics").val();
				var post_url = $("#post_url").val();
				var post_content = $("#post_content").val();
				var post_tags = $("#post_tags").val();
				var url = "./PostServlet?owner_id=" + owner_id
					+ "&post_title=" + post_title
					+ "&post_pics=" + post_pics + "&post_url=" + post_url
					+ "&post_content=" + post_content + "&post_tags=" + post_tags;
				$.get(url, function (data, status) {
					if (data == "true") {
						$(".submit-btn").children("a").attr("class", "mdi-action-verified-user");
						$(".submit-btn").children("a").animate({ fontSize: "4em" }, "slow", function () {
							$(".close-btn").click();
						});
					} else {
						$(".close-btn").children("a").html("出错了，请重试");
					}
				});
			});
		});
	</script>

</body>

</html>