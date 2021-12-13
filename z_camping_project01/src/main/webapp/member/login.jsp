<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<article>
		<h1>Login</h1>
		<form method="post" action="GetReadyServlet?command=login">
			<fieldset>
				<legend></legend>
				<br><br>
					<label>User ID</label>
					<input name="id" type="text" value="${id }" value="one"><br>
					<label>Password</label>
					<input name="pwd" type="password" ><br>
			</fieldset>
			<div class="clear"></div>	
			<br>
			<div id="buttons">
				<input type="submit" value="로그인" class="btn btn-outline-success btn-sm" style="width:100px;">&nbsp;
				<input type="button" value="회원가입" class="btn btn-outline-success btn-sm" style="width:100px;" onclick="location='GetReadyServlet?command=join_form'">
			</div>
			<br><br><br>
		</form>
	</article>
	<br>
<%@ include file="../footer.jsp" %>