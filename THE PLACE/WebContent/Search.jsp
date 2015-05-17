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
		
		boolean isFindPost = true;
		if (find != null) {
			if (find.equals("users")) { 
				List<UserInfo> userInfoList = new UserInfoBiz().findAllUsersInfo(point);
				isFindPost = false;
				pageContext.setAttribute("userInfoList", userInfoList);
			} else if(point != null) {
					postInfoList = postInfoBiz.findPostsInfoByPoint(point);
			}
		} else {
			postInfoList = postInfoBiz.findPostsInfoByPoint("");
		}
		pageContext.setAttribute("postInfoList", postInfoList);
		pageContext.setAttribute("isFindPost", isFindPost);
		pageContext.setAttribute("point", point+"nihao");
	}
%>

	<head>
		<title>explore</title>
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
				border-radius: 50% ;
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
			.container{
				padding-top: 75px ;
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
			}
			.user-info {
				height: 60px;
				position: absolute;
				color: #fff;
				margin-top: 0;
				line-height: 60px;
			}
			.user-info .user-face, .user-name, .follow  {
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
			.user-info .post-footer{
				padding: 5px;
				background-color: #000;
			}
			.post-text, .post-tags{
				width: 100%;
				padding: 5px;
				color: #9D9D9D;
			}
			.post-text{
			    max-height: 50px;
				overflow: hidden;
				text-overflow:ellipsis; 
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
			<a href="Knowlage&Culture.html">
				<img class="logo" src="images/logo.png" />
			</a>
			<div class="logo-search-bar">
				<div class="search">
					<div class="search-form">
						<input class="point " type="text" placeholder="Search the PLACE" />
						<input type="hidden" />
					</div>
				</div>
			</div>
			<div class="user-bar">
				<div class="">
					<a class="mdi-action-polymer " href="index.jsp"></a>
				</div>
				<div class="">
					<a class="mdi-action-explore select" href="Search.html"></a>
				</div>
				<div class="bubble-btn">
					<a class="mdi-action-account-circle" id="face-btn"></a>
				</div>
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
								<a class="follow" >Follow Me</a>
							</div>
							<img class="post-pic" src="${ post.post_pics }"/>
							<div class="post-text" >${ post.post_content }</div>
							<div class="post-tags">tags: ${ post.post_tags }</div><hr>
							<div class="post-footer">
								<label class="note" style=" margin-left: 5px;">notes</label>
								<label class="like" style="float: right; margin-right: 5px;">${ post.post_liked }like</label>
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
			$(document).ready(function() {
				//对搜索动画的操作
				$(".search input").focus(function() {
					$(this).animate({
						height: "50px"
					}, 'slow');
				});
				$(".search input").blur(function() {
					$(this).animate({
						height: "30px"
					}, 'slow');
				});
				//回车进行搜索
				$("body").keydown(function() {
		            if (event.keyCode == "13") {//keyCode=13是回车键
		            	var point = $(".point").val();
		            	//alert(point);
		            	location.href = "Search.jsp?point="+point;
		            }
		        });
			});
		</script>

	</body>

</html>