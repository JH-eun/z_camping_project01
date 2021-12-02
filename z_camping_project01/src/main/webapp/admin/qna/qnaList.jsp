<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<%-- <%@ include file="/admin/sub_menu.jsp" %> --%>
<script type="text/javascript">
	function go_view(qnanum){
		var theForm = document.frm;
		theForm.qnanum.value = qnanum;
		theForm.action = "GetReadyServlet?command=admin_qna_detail";
		theForm.submit();
	}
</script>

<article>
<h1>Q&amp;A 리스트</h1>
<form name="frm" method="post">
	<input type="hidden" name="qnanum">
	<!-- <table id="orderList"> -->
	<table class="table table-bordered">
		<tr>
			<th style="font-size: 14px;">번호(답변여부)</th><th style="font-size: 14px;">제목</th><th style="font-size: 14px;">작성자</th><th style="font-size: 14px;">작성일</th>
		</tr>
		<c:forEach items="${qnaList }" var = "qnaVO">
		<tr>
			<td width=15%>
				${qnaVO.qnanum }
				<c:choose>
					<c:when test='${qnaVO.rep=="1" }'>(미처리)</c:when>
					<c:otherwise>(답변처리완료)</c:otherwise>
				</c:choose>
			</td>
			<td width=50%>
				<a href="#" onClick="javascript:go_view('${qnaVO.qnanum}')">
					${qnaVO.subject }
				</a>
			</td>
			<td width=15%> ${qnaVO.id }</td>
			<td width=15%><fmt:formatDate value="${qnaVO.indate }"/></td>
		</tr>
		</c:forEach>
	</table>
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>