<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편 변호 검색</title>
<link href="css/subpage.css" rel="stylesheet">
<style type="text/css">
body{
	background-color: #B96DB5;
	font-family: Verdana;
}
#popup{
	padding: 0 10px;
}
#popup h1{
	font-family: "Times New Roman", Times, serif;
	font-size: 45px;
	color: #CCC;
	font-weight: normal;
}
table#postal_code{
	border-collapse:collapse;
	border-top: 3px solid #fff;
	border-bottom: 3px solid #fff;
	width: 100%;
	margin-top: 15px;
}
table#postal_code th, table#postal_code td{
	text-align: center;
	border-bottom: 1px dotted #fff;
	color:#fff;
}
table th, td{
	padding: 10px;
}
table#postal_code a{
	display:block;
	height:20px;
	text-decoration:none;
	color:#fff;
	padding: 10px;
}
table#postal_code a:hover{
	color: #f90;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function result(postal_code,sido,gugun,gil){
		opener.document.formm.postal_code.value=postal_code;
		opener.document.formm.addr1.value=sido+" "+gugun+" "+gil;
		self.close();
};
</script>
</head>
<body>
<div id="popup">
	<h1>우편번호검색</h1>
	<form method="post" name="formm" action="GetReadyServlet?command=find_postal_code">
		길 이름 : <input name="gil" type="text">
		<input type="submit" value="찾기" class="submit">
	</form>
	<table id="postal_code">
		<tr>
			<th>우편변호</th>
			<th>주소</th>
		</tr>
		<c:forEach items="${addressList }" var="addressVO">
		<tr>
			<td>
				<a href="#" onclick="return result('${addressVO.postal_code }','${addressVO.sido }','${addressVO.gugun }','${addressVO.gil }')">
					${addressVO.sido } ${addressVO.gugun } ${addressVO.gil }
				</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>