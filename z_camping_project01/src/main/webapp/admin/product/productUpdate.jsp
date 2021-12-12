<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<article>
<h1>상품수정</h1>
<form name="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pnum" value="${productVO.pnum }">
	<input type="hidden" name="code">
	<input type="hidden" name="nonmakeImg" value="${productVO.image }">
	<table class="table table-bordered" style="margin-left:150px; width: 80%;">
		<tr>
			<th width=15% style="font-size: 14px;">상품분류</th>
			<td colspan="5" style="text-align:left;">
				<select name="kind">
					<c:forEach items="${kindList }" var="kind" varStatus="status">
						<c:choose>
							<c:when test="${productVO.kind==status.count }">
								<option value="${status.count }" selected="selected">${kind }</option>
							</c:when>
							<c:otherwise>
								<option value="${status.count }">${kind }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center" style="font-size: 14px;">상품명</th>
			<td colspan="5"  style="text-align:left;">
				<input type="text" name="pname" size="100" maxlength="100" value="${productVO.pname }">
			</td>
		</tr>
		<tr>
			<th style="font-size: 14px; width=15%;">원가[A]</th>
			<td width="18%">
				<input type="text" name="price1" size="28" onKeyUp='NumFormat(this)' value="${productVO.price1 }">
			</td>
			<th style="font-size: 14px; width=15%;">판매가[B]</th>
			<td width="18%">
				<input type="text" name="price2" size="28" onBlur="go_ab()" onKeyUp='NumFormat(this)' value="${productVO.price2 }">
			</td>
			<th style="font-size: 14px; width=15%;">[B-A]</th>
			<td width="18%">
				<input type="text" name="price3" size="28" readonly onKeyUp='NumFormat(this)'>
			</td>
		</tr>
		<tr>
			<th style="font-size: 14px; width=15%;">베스트상품</th>
			<td>
				<c:choose>
					<c:when test='${productVO.bestyn=="y"}'>
						<input type="checkbox" name="bestyn" value="y" checked="checked">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="bestyn" value="n">
					</c:otherwise>
				</c:choose>
			</td>
			<th style="font-size: 14px; width=15%;">사용유무</th>
			<td>
				<c:choose>
					<c:when test='${productVO.puseyn=="y" }'>
						<input type="checkbox" name="puseyn" value="y" checked="checked">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="puseyn" value="n">
					</c:otherwise>
				</c:choose>
			</td>
		<tr>
			<th style="font-size: 14px; width=15%;">상세설명</th>
			<td colspan="5">
				<textarea name="content" rows="20" cols="150">
${productVO.content }
				</textarea>
			</td>
		</tr>
		<tr>
			<th style="font-size: 14px; width=15%;">상품이미지</th>
			<td colspan="5">
				<img src="product_images/${productVO.image }" width="200pt">
				<br>
				<input type="file" name="image">
			</td>
		</tr>
	</table>
	<input class="btn btn-outline-dark btn-sm" type="button" value="수정" onClick="go_mod_save('${tpage}','${productVO.pnum }')">
	<input class="btn btn-outline-dark btn-sm" type="button" value="취소" onClick="go_mov()">
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>