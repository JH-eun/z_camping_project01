<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GetReady Admin</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript" src="admin/product/product.js"></script>
<c:choose>
	<c:when test="${empty workerId }">
		<script type="text/javascript">
			location.href='GetReadyServlet?command=admin_login_form';
		</script>
	</c:when>
</c:choose>
</head>
<body onload="go_ab()">
	<div id="wrap">
		<header>
			<!-- logo -->
			<div id="logo">
				<img src="admin/images/img_logo6.jpeg">
			</div>
			<!-- logo end -->
			
			<input class="btn btn-outline-success" type="button" value="logout" style="float: right;  margin-right:40px;"
				onclick="location.href='GetReadyServlet?command=admin_logout'">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-outline-success" type="button" value="home" style="float: right;  margin-right:10px;"
				onclick="location.href='GetReadyServlet?command=index'">
				
			<nav id="top_menu">
				<ul>
					<li><a href='GetReadyServlet?command=admin_product_list'> 상품리스트</a></li>
					<li><a href='GetReadyServlet?command=admin_order_list'> 주문리스트</a></li>
					<li><a href='GetReadyServlet?command=admin_member_list'> 회원리스트</a></li>
					<li><a href='GetReadyServlet?command=admin_qna_list'> Q&amp;A리스트</a></li>
				</ul>
			</nav>
		</header>
		<div class="clear"></div>
		<hr>
<!-- header end-->