<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>
	<article>
		<h2> Cart List</h2>
		<form name="formm" method="post">
			<c:choose>
				<c:when test="${cartList.size() == 0 }"><br>
					<h5 style="color:red;text-align: center; font-family:verdana;"> 장바구니가 비었습니다.</h5>
				</c:when>
				<c:otherwise>
					<table id="cartList">
						<tr>
							<th>상품명</th><th>수량</th><th>가격</th><th>주문일</th><th>삭제</th>
						</tr>
						<c:forEach items="${cartList }" var="cartVO">
							<tr>
								<td>
									<a href="GetReadyServlet?command=product_detail&pnum=${cartVO.pnum }">${cartVO.pname }</a></td>
								<td>${cartVO.quantity }</td>
								<td><fmt:formatNumber value="${cartVO.price2 * cartVO.quantity }" type="number" />원</td>
								<td><fmt:formatDate value="${cartVO.indate }" type="date" /></td>
								<td><input type="checkbox" name="cnum" value="${cartVO.cnum }"></td>
							</tr>
						</c:forEach>
						
						<tr style="border-top: 1px solid black">
							<td colspan="2"> Total price </td>
							<td colspan="2"><fmt:formatNumber value="${totalPrice }" type="number" />원<br></td>
							<td><a href="#" onclick="go_cart_delete()">삭제하기</a></td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
		
			<div class="clear"></div>
			<div id="button" style="float: right">
				<input type="button" value="쇼핑 계속하기" class="btn btn-outline-success btn-sm" style="width:120px;" onclick="location.href='GetReadyServlet?command=index'">
				<c:if test="${cartList.size() !=0 }">
				<input type="button" value="주문하기" class="btn btn-outline-success btn-sm" style="width:100px;" onclick="go_order_insert()">
				</c:if>
			</div>
		</form>
	</article>
	<%@ include file="../footer.jsp" %>