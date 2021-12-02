<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
<%-- <%@ include file="/admin/sub_menu.jsp" %> --%>
<script type="text/javascript">
	function go_list(){
		var theForm = document.frm;
		theForm.action = "GetReadyServlet?command=admin_qna_list";
		theForm.submit();
	}
	
	function go_rep(qnanum){
		var theForm = document.frm;
		theForm.qnanum.value = qnanum;
		theForm.action = "GetReadyServlet?command=admin_qna_repsave";
		theForm.submit();
	}
</script>
<article>
<h1>Q&amp;A 게시판</h1>
<form name="frm" method="post">
	<input type="hidden" name="qnanum">
	<!-- <table id="orderList"> -->
	<table class="table table-bordered" style="margin-left:150px; width: 80%;">
		<tr>
			<th style="width:20%; font-size:14px;">제목</th>
			<td>${qnaVO.subject } ${qnaVO.rep }</td>
		</tr>
		<tr>
			<th style="width:20%; font-size:14px;">등록일</th>
			<td><fmt:formatDate value="${qnaVO.indate }"/></td>
		</tr>
		<tr>
			<th style="width:20%; font-size:14px;">내용</th>
			<td>${qnaVO.content }</td>
		</tr>
	</table>
	<c:choose>
		<c:when test='${qnaVO.rep=="1" }'>
		<!-- <table id="orderList"> -->
		<table class="table table-bordered" style="margin-left:150px; width: 80%;">
			<tr>
				<td colspan="2">
					<img src="admin/images/opinionimg01.gif">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="reply" rows="3" cols="50"></textarea>
					<input type="button" class="btn btn-outline-dark btn-sm" value="저장" onClick="go_rep('${qnaVO.qnanum}')">
				</td>
			</tr>
		</table>
		<br>
		</c:when>
		<c:otherwise>
			<!-- <table id="orderList"> -->
			<table class="table table-bordered" style="margin-left:150px; width: 80%;">
				<tr>
					<th style="width:20%; font-size:14px;">댓글</th>
					<td>${qnaVO.reply }</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<input type="button" class="btn btn-outline-dark btn-sm" value="목록" onClick="go_list()">
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>