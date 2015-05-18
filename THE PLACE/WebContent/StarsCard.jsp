<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.PlayerInfo, biz.PlayerInfoBiz"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
	PlayerInfoBiz playerInfoBiz = new PlayerInfoBiz();
	List<String> playerNames = playerInfoBiz.findPlayerName();
	pageContext.setAttribute("playerNames", playerNames);
	
	/* 判断是否第一次进入页面，初始化球星卡 */
	if(request.getSession().getAttribute("playerInfo")==null) {
		PlayerInfo playerInfo =	playerInfoBiz.findPlayerInfoByName("Michael Jeffrey Jordan");
		request.getSession().setAttribute("playerInfo", playerInfo);
	}
%>
<head>
<meta charset="utf-8">
<link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style>
.main {
	width: 100%;
	background: #F0F0F0 url('images/dian2.png') repeat-x;
	padding-top: 100px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	overflow: hidden;
}

a {
	text-decoration: none;
}
.main-header {
	top: 0;
	width: 100%;
	height: 50px;
	text-align: right;
	padding: 10px;
	background-color: #428bca;
	position: fixed;
	z-index: 2;
}

.nav a {
	font-size: 18px;
	color: #000000;
	margin: 10px;
}

footer {
	padding: 10px;
	color: #999;
	background-color: #f9f9f9;
	text-align: center;
	border-top: 1px solid #e5e5e5;
}

.flip {
	float: left;
	width: 400px;
	height: 500px;
	margin-left: 20px;
	position: relative;
	perspective: 1000px;
	z-index: 5;
}

.flip div {
	width: 100%;
	height: 100%;
	position: fixed;
	transition: all 1s ease;
	transform-style: preserve-3d;
	backface-visibility: hidden;
	box-shadow: 2px 2px 20px rgba(0, 0, 0, .5);
}

.flip div.front {
	background-repeat: no-repeat;
	background-position: center;
}

.flip div.back {
	background-color: #d94839;
}

.Y div.back {
	transform: rotateY(180deg);
}

.Y:hover div.front {
	transform: rotateY(-180deg);
}

.Y:hover div.back {
	transform: rotateY(0deg);
}

.back table {
	width: 100%;
}

.back th {
	font-size: 1.5em;
	color: #FFFFFF;
	padding: 10px;
	text-transform: uppercase;
	text-align: center;
	background: rgba(0, 0, 0, 0.1);
}

.back td {
	font-size: 1.2em;
	font-weight: 300px;
	min-width: 80px;
	color: #FFFFFF;
	padding: 5px;
}

.about {
	left: 40%;
	width: 200px;
	position: absolute;
	margin-top: -80px;
	background-color: #f5f5f5;
	border-radius: 4px;
	padding: 15px;
	box-shadow: 5px 5px 15px #888888;
	z-index: 3;
}

.right {
	float: right;
	width: 620px;
	padding: 0 2em;
	min-height: 500px;
	position: relative;
	padding-left: 140px;
	padding-top: 20px;
	box-shadow: -2px 0 0 rgba(0, 0, 0, 0.1);
}

button {
	border: none;
	padding: 0.6em 1.2em;
	background: #c0392b;
	color: #fff;
	font-family: 'Lato', Calibri, Arial, sans-serif;
	font-size: 1em;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	display: inline-block;
	margin: 3px 2px;
	border-radius: 2px;
}
</style>
<title>球星卡</title>
</head>

<body>
	<div class="main">
		<div class="main-header">
			<nav class="nav">
				<a class="nav-item" id="hot-news" href="">HotNews</a> <a
					class="nav-item" id="culture" href="Knowlage&Culture.html">Knowledge&amp;Culture</a>
				<a class="nav-item" id="stars" href="Stars.html"
					style="color: #ffffff;">Stars</a> <a class="nav-item" id="records"
					href="Records.jsp">Records</a>
					<a class="nav-item" id="blog" href="index.jsp">Blog</a>
			</nav>
		</div>

		<div class="container">

			<!--
                	作者：940788048@qq.com
                	时间：2015-05-10
                	描述：中间的提示
                -->
			<div class="about">
				<h4>
					<em>球星卡--</em>
				</h4>
				<p>
					<br /> <strong>鼠标移到球星卡上可以查看球星资料</strong>
				</p>
			</div>

			<!--
                	作者：940788048@qq.com
                	时间：2015-05-10
                	描述：左边的球星卡部分
                -->
			<div class="flip Y">
				<div class="front" style="background: url(${ playerInfo.player_face });"></div>
				<div class="back">
					<table>
						<tr>
							<th colspan="2"><c:out value="${ playerInfo.player_name }" default="Michael Jeffrey Jordan"/></th>
						</tr>
						<tr>
							<td>国 籍:</td>
							<td><c:out value="${ playerInfo.player_country }" default="美 国--纽约市布鲁克林区"/></td>
						</tr>
						<tr>
							<td>身高:</td>
							<td><c:out value="${ playerInfo.player_height }" default="198.0"/>cm</td>
						</tr>
						<tr>
							<td>体重:</td>
							<td><c:out value="${ playerInfo.player_weight }" default="98.1"/>KG</td>
						</tr>
						<tr>
							<td>球队:</td>
							<td><c:out value="${ playerInfo.player_team }" default="芝加哥公牛（1984-1998），华盛顿奇才（2001-2003）"/></td>
						</tr>
						<tr>
							<td>特点:</td>
							<td><c:out value="${ playerInfo.player_specialty }" default="得分、防守、领导力超强"/></td>
						</tr>
						<tr>
							<td>生涯:</td>
							<td><c:out value="${ playerInfo.player_prefession }" default="6次NBA总冠军 2次奥运会冠军 3次NBA全明星MVP 5次常规赛MVP 6次总决赛MVP"/></td>
						</tr>
					</table>
				</div>
			</div>

			<!--
                	作者：940788048@qq.com
                	时间：2015-05-10
                	描述：右边的选项钮
                -->
			<div class="right">
				<c:forEach var="names" items="${ playerNames }">
					<button class="stars-btn" ><c:out value="${ names }"></c:out></button>
				</c:forEach>
			</div>
		</div>

		<footer class=" col-sm-12 blog-footer">
			<p>
				Blog template built for <a href="#">the PLACE</a> by <a href="#">@liufei</a>.
			</p>
			<p>
				<a href="#">Back to top</a>
			</p>
		</footer>
	</div>
	<script src="dist/js/jquery-2.1.3.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$(".stars-btn").click(function(){
				
				var url = "./findPlayerByNameServlet?playerName="+$(this).html();
				$.get(url,function() {
					window.location.reload();
				});
			});
		}); 
	</script>
</body>

</html>