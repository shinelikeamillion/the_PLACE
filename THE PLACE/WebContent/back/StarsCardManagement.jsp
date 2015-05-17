<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<%
	int id;
	PlayerInfoBiz playerInfoBiz = new PlayerInfoBiz();

	if (session.getAttribute("ADMININFO") == null) {
		response.sendRedirect("../Signin.jsp?error=2");
	}
	if (request.getParameter("point") != null) {
		String point = request.getParameter("point");
		//下面的方法改为模糊查询,名字就先不换了
		pageContext.setAttribute("ALLSTARS", playerInfoBiz.findPlayerInfoByPoint(point));
		pageContext.setAttribute("POINT", point);
	} else {
		//全部遍历
		pageContext.setAttribute("ALLSTARS", playerInfoBiz.findPlayerInfoByPoint(""));
	}
%>

<head>
<meta charset="utf-8">
<title>管理球星卡</title>
<link rel="stylesheet" href="style/backstage.css">
<style type="text/css">
.dialog {
	position: absolute;
	width: 46%;
	top: 10px;
	margin-left: 27%;
	z-index: 100;
	visibility: hidden;
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
	font-size: 2.0em;
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
	border: 0px;
	background: rgba(0, 0, 0, 0.1);
}

.dialog-content textarea {
	height: 5em;
}

.dialog-content .button input {
	width: 220px;
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

#face-img {
	width: 160px;
	height: 160px;
	float: left;
}

#face {
	float: left;
	position: absolute;
	height: 20px;
	font-size: 6pt;
	width: 160px;
}

#name, #height, #weight {
	margin-top: 5px;
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
			<a href="#">THE PLACE</a><span>&gt;&gt;</span>内容<span>&gt;&gt;</span>管理球星卡
		</div>
		<div class="link fr">
			<a href="AccountManagement.jsp" class="icon icon_i">首页</a><span></span>
			<a href="#" class="icon icon_j">前进</a><span></span>
			<a href="#" class="icon icon_t">后退</a><span></span>
			<a href="StarsCardManagement.jsp" class="icon icon_n">刷新</a><span></span>
			<a href="../Logout" class="icon icon_e">退出</a>
		</div>
	</div>
	<div class="content clearfix">

		<!--用来做遮盖弹出框的背景-->
		<div class="overlay"></div>
		<!--弹出框-->
		<div class="dialog">
			<div class="dialog-content">
				<h3>添加球星卡</h3>
				<div>
					<form action="" method="get">
						<img id="face-img" src="../userfaces/default.png" /> <input
							id="face" type="file" onchange="preview(this)" /> <input
							id="name" name="player_name" placeholder="Name:" /> <input
							id="height" name="player_height" placeholder="Height:" /> <input
							id="weight" name="player_weight" placeholder="Weight:" /> <input
							id="country" name="player_country" placeholder="Country:" /> <input
							id="team" name="player_team" placeholder="Team:" /> <input
							id="id" name="player_id" hidden="true" /> <input
							id="specialty" name="player_specialty" placeholder="Specialty:" />
						<textarea id="prefession" rows="3" name="player_prefession"
							placeholder="Prefession:"></textarea>
						<div class="button">
							<input type="reset" id="close" value="关闭" /> <input
								type="submit" id="submit" value="添加" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="main">
			<!--右侧内容-->
			<div class="cont">
				<div class="title">球星卡管理</div>
				<div class="details">
					<div class="details_operation clearfix">
						<div class="bui_select">
							<input type="button" value="添&nbsp;&nbsp;加" class="add">
						</div>
						<div class="fr">
							<div class="text">
								<span>搜索</span> <input type="text" value="" class="search">
							</div>
						</div>
					</div>
					<!--表格-->
					<table class="table" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th width="8%">编号</th>
								<th width="17%">球星</th>
								<th width="52%">生涯</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="starInfo" items="${ ALLSTARS }"
								varStatus="status">
								<tr class="starInfo-row${ status.index }">
									<td><input type="checkbox" id="${ status.index }"
										class="check"> <label for="${ status.index }"
										class="label">${status.count}</label></td>
									<td>${ starInfo.player_name }</td>
									<td>${ starInfo.player_prefession }</td>
									<td hidden="true">${ starInfo.player_id }</td>
									<td hidden="true">${ starInfo.player_face }</td>
									<td hidden="true">${ starInfo.player_country }</td>
									<td hidden="true">${ starInfo.player_height }</td>
									<td hidden="true">${ starInfo.player_weight }</td>
									<td hidden="true">${ starInfo.player_team }</td>
									<td hidden="true">${ starInfo.player_specialty }</td>
									<td hidden="true">${ starInfo.player_prefession }</td>
									<td align="center"><input type="button" value="查看"
										class="btn update" id="starInfo-row${ status.index }" /> <input
										type="button" value="拉黑" class="btn" /></td>
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
				<div class="title">管理员</div>
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
		//打开添加的悬浮框
		$(".add").click(function() {
			$(".dialog-content > h3").html("添加记录");
			$("#submit").val("添加");
			$(".overlay,.dialog").addClass("show");
			$("#face-img").attr("src", "../userfaces/default.png");
		});
		$(".update").click(function() {
			$(".dialog-content > h3").html("修改记录");
			$("#submit").val("修改");
			$(".overlay,.dialog").addClass("show");

			var face_img = $("."+$(this).attr("id")+" td:eq(4)").html();
			var name = $("."+$(this).attr("id")+" td:eq(1)").html();
			var height = $("."+$(this).attr("id")+" td:eq(6)").html();
			var weight = $("."+$(this).attr("id")+" td:eq(7)").html();
			var country = $("."+$(this).attr("id")+" td:eq(5)").html();
			var team = $("."+$(this).attr("id")+" td:eq(8)").html();
			var specialty = $("."+$(this).attr("id")+" td:eq(9)").html();
			var prefession = $("."+$(this).attr("id")+" td:eq(2)").html();
			var id = $("."+$(this).attr("id")+" td:eq(3)").html();
			
			$("#face-img").attr("src", "../"+face_img);
			$("#name").val(name);
			$("#height").val(height);
			$("#weight").val(weight);
			$("#country").val(country);
			$("#team").val(team);
			$("#specialty").val(specialty);
			$("#prefession").val(prefession);
			$("#id").val(id); 
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
		$("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
            	var point = $(".search").val();
            	location.href = "StarsCardManagement.jsp?point="+point;
            }
        });
	});
</script>

</html>