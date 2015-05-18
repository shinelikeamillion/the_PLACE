<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.*, biz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<%
	int id;
	
	if (session.getAttribute("ADMININFO") == null) {
		//response.sendRedirect("../Signin.jsp?error=2");
	}
	if (request.getParameter("point") != null) {
		RecordsInfoBiz recordsInfoBiz = new RecordsInfoBiz();
		String point = request.getParameter("point");
		pageContext.setAttribute("POINT", point);
		List<RecordsInfo> recordList = recordsInfoBiz.findRecordList(point);
		pageContext.setAttribute("ALL_RECORDS_LIST", recordList);
	} 
%>

<head>
<meta http-equiv="content-type" content="text/html; charset="utf-8">
<title>管理记录</title>
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
			<a href="#">THE PLACE</a><span>&gt;&gt;</span>内容<span>&gt;&gt;</span>管理Records
		</div>
		<div class="link fr">
			<a href="AccountManagement.jsp" class="icon icon_i">首页</a><span></span>
			<a href="#" class="icon icon_j">前进</a><span></span>
			<a href="#" class="icon icon_t">后退</a><span></span>
			<a href="RecordsManagement.jsp" class="icon icon_n">刷新</a><span></span>
			<a href="../Logout" class="icon icon_e">退出</a>
		</div>
	</div>
	<div class="content clearfix">

		<!--用来做遮盖弹出框的背景-->
		<div class="overlay"></div>
		<!--弹出框-->
		<div class="dialog">
			<div class="dialog-content">
				<h3>添加记录</h3>
				<div>
					<form action="../addRecordsServlet" method="get">
						<input type="date" id="date" name="record_date"
							placeholder="Recore-date:"> <br />
						<textarea rows="3" id="record" placeholder="事件：" name="record"></textarea>
						<br /> <input type="url" id="url" placeholder="网址：" name="record_url"></input>
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
				<div class="title">管理Records</div>
				<div class="details">
					<div class="details_operation clearfix">
						<div class="bui_select">
							<input type="button" value="添&nbsp;&nbsp;加" class="add">
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
								<th width="5%">编号</th>
								<th width="10%">日期</th>
								<th width="60%">记录</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="records" items="${ ALL_RECORDS_LIST }"
								varStatus="status">
								<tr class="records${ status.index }">
									<!--这里的id和for里面的c1 需要循环出来-->
									<td><input type="checkbox" id="div${status.index}"
										class="check"> <label for="div${status.index}"
										class="label">${status.count}</label></td>
									<td>${ records.record_date }</td>
									<td>${ records.record }</td>
									<td hidden="true">${ records.record_url }</td>
									<td align="center"><input type="button" value="修改"
										class="btn update" id="records${ status.index }"> <input type="button" value="删除"
										class="btn"></td>
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
			
		});
		$(".update").click(function() {
			$(".dialog-content > h3").html("修改记录");
			$("#submit").val("修改");
			$(".overlay,.dialog").addClass("show");

			var date = $("."+$(this).attr("id")+" td:eq(1)").html();
			var record = $("."+$(this).attr("id")+" td:eq(2)").html();
			var url = $("."+$(this).attr("id")+" td:eq(3)").html();
			
			$("#date").val(date);$("#record").val(record);$("#url").val(url);
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
            	location.href = "RecordsManagement.jsp?point="+point;
            }
        });
	});
</script>

</html>