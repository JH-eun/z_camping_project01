<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
	background-color:white;
	font-family: verdana;
}
#wrap{
	margin: 0 20px;
}
h1{
	font-family: verdana;
	color: black;
	font-weight: normal;
}
/* input[type=button], input[type=submit]{
	float: left;
} */
</style>
<script type="text/javascript">
	function idok(){
		opener.formm.id.value="${id}";
		opener.formm.reid.value="${id}";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복 확인</h1>
		<form method="post" name="formm" style="margin-right: 0;" action="GetReadyServlet?command=id_check_form">
			User ID 
			<input type="text" name="id" value="">
			<input type="submit" value="검색" class="btn btn-outline-success btn-sm" style="width:100px; "><br>
				<div style="margin-top: 10px">
					<c:if test="${message == 1 }">
						<script type="text/javascript">
							opener.document.formm.id.value="";
						</script>
						${id }는 이미 사용중인 아이디입니다.
					</c:if>
					<c:if test="${message == -1 }">
						${id }는 사용 가능한 ID 입니다.
						<input type="button" value="사용" class="btn btn-outline-success btn-sm" style="width:100px;" onclick="idok()">
					</c:if>	
				</div>
		</form>
	</div>
</body>
</html>