<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<% 
	//判断是否登录
	if(request.getParameter("erroMsg") != null) {
		if(request.getParameter("erroMsg").equals("1")) {
			pageContext.setAttribute("erroMsg", "还没有注册？或者输入有错误..");
		} else if (request.getParameter("erroMsg").equals("2")) {
			pageContext.setAttribute("erroMsg", "这些内容要先登录才能访问哦..");
		} else if (request.getParameter("erroMsg").equals("3")) {
			pageContext.setAttribute("erroMsg", "此帐户已经被列入黑名单..");
		} 
	}
%>

<head data-gwd-animation-mode="quickMode">
	<title>Signin</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="generator" content="Google Web Designer 1.2.1.0121">
	<style type="text/css">
		html,
		body {
			width: 100%;
			height: 100%;
			margin: 0px;
			font-family: 'Open Sans', arial;
			text-align: center;
		}

		a {
			color: rgb(66, 127, 237);
			text-decoration: none;
		}

		.header-bar {
			height: 83px;
		}

		.banner {
			text-align: center;
		}

		.banner h1 {
			font-weight: 300;
			font-size: 40px;
			margin-bottom: 15px;
			color: rgb(85, 85, 85);
			margin-top: 0px;
		}

		.banner h2 {
			color: rgb(85, 85, 85);
			font-size: 18px;
			font-weight: 400;
			margin-bottom: 20px;
		}

		.signin-card {
			width: 270px;
			height: 280px;
			padding: 20px 40px 40px 40px;
			margin-left: auto;
			margin-right: auto;
			margin-bottom: 20px;
			border-radius: 2px;
			box-shadow: rgba(0, 0, 0, 0.298039) 0px 2px 2px;
			background-color: rgb(247, 247, 247);
		}

		.signin-card .profile-img {
			width: 96px;
			height: 96px;
			margin: 0px auto 10px;
			border-radius: 50%;
			/* background-image:url('userfaces/default.png');
				background-position: center; */
		}

		.signin-card input {
			width: 100%;
		}

		#erroMsg {
			color: red;
			width: 100%;
		}

		.hidden-label {
			width: 0px;
			height: 0px;
			overflow: hidden;
			position: absolute !important;
		}

		.signin-card #Email {
			margin-bottom: 0px;
			height: 44px;
			font-size: 16px;
		}

		.signin-card #Passwd {
			margin-top: -1px;
			margin-bottom: 10px;
			font-size: 16px;
			height: 44px;
		}

		.submit-btn {
			border: 1px solid rgb(48, 121, 237);
			color: rgb(255, 255, 255);
			font-weight: 700;
			height: 36px;
			width: 100%;
			display: block;
			z-index: 1;
			position: relative;
			box-sizing: border-box;
			border-top-left-radius: 3px;
			border-top-right-radius: 3px;
			border-bottom-right-radius: 3px;
			border-bottom-left-radius: 3px;
			margin-bottom: 10px;
			background-color: rgb(77, 144, 254);
			cursor: pointer;
		}

		input[type="submit"] {
			font-size: 13px;
		}

		input[type="checkbox"] {
			float: left;
			width: 13px;
			height: 13px;
			vertical-align: bottom;
			background: rgb(255, 255, 255);
		}

		.need-help {
			float: right;
		}

		.footer-bar {
			bottom: 0px;
			height: 35px;
			width: 100%;
			padding-top: 20px;
			border-top-width: 1px;
			border-top-style: solid;
			border-top-color: rgb(229, 229, 229);
		}
	</style>
</head>

<!-- 输入框自动获取焦点 -->

<body onLoad="document.forms.SignInForm.email.focus()">
	<div>
		<div class="header-bar">
			<div>the</div>
			<div>PLACE</div>
		</div>
		<div class="banner">
			<h1>One account.All for love.</h1>
			<h2>Sign in with your own Account</h2>
		</div>
		<div class="signin-card">
			<!-- 实现默认头像功能 -->
			<c:choose>
				<c:when test="${ USERINFO == null }">
					<img class="profile-img" src="userfaces/default.png" />
				</c:when>
				<c:otherwise>
					<img class="profile-img" src="${ USERINFO.user_face } " />
				</c:otherwise>
			</c:choose>

			<form id="SignInForm" action="./CheckLoginServlt" method="post" name="SignInForm">
				<label id="erroMsg">${ erroMsg }</label>
				<label class="hidden-label" for="Email">Email</label>
				<input type="email" id="Email" name="email" placeholder="Email" value="${ USERINFO.user_email }" />
				<label class="hidden-label" for="Passwd">Passwd</label>
				<input type="password" id="Passwd" name="password" placeholder="Password" />
				<input type="button" class="submit-btn" name="SignIn" value="Sign In" />
				<input type="checkbox" name="" value="yes" checked="checked" />
				<span style="float: left;">Stay signed in</span>
				<a href="#" id="link-fogot-passwd" class="need-help">Need help?</a>
			</form>
		</div>
		<div style="margin-bottom: 30px; font-size: 14px;">
			<a href="Signup.jsp"> Creat an account </a>
			<p>One Account for everything Basketball</p>
		</div>
		<div class="footer-bar">
			<a href="">the PLACE--@by XXX</a>
		</div>
	</div>
	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script charset="utf-8">
		$(document).ready(function () {
			$(".submit-btn").click(function () {
				if ($("#Email").val() == "" || $("#Passwd").val() == "") {
					$("#erroMsg").html("内容填写完整才能登录成功哦~");
					/* 晃动表单 */
					$(".signin-card").animate({
						width: 300, opacity: 0.6
					}, 40).animate({
						width: 270
					}, 40).animate({
						width: 300
					}, 40).animate({
						width: 270
					}, 40).animate({
						width: 300
					}, 40).animate({
						width: 270
					}, 40).animate({
						width: 300
					}, 40).animate({
						width: 270, opacity: 1
					}, 40);
				} else {
					$("#SignInForm").submit();
				}
			});
			//回车键提交表单
			$("body").keydown(function () {
				if (event.keyCode == "13") {//keyCode=13是回车键
					$("#SignInForm").submit();
				}
			});
		});

	</script>
</body>

</html>