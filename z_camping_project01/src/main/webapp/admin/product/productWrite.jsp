<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<article>
<h1>상품등록</h1>
<form name="frm" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="margin-left:150px; width: 80%;">
		<tr>
			<th width=15% style="font-size: 14px;">상품분류</th>
			<td colspan="5" style="text-align:left;">
				<select name="kind">
					<c:forEach items="${kindList }" var="kind" varStatus="status">
						<option value="${status.count }">${kind }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" style="font-size: 14px;">상품명</th>
			<td colspan="5" style="text-align:left;">
				<input type="text" name="pname" size="100" maxlength="100">
			</td>
		</tr>
		<tr>
			<th style="font-size: 14px; width=15%;">원가[A]</th>
			<td width="18%">
				<input type="text" name="price1" size="28" onKeyUp='NumFormat(this)'>
			</td>
			<th style="font-size: 14px; width=15%;"> 판매가[B]</th>
			<td width="18%">
				<input type="text" name="price2" size="28" onBlur="go_ab()" onKeyUp='NumFormat(this)'>
			</td>
			<th style="font-size: 14px; width=15%;">[B-A]</th>
				<td width="18%">
					<input type="text" name="price3" size="28" readonly onKeyUp='NumFormat(this)'>
				</td>
		</tr>
		<tr>
			<th style="font-size: 14px;">상세설명</th>
			<td colspan="5">
				<textarea name="content" rows="20" cols="150"></textarea>
			</td>
		</tr>
		<tr>
			<th style="font-size: 14px;">상품이미지</th>
			<td width="343" colspan="5">
				<input type="file" name="image" style="float:left;">
			</td>
		</tr>
	</table>
	<input class="btn btn-outline-dark btn-sm" type="button" value="등록" onClick="go_save()">
	<input class="btn btn-outline-dark btn-sm" type="button" value="취소" onClick="go_mov()">
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>