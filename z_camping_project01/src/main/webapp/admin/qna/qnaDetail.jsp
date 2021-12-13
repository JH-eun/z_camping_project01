<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>
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
	<table class="table table-bordered" style="margin-left:150px; width: 80%;">
		<tr>
			<th style="width:20%; font-size:14px;">제목</th>
			<td style="text-align: left;">${qnaVO.subject } ${qnaVO.rep }</td>
		</tr>
		<tr>
			<th style="width:20%; font-size:14px;">등록일</th>
			<td style="text-align: left;"><fmt:formatDate value="${qnaVO.indate }"/></td>
		</tr>
		<tr>
			<th style="width:20%; font-size:14px;">내용</th>
			<td style="text-align: left;">${qnaVO.content }</td>
		</tr>
	</table>
	<c:choose>
		<c:when test='${qnaVO.rep=="1" }'>
		<table class="table table-bordered" style="margin-left:150px; width: 80%;">
			<tr>
				<th style="width:20%; font-size:14px;">답변</th>
				<td colspan="2">
					<textarea name="reply" rows="10" cols="140"></textarea>
					
				</td>
			</tr>
		</table>
		<br>
		</c:when>
		<c:otherwise>
			<table class="table table-bordered" style="margin-left:150px; width: 80%;">
				<tr>
					<th style="width:20%; font-size:14px;">댓글</th>
					<td>${qnaVO.reply }</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<input type="button" class="btn btn-outline-dark btn-sm" value="저장" onClick="go_rep('${qnaVO.qnanum}')">
	<input type="button" class="btn btn-outline-dark btn-sm" value="목록" onClick="go_list()">
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>