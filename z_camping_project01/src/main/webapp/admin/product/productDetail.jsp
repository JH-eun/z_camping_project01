<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<article>
<h1>상품 상세 보기</h1>
<form name="frm" method="post">
<!-- <table id="list"> -->
<table class="table table-bordered" style="margin-left:150px; width: 80%;">
	<tr>
		<th width=15% style="font-size: 14px;">상품분류</th>
		<td colspan="5" style="text-align:left;">
			${kind }
		</td>
	</tr>
	<tr>
		<th align="center" style="font-size: 14px;">상품명</th>
		<td colspan="5" style="text-align:left;">${productVO.pname }</td>
	</tr>
	<tr>
		<th style="font-size: 14px; width=15%;">원가 [A]</th><td width="18%">${productVO.price1 }</td>
		<th style="font-size: 14px; width=15%;">판매가 [B]</th><td width="18%">${productVO.price2 }</td>
		<th style="font-size: 14px; width=15%;">[B-A]</th><td width=19%>${productVO.price3 }</td>
	</tr>
	
	<tr>
		<th style="font-size: 14px;">상세설명</th><td colspan="5" style="text-align:left;">${productVO.content }</td>
	</tr>
	<tr>
		<th style="font-size: 14px;">상품이미지</th>
		<td colspan="5" align="center">
			<img src="product_images/${productVO.image }" width="200pt">
		</td>
	</tr>
</table>
<input class="btn btn-outline-dark btn-sm" type="button" value="수정" onClick="go_mod('${tpage}','${productVO.pnum }')">
<input class="btn btn-outline-dark btn-sm" type="button" value="목록" onClick="go_list('${tpage}')">
</form>
</article>
<%@ include file="/admin/footer.jsp" %>
</body>
</html>