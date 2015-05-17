<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%@ page import="bean.RecordsInfo, biz.RecordsInfoBiz"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<%
	RecordsInfoBiz recordInfoBiz = new RecordsInfoBiz();
	List<RecordsInfo> recordsInfoList = recordInfoBiz.findRecordList("");
	List<String> yearList = new ArrayList<String>(); 
	for(RecordsInfo recordsInfo : recordsInfoList) {
	String year = recordsInfo.getRecord_date().substring(0, 4);
	if (yearList.indexOf(year) == -1) { 
		yearList.add(year);
	} } 
	pageContext.setAttribute("YEARS", yearList); 
	pageContext.setAttribute("RECORDSINFO_LIST", recordsInfoList);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="dist/css/about.css">
<style>
.page {
	width: 100%;
	height: 100%;
	height: auto !important;
	padding-top: 100px;
	padding-bottom: 50px;
	background: #F0F0F0 url('images/dian2.png') repeat-x;
}

a {
	text-decoration: none;
}

.header {
	top: 0;
	width: 100%;
	height: 50px;
	text-align: right;
	padding: 10px;
	background-color: #428bca;
	position: fixed;
	z-index: 2;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.nav a {
	font-size: 18px;
	color: #000000;
	margin: 10px;
}

.footer {
	position: fixed;
	margin-top: -60px;
	bottom: 0;
	background: #fff;
	width: 100%;
	height: 60px;
	/*脚部的高度*/
}
</style>
<title>Records</title>
</head>

<body>
	<div class="page">
		<div class="header">
			<nav class="nav">
				<a class="nav-item select" id="hot-news" href="">HotNews</a> <a
					class="nav-item" id="culture" href="Knowlage&Culture.html">Knowledge&amp;Culture</a>
				<a class="nav-item" id="stars" href="Stars.html">Stars</a> <a
					class="nav-item" id="records" href="Records.html"
					style="color: #ffffff;">Records</a>
					<a class="nav-item" id="blog" href="index.jsp">Blog</a>
			</nav>
		</div>
		<div class="box">
			<ul class="event_year">
				<c:forEach var="years" items="${ YEARS }">
					<li><label for="${ years }"> <c:out value="${ years }" />
					</label></li>
				</c:forEach>
			</ul>
			<ul class="event_list">
				<c:forEach var="years" items="${ YEARS }">
					<div>
						<h3 id="${ years }">${ years }</h3>
						<c:forEach var="recordInfo" items="${ RECORDSINFO_LIST }">
							<c:set var="years" value="${ years }" />
							<c:set var="date" value="${ recordInfo.record_date }" />
							<c:set var="year" value="${fn:substring(date,0,4)}" />

							<c:choose>
								<c:when test="${ year == years}">
									<li><span>${fn:substring(date,6,11)}</span>
										<p>
											<span>${ recordInfo.record }</span>
										</p></li>
								</c:when>
							</c:choose>
						</c:forEach>

					</div>
				</c:forEach>

			</ul>
		</div>

	</div>
	<script src="dist/js/jquery-2.1.3.min.js" type="text/javascript"></script>
	<script>
		$(function() {
			$(".event_year li:first").addClass('current');
			$('label').click(
					function() {
						$('.event_year>li').removeClass('current');
						$(this).parent('li').addClass('current');
						var year = $(this).attr('for');
						$('#' + year).parent().prevAll('div').slideUp(800);
						$('#' + year).parent().slideDown(800).nextAll('div')
								.slideDown(800);
					});
		});
	</script>

	<div class="footer" style="text-align: center; clear: both">
		<p>篮球史上的大事件...</p>
		<p>
			作者：<a href="#">liufei</a>
		</p>
	</div>
</body>

</html>