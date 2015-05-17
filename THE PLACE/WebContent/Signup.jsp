<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>SignUp</title>
<link href="dist/css/material.min.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	min-width: 800px;
	text-align: center;
	font-family: 'Open Sans', arial;
}

.header-bar {
	margin-top: 0;
	width: 100%;
	height: 71px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(229, 229, 229);
	overflow: hidden;
	background: #009688;
}

.logo {
	padding-left: 2em;
	margin: 17px 0px 0px;
	float: left;
	height: 45px;
	width: 45px;
}

.header-bar .signin-btn {
	padding-right: 1em;
	margin: 22px 0px 0px;
	float: right;
}

.header-bar .signin-btn a {
	font-size: 13px;
	font-weight: normal;
}

.g-button-submit {
	border: 1px solid rgb(48, 121, 237);
	color: rgb(255, 255, 255);
	text-shadow: rgba(0, 0, 0, 0.4) 0px 2px;
	text-decoration: none;
	background-color: rgb(77, 144, 254);
}

.g-button {
	display: inline-block;
	width: 100px;
	height: 27px;
	text-align: center;
	line-height: 27px;
	border-radius: 2px;
}

.signuppage {
	top: 0;
	margin-top: -50px;
}

.form-img {
	margin-top: -160px;
	margin-left: 25%;
	width: 50%;
	height: 680px;
	background: url("images/logup.png") repeat;
	-webkit-filter: blur(3px);
	position: absolute;
	z-index: -999;
}

.sign-up {
	padding: 20px;
	border-radius: 5px;
	margin: 130px auto auto;
	width: 400px;
	color: black;
	height: 100%;
	background-color: #ffffff;
	opacity: 0.8;
	<!--
	透明度
	-->
}

.form-group {
	margin-bottom: 30px;
}

.form-control {
	width: 100%;
	font-size: 19px;
}

.sex-age .form-control-wrapper {
	float: left;
	width: 150px;
}

.btn {
	margin: 0 40px;
}
</style>
</head>

<body>
	<div>
		<div class="header-bar">
			<img class="logo" src="images/logo.png" alt="the PLACE"> <span
				class="signin-btn"> <a id="link-signin"
				class="g-button g-button-submit" href="Signin.jsp">Sign in</a>
			</span>
		</div>
		<div class="middle">
			<div class="form-img"></div>
			<div class="signuppage">
				<div class="sign-up">
					<form class="createaccount-form " id="creataccount"
						action="./addUsersServlet" method="post">
						<!--字段：用户名，密码，年龄，性别，邮箱，简介  -->
						<br>
						<div class="form-group ">
							<div class="form-control-wrapper">
								<input class="form-control " id="user_name" name="user_name"
									type="text" />
								<div class="hint"></div>
								<div class="floating-label">Try to get a chilling name:</div>
								<span class="material-input"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="form-control-wrapper">
								<input class="form-control empty" id="user_email"
									name="user_email" type="email" />
								<div class="hint"></div>
								<div class="floating-label">Write your Email here:</div>
								<span class="material-input"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="form-control-wrapper">
								<input class="form-control empty" id="user_password"
									name="user_password" type="password" />
								<div class="hint"></div>
								<div class="floating-label">Sh~,it's your password:</div>
								<span class="material-input"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="form-control-wrapper">
								<input class="form-control empty" id="user_pro" name="user_pro"
									type="text">
								<div class="hint">your hobbies, identity, tags.anything
									you want..</div>
								<div class="floating-label">write something cool here:</div>
								<span class="material-input"></span>
							</div>
						</div>
						<div class="form-group sex-age">
							<!-- Age: -->
							<div class="form-control-wrapper">
								<input class="form-control empty" id="user_age" name="user_age"
									type="text">
								<div class="hint"></div>
								<div class="floating-label">your age:</div>
								<span class="material-input"></span>
							</div>
							Sex: <input type="radio" id="user_sex" name="user_sex"
								value="male" />male <input type="radio" id="user_sex"
								name="user_sex" value="female" />female <input type="radio"
								id="user_sex" name="user_sex" value="secret" checked />secret
						</div>
						<input type="reset" class="btn btn-primary " value="Cancel" /> <input
							type="submit" class="btn btn-primary" value="Signup" />
					</form>
				</div>
			</div>
		</div>
		<div class="footer-bar"></div>
	</div>

	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							/* 把第一行设为焦点  */
							$("#user_name").focus();
							/* 判断当前input在离开时是否有值内容不能为空 */
							$("input")
									.blur(
											function() {
												if ($.trim($(this).val()).length == 0) {
													$(this).addClass("empty");
													$($(this).next(".hint"))
															.css("display",
																	"block");
													$($(this).next(".hint"))
															.html(
																	"<font color='red'>This is required!</font>");
												} else {
													$(this)
															.removeClass(
																	"empty");
													$($(this).next(".hint"))
															.html(
																	"<font color='green'>Good job!</font>");
												}
												;
											});
							$("input").focus(function() {
								$(this).removeClass("empty");
							});
						});
	</script>
</body>

</html>