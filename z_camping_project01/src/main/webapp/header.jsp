<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET READY</title>
<link href="css/shopping.css" rel="stylesheet">
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="mypage/mypage.js"></script>
</head>

<body>
<div id="wrap">
	<!-- header -->
	<header>
		<!-- logo -->
		<div id="logo">
			<a href="GetReadyServler?command=index">
				<img src="images/logo.gif" width="180" height="100" alt="getready">
			</a>
		</div>
		<!-- logo end -->
		<nav id="catagory_menu">
			<ul>
				<c:choose>
				<c:when test="${empty sessionScope.loginUser }">
				<li><a href="GetReadyServlet?command=login_form">LOGIN</a></li>
				<li></li>
				<li><a href="GetReadyServlet?command=contract">JOIN</a></li>
				</c:when>
				<c:otherwise>
				<li style="color:orange">${sessionScope.loginUser.name }($sessionScope.loginUser.id})</li>
				<li><a href="GetReadyServlet?command=logout">LOGOUT</a></li>
				</c:otherwise>
				</c:choose>
				<li></li>
				<li><a href="GetReadyServlet?command=cart_list">CART</a></li>
				<li></li>
				<li><a href="GetReadyServlet?command=mypage">MY PAGE</a></li>
				<li></li>
				<li><a href="GetReadyServlet?command=qna_list">Q&amp;A(1:1)</a></li>
			</ul>
		</nav>
		
		<nav id="top_menu">
			<ul >
				<li><a href="GetReadyServlet?command=catagory&kind=1">텐트</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=2">타프</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=3">매트/침낭</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=4">코펠/버너/취사</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=5">의자/테이블</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=6">화로대/BBQ</a></li>
				<li><a href="GetReadyServlet?command=catagory&kind=7">기타장비</a></li>
			</ul>
		</nav>
		<div class="clear"></div>
		<hr>
	</header>
<!-- header end-->