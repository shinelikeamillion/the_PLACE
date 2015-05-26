<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<%
	if (session.getAttribute("USERINFO") == null) {
		//response.sendRedirect("Signin.jsp?erroMsg=2");
	} else {
		PostInfoBiz postInfoBiz = new PostInfoBiz();
		List<UserInfo> users = (ArrayList<UserInfo>)application.getAttribute("USERS");
		if(users == null){
	users = new ArrayList<UserInfo>();
		}
		UserInfo userInfo = (UserInfo)session.getAttribute("USERINFO");
		
		if (!users.contains(userInfo)) {
	users.add( userInfo );
		}
	application.setAttribute("USERS", users);
	}
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="dist/css/material.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
html, body {
	width: 100%;
	margin: 0px;
	/*overflow: hidden;*/
	background-color: #36465d;
	font-family: 'Roboto', sans-serif;
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

.user-bar {
	float: right;
}

.user-bar div {
	font-size: 25px;
	width: 50px;
	height: 30px;
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

.container {
	margin: 0;
	width: 100%;
	max-height: 200px;
	margin-top: 64px;
}

.left {
	width: 55%;
	max-height: 590px;
	overflow: auto;
	top: 60px;
	border-radius: 4px;
	height: 100%;
	padding: 10px;
	float: left;
}

.right {
	right: 0;
	width: 40%;
	float: right;
}

.counter {
	display: inline;
	margin-top: 0;
	margin-bottom: 0;
	margin-right: 10px;
}

.left img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	float: left;
	border-radius: 50%;
}

.user_faces {
	margin-top: 80px;
}

.users_face {
	width: 50px;
	height: 50px;
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 50%;
	float: left;
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

.left .content {
	margin-bottom: 5px;
}

.left input {
	border: none;
	width: 90%;
	background: #CDDC39;
	font-size: 18px;
	padding-left: 20px;
	font-weight: 300px;
	border-radius: 25px;
	height: 40px;
	margin-left: 10px;
}

.post {
	position: absolute;
	width: 40%;
	padding: 10px;
	right: 0;
}

.post textarea {
	border-radius: 4px;
	font-size: 20px;
	width: 100%;
	overflow: hidden;
}

.button-group {
	float: right;
}

.button-group input {
	padding: 6px 12px;
	font-size: 18px;
	font-weight: 400;
	background: #00838F;
	border: none;
	color: #ffffff;
	cursor: pointer;
}

.disabled {
	opacity: 0.3;
}
</style>
</head>

<body>
	<div class="header-bar">
		<a href="index.jsp"> <img class="logo" src="images/logo.png" />
		</a>
		<div class="user-bar">
			<div class="">
				<a class="mdi-action-polymer" href="index.jsp" title="主页"></a>
			</div>
			<div class="">
				<a class="mdi-action-receipt" href="Knowlage&Culture.html"
					title="更多"></a>
			</div>
			<div class="">
				<a class="mdi-action-explore" href="Search.jsp?point=" title="搜索"></a>
			</div>
			<div class="">
				<a class="mdi-communication-textsms select" href="Chat.jsp"
					title="聊天"></a>
			</div>
			<div class="">
				<a class="mdi-social-notifications-paused" href="" title="消息"></a>
			</div>
			<div class="bubble-btn">
				<a class="mdi-action-account-circle" href="" id="face-btn"
					title="${ USERINFO.user_name }"></a>
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
	<div class="container">
		<div class="left posts">
			<c:forEach var="content" items="${ contentList }">${ content }</c:forEach>
		</div>
		<div class="right">
			<div class="post">
				<textarea class="status-box" placeholder="Say something here..."></textarea>
				<div class="button-group ">
					<p class="counter " style="color: #ffffff; font-weight: 400px;">140</p>
					<input type="button" class="button" value="Post" />
				</div>
			</div>
			<div class="user_faces">
				<h3 style="color: #ffffff;">聊天室在线用户：</h3>

				<c:forEach var="user" items="${ USERS }">
					<img class="users_face" title="${ user.user_name }"
						src="${ user.user_face }">
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script>
		var main = function() {

			//对face-bubble的操作
			$("#face-btn").click(function() {
				if ($(".face-bubble").is(":hidden")) {
					$(".face-bubble").fadeIn();
				} else {
					$(".face-bubble").fadeOut();
				}
			});

			//自动刷新  
			AutoRefresh();
			$('.button').click(function() {
				//获得textarea中的内容给 post
				var post = $('.status-box').val();
				//var content = "<div class=\"content\"><img title=\"${ USERINFO.user_name }\" src=\"${ USERINFO.user_face }\" /> <input value="+post+" readonly=\"true\" /></div>"
				var url = "./ChatServlet";
				//将post中的内容添加到posts中的li中
				$.post(url, "content=" + post, function(data) {
					GetMessageList();
				});
				//将post中的文字至0
				$('.status-box').val('');
				//数字显示回复140
				$('.counter').text('140');
				//因为输入框中没有内容所以post键应变灰
				$('.button').addClass('disabled').attr("disabled", "true");
			});
			$('.status-box').keyup(
					function() {
						//获取文本框中文本的长度
						var postLength = $(this).val().length;
						//提示所剩字数
						var charactersLeft = 140 - postLength;
						//根据文本框的变化随时变化提示内容
						$('.counter').text(charactersLeft);
						//限制字数
						if (charactersLeft < 0) {
							//字数超过限制就限制发表
							$('.button').addClass('disabled').attr("disabled",
									"true");
						} else if (charactersLeft == 140) {
							$('.button').addClass('disabled').attr("disabled",
									"true");
						} else {
							$('.button').removeClass('disabled').removeAttr(
									"disabled");
						}
					});
			//btn 默认为disable
			$('.button').addClass('disabled').attr("disabled", "true");
			//获得消息
			function GetMessageList() {
				$.ajax({
					type : "POST",
					url : "./ChatServlet",
					success : function(data) {
						$('.posts').html(data);
					}
				});
			}
			//自动更新页面信息  
			function AutoRefresh() {
				setInterval(GetMessageList, 500);
			}
			//退出
			$(".signout-button").click(function() {
				$.get("./Logout", null, function() {
					window.location.reload();
				});
			});
		}
		$(document).ready(main);
	</script>

</body>

</html>