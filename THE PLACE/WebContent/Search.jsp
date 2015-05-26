<%@page import="org.eclipse.jdt.internal.compiler.ast.PostfixExpression"%>
<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<%
	PostInfoBiz postInfoBiz = new PostInfoBiz();
	List<PostInfo> postInfoList = new ArrayList<PostInfo>();

	if (session.getAttribute("USERINFO") == null) {
		response.sendRedirect("Signin.jsp?error=2");
	} else {
		String find = request.getParameter("find");
		String point = request.getParameter("point");
		pageContext.setAttribute("point", point);
		boolean isFindPost = true;
		/* if (find.equals("users")) {
	isFindPost = false;
	List<UserInfo> userInfoList = new UserInfoBiz().findAllUsersInfo(point);
	pageContext.setAttribute("userInfoList", userInfoList); */
		postInfoList = postInfoBiz.findPostsInfoByPoint(point);
		
		pageContext.setAttribute("isFindPost", isFindPost);
		pageContext.setAttribute("postInfoList", postInfoList);
	}
%>

<head>
<title>explore</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="dist/css/material.min.css" rel="stylesheet" type="text/css">

<style type="text/css">
html, body {
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
	margin: 10px;
	float: left;
}

.logo-search-bar div {
	float: left;
}

.search input {
	color: #ffffff;
	font-size: 18px;
	font-weight: 500;
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

.select {
	color: #D84315;
}

.container {
	width: 100%;
	padding-top: 75px;
	padding-right: 20px;
	position: absolute;
}

.user-post {
	width: 22%;
	position: relative;
	height: auto;
	margin-left: 30px;
	margin-top: 20px;
	background: rgb(238, 238, 238);
	border-radius: 3px;
	float: left;
}

.post-pic {
	width: 100%;
	border-radius: 3px;
	min-height: 100px;
	max-height: 200px;
}

.user-info {
	height: 60px;
	position: absolute;
	color: #fff;
	margin-top: 0;
	line-height: 60px;
}

.user-info .user-face, .user-name, .follow {
	float: left;
}

.user-info .user-face {
	width: 35px;
	margin: 10px;
	border-radius: 2px;
}

.user-info .follow {
	margin-left: 10px;
	cursor: pointer;
}

.user-info .post-footer {
	padding: 5px;
	background-color: #000;
}

.post-text, .post-tags {
	width: 100%;
	padding: 5px;
	color: #9D9D9D;
}

.post-title {
	padding-left: 5px;
}

.post-text {
	max-height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
}

/* 用户弹窗  */
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
</style>
</head>

<body>
	<!--
	作者：940788048@qq.com
	时间：2015-05-16
	描述：页面头
-->
	<div class="header-bar">
		<a href="Search.jsp"> <img class="logo" src="images/logo.png" />
		</a>
		<div class="logo-search-bar">
			<div class="search">
				<div class="search-form">
					<input class="point " type="text" placeholder="Search the PLACE"
						value="${ point }" /> <input type="hidden" />
				</div>
			</div>
		</div>
		<div class="user-bar">
			<div class="">
				<a class="mdi-action-polymer " href="index.jsp"></a>
			</div>
			<div class="">
				<a class="mdi-action-receipt" href="Knowlage&Culture.html"></a>
			</div>
			<div class="">
				<a class="mdi-action-explore select" href="Search.jsp?point="></a>
			</div>
			<div class="">
				<a class="mdi-communication-textsms" href="Chat.jsp"></a>
			</div>
			<div class="">
				<a class="mdi-social-notifications-paused" href="#"></a>
			</div>
			<div class="bubble-btn">
				<a class="mdi-action-account-circle" id="face-btn"></a>
			</div>
		</div>
	</div>
	<!-- 用户界面弹窗 -->
	<div class="face-bubble shadow-z-4 bubble">
		<div class="user-profile">
			<div class="face-icon">
				<img src="${ USERINFO.user_face }" /> <span class="change-face">Change-face</span>
			</div>
			<div class="name-email">
				<span>${ USERINFO.user_name }</span> <br> <span>${ USERINFO.user_email }</span>
				<br> <a class="profile-link">View profile</a>
			</div>
		</div>
		<div class="signout-button">
			<input type="button" class="btn btn-default" value="SignOut" />
		</div>
	</div>

	<!--
	作者：940788048@qq.com
	时间：2015-05-16
	描述：搜索主页面
-->
	<div class="container">
		<!-- 推文信息 -->
		<c:if test="${ isFindPost }">
			<c:forEach var="post" items="${ postInfoList }">
				<div class="user-post ">
					<div class="post-content">
						<div class="user-info">
							<img class="user-face" src="${ post.ownerInfo.user_face }" />
							<div class="user-name">${ post.ownerInfo.user_name }</div>
							<!-- <a class="follow" >Follow Me</a> -->

							<c:set var="user_id" value="${ post.owner_id }"></c:set>
							<c:if test="${ USERINFO.user_id eq user_id }">
								<div class="follow" style="color: red">Myself</div>
							</c:if>
							<c:if test="${ USERINFO.user_id ne user_id }">
								<c:if test="${ not empty USERINFO.friendsId }">
									<c:forEach var="friendId" items="${ USERINFO.friendsId }">
										<c:if test="${ user_id eq friendId }">
											<a class="follow" style="color: yellow" id="${ user_id }">Following</a>
										</c:if>
										<c:if test="${ user_id ne friendId }">
											<c:if test="${ USERINFO.user_id ne user_id }">
												<a class="follow" id="${ user_id }">Follow Me</a>
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${ empty USERINFO.friendsId }">
									<a class="follow" id="${ user_id }">Follow Me</a>
								</c:if>
							</c:if>
						</div>
						<img class="post-pic" src="${ post.post_pics }" />
						<div class="post-title">Title：${ post.post_title }</div>
						<div class="post-text">${ post.post_content }</div>
						<div class="post-tags">tags: ${ post.post_tags }</div>
						<hr>
						<div class="post-footer">
							<label class="note" style="margin-left: 5px;">notes</label> <label
								class="like" style="float: right; margin-right: 5px;">${ post.post_liked }like</label>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>


		<!-- 用户信息 -->
		<c:if test="${ not isFindPost }">
			<div class="user-info" hidden="true">
				<div class="user-back"></div>
				<img class="user-face" />
				<div class="user-name"></div>
				<div class="user-pro"></div>
				<div>learnMore</div>
				<div>follow</div>
			</div>
		</c:if>

	</div>
	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(
				function() {
					//对face-bubble的操作
					$("#face-btn").click(function() {
						$(".post-bubble").hide();
						if ($(".face-bubble").is(":hidden")) {
							$(".face-bubble").fadeIn();
						} else {
							$(".face-bubble").fadeOut();
						}
					});
					//退出
					$(".signout-button").click(function() {
						$.get("./Logout", null, function() {
							window.location.reload();
						});
					});
					//对搜索动画的操作
					$(".search input").focus(function() {
						$(this).animate({
							height : "50px"
						}, 'slow');
					});
					$(".search input").blur(function() {
						$(this).animate({
							height : "30px"
						}, 'slow');
					});

					//回车进行搜索
					$("body").keydown(function() {
						var point = $(".point").val();
						if ($(".point").focus()) {
							if (event.keyCode == "13") {//keyCode=13是回车键
								location.href = "Search.jsp?point=" + point;
							}
						}
					});

					//follow
					$(".follow").click(
							function() {
								var friend_id = $(this).attr("id");
								var status = $(this).html();
								if (status != "Myself") {
									var url = "./FollowServlet?friend_id="
											+ friend_id + "&status=" + status;
									$.get(url, function(data, status) {
										window.location.reload();
									});
								}
							});

				});
	</script>

</body>

</html>