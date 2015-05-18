<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<%
	int id;
	UserInfoBiz userInfoBiz = new UserInfoBiz();
	
	if (session.getAttribute("ADMININFO") == null) {
		//response.sendRedirect("../Signin.jsp?error=2");
	}
	if (request.getParameter("point") != null) {
		String point = request.getParameter("point");
		pageContext.setAttribute("ALLUSERS", userInfoBiz.findAllUsersInfo(point));
		pageContext.setAttribute("POINT", point);
	} else {
		pageContext.setAttribute("ALLUSERS", userInfoBiz.findAllUsersInfo("%%"));
	}
%>
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

.dialog-content>div {
	padding: 15px 40px 20px;
	font-weight: 300;
	font-size: 1.15em;
}

.dialog-content input, textarea {
	color: #ffffff;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
	font-size: 20px;
	font-size: 1em;
	border: 0px;
	padding-left: 10px;
	margin-top: 15px;
	background: rgba(0, 0, 0, 0.1);
}

.dialog-content textarea {
	height: 5em;
	font-size: 1em;
}

.dialog-close-btn {
	font-size: 1em;
	padding: 0.6em 1.2em;
	background: #c0392b;
	border-radius: 2px;
	margin-top: 20px;
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
		<div class="link fl">
			<a href="#">THE PLACE</a><span>&gt;&gt;</span>用户<span>&gt;&gt;</span>管理用户
		</div>
		<div class="link fr">
			<a href="AccountManagement.jsp" class="icon icon_i">首页</a><span></span>
			<a href="#" class="icon icon_j">前进</a><span></span>
			<a href="#" class="icon icon_t">后退</a><span></span>
			<a href="AccountManagement.jsp" class="icon icon_n">刷新</a><span></span>
			<a href="../Logout" class="icon icon_e">退出</a>
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
						<img id="face" src="../userfaces/default.png" />
						<input id="user_id" name="user_id" hidden="true"/>
						<input id="name" name="user_name" /> 
						<input id="age" name="user_age" />
						<input id="sex" name="user_sex" />
						<input id="email" name="record_email" />
						<textarea id="pro" rows="3" name="record_pro"></textarea>
						<input type="reset" id="close" class="dialog-close-btn" value="关闭" />
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
							<input type="button" value="添加管理员:" class="add">
						</div>
						<div class="fr">
							<div class="text">
								<span>搜索</span> <input type="text" value="${ POINT }" class="search">
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
							<c:forEach var="userInfo" items="${ ALLUSERS }" varStatus="status">
								<tr class="userInfo-row${ status.index }">
									<td><input type="checkbox" id="${ status.index }"
										class="check"> <label for="${ status.index }"
										class="label">${status.count}</label></td>
									<td >${ userInfo.user_name }</td>
									<td >${ userInfo.user_email }</td>
									<td >${ userInfo.user_pro }</td>
									<td hidden="true">${ userInfo.user_face }</td>
									<td hidden="true">${ userInfo.user_age }</td>
									<td hidden="true">${ userInfo.user_sex }</td>
									<td hidden="true">${ userInfo.user_id }</td>
									<td align="center">
										<input type="button" value="查看" class="btn show" id="userInfo-row${ status.index }" />
										<c:if test="${ userInfo.user_status == 0 }">
											<input type="button" value="拉黑" class="btn block-btn" id="${ userInfo.user_id }"/>
										</c:if>
										<c:if test="${ userInfo.user_status == 1 }">
											<input type="button" value="已拉黑" class="btn unBlock-btn" id="${ userInfo.user_id } "/>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--左侧列表-->
		<div class="menu">
			<div class="cont">
				<div class="title">
					管理员 :<em style="float: right;">${ ADMININFO.admin_name }</em>
				</div>
				<ul class="mList">
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
		//打开查看的悬浮框
		
		$(".show").click(function() {
			$(".overlay,.dialog").addClass("show");
			var name = $("."+$(this).attr("id")+" td:eq(1)").html();
			var email = $("."+$(this).attr("id")+" td:eq(2)").html();
			var pro = $("."+$(this).attr("id")+" td:eq(3)").html();
			var face = $("."+$(this).attr("id")+" td:eq(4)").html();
			var age = $("."+$(this).attr("id")+" td:eq(5)").html();
			var sex = $("."+$(this).attr("id")+" td:eq(6)").html();
			var id = $("."+$(this).attr("id")+" td:eq(6)").html();
			
			$("#face").attr("src", "../"+face);
			$("#name").val(name);
			$("#age").val(age);
			$("#sex").val(sex);
			$("#email").val(email);
			$("#pro").val(pro);
			$("#user_id").val(id);
			
		});
		//关闭悬浮框
		$("#close , .overlay").click(function() {
			$(".overlay,.dialog").removeClass("show");
		});
		//菜单想的展开和收起
		$("li > h3").click(function() {
			$(this).siblings().toggle(600);
		});
		//回车进行搜索
		$(".block_btn").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
            	var point = $(".search").val();
            	location.href = "AccountManagement.jsp?point="+point;
            }
        });
		
		//拉黑用户
		$(".block-btn, .unBlock-btn").click(function() {
			var userId = $(this).attr("id");
			var url = "../BlockUserServlet?userId="+parseInt(userId)+"&isBlock=true";
			
			if ($(this).hasClass("block-btn")) {
				$.get(url,function(data,status){
					alert(data);
					window.location.reload();
				});
			} else {
				url = "../BlockUserServlet?userId="+parseInt(userId)+"&isBlock=false";
				$.get(url,function(data,status){
					alert(data);
					window.location.reload();
				});
			}
		});
	});
</script>

</html>