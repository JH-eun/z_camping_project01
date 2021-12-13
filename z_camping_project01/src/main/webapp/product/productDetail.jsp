<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>
	<div id="itemdetail">
		<form method="post" name="formm">
			<table>
				<tr>
					<td></td>
					<td colspan="2" style="font-size:18px; font-weight: bold;">${productVO.pname }</td>
				</tr>
				<tr>
					<td rowspan="6" style="text-align: center; width: 40%;"><img src="product_images/${productVO.image }"/></td>
				</tr>
				
				<tr>
					<td style="width:10%;">가격</td>
					<td style="width:40%%;"><fmt:formatNumber value="${productVO.price2 }" type="number"/> 원</td>
				</tr>
				<tr>	
					<td>수량</td>
					<td>
						<input type="text" name="quantity" size="2" value="1">
						<input type="hidden" name="pnum" value="${productVO.pnum }">
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td>5만원 이상 구매시 무료</td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td>${productVO.content }</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top:13px;">
						<input type="button" value="장바구니에 담기" class="btn btn-outline-success btn-sm" style="width:120px;"  onclick="go_cart()">
						<input type="reset" value="취소" class="btn btn-outline-success btn-sm" style="width:120px;" >
					</td>
				</tr>
			</table>
			<br><br><br><br>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>