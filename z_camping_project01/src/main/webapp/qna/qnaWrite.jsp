<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>
	<article>
		<h2> 1 : 1 고객 게시판 </h2>
		<h6> 고객님의 질문에 대해서 운영자가 1 : 1 답변을 드립니다. </h6>
		<form name="formm" method="post" action="GetReadyServlet?command=qna_write">
			<fieldset>
				<label>Title</label>
				<input type="text" name="subject" size="50"><br>
				<label>Content</label>
				<textarea rows="8" cols="65" name="content"></textarea><br>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" value="글쓰기" class="btn btn-outline-success btn-sm" style="width:100px;">
				<input type="reset" value="취소" class="btn btn-outline-success btn-sm" style="width:100px;">
				<input type="button" value=" 쇼핑 계속하기 " class="btn btn-outline-success btn-sm" style="width:120px;" onclick="location.href='GetReadyServlet?command=index'">
			</div>	
		</form>
	</article>
<%@ include file="../footer.jsp" %>