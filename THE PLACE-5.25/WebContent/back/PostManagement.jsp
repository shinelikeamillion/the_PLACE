<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<%
	int id;
	PostInfoBiz postInfoBiz = new PostInfoBiz();
	
	if (session.getAttribute("ADMININFO") == null) {
		//response.sendRedirect("../Signin.jsp?error=2");
	}
	if (request.getParameter("point") != null) {
		String point = request.getParameter("point");
		pageContext.setAttribute("ALLPOSTS", postInfoBiz.adminFindPostsInfoByPoint(point));
		pageContext.setAttribute("POINT", point);
	} else {
		pageContext.setAttribute("ALLPOSTS", postInfoBiz.adminFindPostsInfoByPoint("%%"));
	}
%>
	<head>
		<meta charset="utf-8">
		<title>管理帖子</title>
		<link rel="stylesheet" href="style/backstage.css">
		<style type="text/css">
			.dialog {
				position: absolute;
				width: 50%;
				margin-left: 25%;
				visibility: hidden;
				z-index: 100;
				color: #ffffff;
			}
			.dialog-content {
				background: #e74c3c;
				position: relative;
				border-radius: 3px;
			}
			.dialog-content h3 {
				padding: 0.4em;
				text-align: center;
				font-size: 2.4em;
				font-weight: 300;
				background: rgba(0, 0, 0, 0.1);
				border-radius: 3px 3px 0 0;
			}
			.dialog-content > div {
				padding: 15px 40px 20px;
				font-weight: 300;
				font-size: 1.15em;
			}
			.dialog-content input,
			textarea {
				color: #ffffff;
				width: 100%;
				height: 40px;
				margin-bottom: 10px;
				font-size: 20px;
				border: 0px;
				background: rgba(0, 0, 0, 0.1);
			}
			.dialog-content textarea {
				height: 5em;
			}
			.dialog-content .button input {
				width: 250px;
				font-size: 1em;
				padding: 0.6em 1.2em;
				background: #c0392b;
				border-radius: 2px;
				margin-top: 20px;
			}
			.dialog-content #submit {
				float: right;
			}
			.overlay {
				position: fixed;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				z-index: 5;
				opacity: 0;
				visibility: hidden;
				background: rgba(143, 27, 15, 0.8);
				-webkit-transition: all 0.3s;
				-moz-transition: all 0.3s;
				transition: all 0.3s;
			}
			.show {
				opacity: 1;
				visibility: visible;
			}
			[type="button"]:hover {
				background-color: #e74c3c;
				color: #ffffff;
			}
		</style>
	</head>

	<body>
		<div class="head">
			<div class="logo fl">
				<img src="img/logo.png" />
			</div>
			<h3 class="head_text fr">THE PLACE 后台管理系统</h3>
		</div>
		<div class="operation_user clearfix">
			<div class="link fl">
				<a href="#">THE PLACE</a><span>&gt;&gt;</span>用户<span>&gt;&gt;</span>管理推文
			</div>
			<div class="link fr">
				<a href="AccountManagement.jsp" class="icon icon_i">首页</a><span></span>
				<a href="#" class="icon icon_j">前进</a><span></span>
				<a href="#" class="icon icon_t">后退</a><span></span>
				<a href="PostManagement.jsp" class="icon icon_n">刷新</a><span></span>
				<a href="../Logout" class="icon icon_e">退出</a>
			</div>
		</div>
		<div class="content clearfix">

			<!--用来做遮盖弹出框的背景-->
			<div class="overlay"></div>
				<!--弹出框-->
				<div class="dialog">
					<div class="dialog-content">
						<h3>发表推文</h3>
						<div>
							<form action="" method="get">
								<input type="date" id="date" name="recore_date" placeholder="Recore-date:">
								<br/>
								<textarea rows="3" placeholder="事件："></textarea>
								<br/>
								<input type="url" placeholder="网址："></input>
								<div class="button">
									<input type="reset" id="close" value="关闭" />
									<input type="submit" id="submit" value="添加" />
								</div>
							</form>
						</div>
					</div>
				</div>

			<div class="main">
				<!--右侧内容-->
				<div class="cont" >
					<div class="title">管理推文</div>
					<div class="details">
						<div class="details_operation clearfix">
							<div class="bui_select">
							</div>
							<div class="fr">
								<div class="text">
									<span>帖子标题：</span>
									<div class="bui_select">
										<select name="" id="" class="select">
											<c:forEach var="postInfo" items="${ ALLPOSTS }">
												<option value="1">${ postInfo.ownerInfo.user_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="text">
									<span>发表时间：</span>
									<div class="bui_select">
										<select name="" id="" class="select">
											<c:forEach var="postInfo" items="${ ALLPOSTS }">
												<option value="1">${ postInfo.post_date }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="text">
									<span>搜索</span>
									<input type="text" value="" class="search">
								</div>
							</div>
						</div>
						<!--表格-->
						<div  style="overflow-y: auto; max-height: 480px;">
						<table class="table" >
							<thead>
								<tr>
									<th width="7%">编号</th>
									<th width="20%">标题</th>
									<th width="48%">内容</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="postInfo" items="${ ALLPOSTS }" varStatus="status">
									<tr class="postInfo-row${ status.index }">
										<td>
											<input type="checkbox" id="${ status.index }" class="check">
											<label for="${ status.index }" class="label">${ status.count }</label>
										</td>
										<td>${ postInfo.post_title }</td>
										<td>${ postInfo.post_content }</td>
										<td align="center">
											<input type="button" value="查看" class="btn update">
											<c:if test="${  postInfo.post_status == 0 }">
												<input type="button" value="屏蔽" class="btn block-btn" id="${ postInfo.post_id }">
											</c:if>
											<c:if test="${  postInfo.post_status == 1 }">
												<input type="button" value="解除屏蔽" class="btn unBlock-btn" id="${  postInfo.post_id }">
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
			<!--左侧列表-->
			<div class="menu">
				<div class="cont">
					<div class="title">管理员</div>
					<ul class="mList">
						<li><h3></h3></li>
						<li>
						<h3><span>+</span>用户 </h3>
						<dl>
							<dd><a href="AccountManagement.jsp">管理用户</a> </dd>
							<dd><a href="PostManagement.jsp">管理推文</a></dd>
						</dl>
					</li>
					<li>
						<h3><span>+</span>内容</h3>
						<dl><dd><a href="../FindRecordsServlet">管理Records</a></dd>
							<dd><a href="StarsCardManagement.jsp">管理Stars</a></dd>
							<dd><a href="#">备用...</a></dd>
						</dl>
					</li>
					</ul>
				</div>
			</div>

		</div>
	</body>
	<script src="../dist/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(function() {
			//打开添加的悬浮框
			$(".add").click(function() {
				$(".dialog-content > h3").html("添加记录");
				$("#submit").show();
				$(".overlay,.dialog").addClass("show");
			});
			$(".update").click(function() {
				$(".dialog-content > h3").html("详细信息");
				$("#submit").hide();
				$(".overlay,.dialog").addClass("show");
			});
			//关闭悬浮框
			$("#close , .overlay").click(function() {
				$(".overlay,.dialog").removeClass("show");
			});
			
			//菜单想的展开和收起
			$("li > h3").click(function() {
				$(this).siblings().toggle(600);
			});
			
			//屏蔽推文
			$(".block-btn, .unBlock-btn").click(function() {
				var postId = $(this).attr("id");
				var url = "../BlockPostServlet?postId="+parseInt(postId)+"&isBlock=true";				
				if ($(this).hasClass("block-btn")) {
					$.get(url,function(data,status){
						window.location.reload();
					});
				} else {
					url = "../BlockPostServlet?postId="+parseInt(postId)+"&isBlock=false";
					$.get(url,function(data,status){
						window.location.reload();
					});
				}
			});
		});
	</script>

</html>