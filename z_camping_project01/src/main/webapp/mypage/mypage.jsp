<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_menu.jsp" %>
	<article>
		<h2> My Page<span style="font-size:20px;">(${title })</span></h2>
		<form name="formm" method = "post">
			<table id="cartList">
			<tr>
				<th>주문일자</th><th>주문번호</th><th>상품명</th><th>결제 금액</th><th>주문 상세</th>
			</tr>
			<c:forEach items="${orderList }" var="orderVO">
			<tr>
				<td><fmt:formatDate value="${orderVO.indate }" type="date" /></td>
				<td>${orderVO.onum }</td>
				<td>${orderVO.pname }</td>
				<td><fmt:formatNumber value="${orderVO.price2 }" type="number" />원</td>
				<td><a href="GetReadyServlet?command=order_detail&onum=${orderVO.onum }">조회</a></td>
			</tr>
			</c:forEach>
			</table>
			
			<div class="clear"></div>
			<div id="buttons" style="float: right;">
				<input type="button" value="쇼핑계속하기" class="btn btn-outline-success btn-sm" style="width:120px;" onclick="location.href='GetReadyServlet?command=index'">
			</div>
		</form>
	</article>
<%@ include file="../footer.jsp" %>