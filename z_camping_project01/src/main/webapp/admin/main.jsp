<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetReady Admin</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript">
function worker_check()
{
	if(document.frm.workerId.value==""){
		alert("아이디를 입력하세요.");
		return false;
	}else if(document.frm.workerPwd.value==""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
	}
</script>
</head>

<body>
	<div id="wrap">
		<header>
			<div id="logo">
				<a href="index.jsp">
				<img src="admin/images/img_logo8.jpeg">
				</a>
			</div>
		</header>
		<div class="clear"></div>
		 <br><br><br><br><br><br>
			<div id="loginform">
				<form name="frm" method="post" action="GetReadyServlet?command=admin_login">
					<table style="margin-left:120px;">
						<tr>
							<td> 아 이 디 </td>
							<td><input type="text" name="workerId" size="10"></td>
						</tr>
						<tr>
							<td> 비밀번호 </td>
							<td><input type="password" name="workerPwd" size="10">
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<input class="btn" type="submit" value="업무 로그인" onclick="return worker_check()"><br><br>
								<h4 style="color:red;">${message }</h4>
							</td>
						</tr>
					</table>
				</form>
			</div>
		 
	</div>
</body>
</html>