<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET READY</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script> -->
<link href="css/shopping.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="mypage/mypage.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 사용할 function명 적어주기
function findAddr() {
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete: function(data){
				// 각 주소의 규칙에 따라 주소 조합
				// 가져올 변수가 없을때는 공백을 가지기 때문에 이를 참고해 분기한다고 한다
				var addr = ''; //주소 변수
				
				
				// 사용자가 선택한 주소타입(도로명/지번)에 따라 해당 값 가져오기
				// 만약 사용자가 도로명 주소를 선택했을 때
				if (data.userSelectedType == 'R') {
					addr = data.roadAddress;
				// 만약 사용자가 구주소를 선택했을 때
				} else {
					addr = data.jibunaddress;
				}
				
				// 우편번호
				document.getElementById('userZipcode').value = data.zonecode;
				// 주소정보
				document.getElementById('userAddress').value = addr;
				}
		}).open();
	});
}
</script>
</head>

<body>
<div id="wrap">
	<!-- header -->
	<header>
		<!-- logo -->
		<div id="logo">
			<a href="GetReadyServlet?command=index">
				<img src="images/img_logo.jpeg" width="180" height="100" alt="getready">
			</a>
		</div>
		<!-- logo end -->
		<nav id="catagory_menu">
			<ul>
				<c:choose>
				<c:when test="${empty sessionScope.loginUser }">
				<li>
				<a href="GetReadyServlet?command=login_form">LOGIN</a>
				</li>
				<li></li>
				<li><a href="GetReadyServlet?command=contract">JOIN</a></li>
				</c:when>
				<c:otherwise>
				<li style="color:orange">${sessionScope.loginUser.name }(${sessionScope.loginUser.id})</li>
				<li><a href="GetReadyServlet?command=logout">LOGOUT</a></li>
				</c:otherwise>
				</c:choose>
				<li></li>
				<li><a href="GetReadyServlet?command=cart_list">CART</a></li>
				<li></li>
				<li><a href="GetReadyServlet?command=mypage">MYPAGE&nbsp;&nbsp;&nbsp;</a></li>
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