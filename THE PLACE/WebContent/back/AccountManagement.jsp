<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>账户管理</title>
		<link rel="stylesheet" href="style/backstage.css">
		<style type="text/css">
			.dialog {
				position: fixed;
				width: 50%;
				top: 20px;
				margin-left: 25%;
				z-index: 100;
				color: #ffffff;
				visibility: hidden;
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
				margin-top: 15px;
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
			#face {
				width: 200px;
				height: 200px;
				border-radius: 50%;
				float: left;
			}
			#name, #age, #sex {
				width: 300px;
				float: right;
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
			<div class="link fl"><a href="#">THE PLACE</a><span>&gt;&gt;</span>用户<span>&gt;&gt;</span>管理用户</div>
			<div class="link fr">
				<a href="#" class="icon icon_i">首页</a><span></span><a href="#" class="icon icon_j">前进</a><span></span><a href="#" class="icon icon_t">后退</a><span></span><a href="#" class="icon icon_n">刷新</a><span></span><a href="#" class="icon icon_e">退出</a>
			</div>
		</div>
		<div class="content clearfix">

			<!--用来做遮盖弹出框的背景-->
			<div class="overlay"></div>
			<!--弹出框-->
			<div class="dialog">
				<div class="dialog-content">
					<h3>详细资料</h3>
					<div>
						<form action="" method="get">
							<img id="face" src="../images/default_pic.png" />
							<input id="name" name="record_name" />
							<input id="age" name="record_age" />
							<input id="sex" name="record_sex" />
							<input id="email" name="record_email" />
							<textarea id="pro" rows="3" name="record_pro"></textarea>
							<div class="button">
								<input type="reset" id="close" value="关闭" />
								<input type="submit" id="submit" value="拉黑" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="main">
				<!--右侧内容-->
				<div class="cont">
					<div class="title">管理用户</div>
					<div class="details">
						<div class="details_operation clearfix">
							<div class="bui_select">
								<input type="button" value="添&nbsp;&nbsp;加" class="add">
							</div>
							<div class="fr">
								<div class="text">
									<span>搜索</span>
									<input type="text" value="" class="search">
								</div>
							</div>
						</div>
						<!--表格-->
						<table class="table" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th width="10%">编号</th>
									<th width="15%">用户名</th>
									<th width="20%">用户邮箱</th>
									<th width="30%">用户简介</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!--这里的id和for里面的c1 需要循环出来-->
									<td>
										<input type="checkbox" id="c1" class="check">
										<label for="c1" class="label">001</label>
									</td>
									<td>后台设计</td>
									<td>测试内容</td>
									<td>测试内容</td>
									<td align="center">
										<input type="button" value="查看" class="btn show">
										<input type="button" value="删除" class="btn">
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--左侧列表-->
			<div class="menu">
				<div class="cont">
					<div class="title">管理员--<em>${ ADMININFO.admin_name }</em></div>
					<ul class="mList">
						<li>
							<h3><span>+</span>用户</h3>
							<dl>
								<dd><a href="AccountManagement.jsp">管理用户</a>
								</dd>
								<dd><a href="PostManagement.html">管理推文</a>
								</dd>
							</dl>
						</li>
						<li>
							<h3><span>+</span>内容</h3>
							<dl>
								<dd>
									<a href="RecordsManagement.jsp">管理Records</a>
								</dd>
								<dd>
									<a href="/FindRecordsServlet">管理Stars</a>
								</dd>
								<dd>
									<a href="#">备用...</a>
								</dd>
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
			$(".show").click(function() {
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
		});
	</script>

</html>