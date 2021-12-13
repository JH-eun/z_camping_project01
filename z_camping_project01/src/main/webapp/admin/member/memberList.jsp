<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<script type="text/javascript">
	function go_search()
	{
		document.frm.action="GetReadyServlet?command=admin_member_list";
		document.frm.submit();
	}
</script>
<article>
	<h1>회원리스트</h1>
	<form name="frm" method="post">
		<table style="float:right;" >
			<tr>
				<td>회원이름
				<input type="text" name="key">
				<input class="btn btn-outline-dark btn-sm" type="button" value="검색" onClick="go_search()">
				</td>
			</tr>
		</table>
		<br>
		<table class="table table-bordered">
			<tr>
				<th style="font-size: 14px;">아이디(탈퇴여부)</th><th style="font-size: 14px;">이름</th>
				<th style="font-size: 14px;">이메일</th><th style="font-size: 14px;">우편번호</th>
				<th style="font-size: 14px;">주소</th><th style="font-size: 14px;"> 전화</th><th style="font-size: 14px;">가입일</th>
			</tr>
			<c:forEach items="${memberList }" var="memberVO">
			<tr>
				<td>${memberVO.id }
				<c:choose>
					<c:when test='${memberVO.useyn=="y" }'>
						<input type="checkbox" name="useyn" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="useyn" checked="checked" disabled="disabled">
					</c:otherwise>
				</c:choose>
				</td>
				<td>${memberVO.name }</td>
				<td>${memberVO.email }</td>
				<td>${memberVO.postal_code }</td>
				<td>${memberVO.address }</td>
				<td>${memberVO.phone }</td>
				<td><fmt:formatDate value="${memberVO.indate }"/></td>
			</tr>
			</c:forEach>
		</table>
	</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>