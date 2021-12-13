<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<div>
		<div class="box">
			&nbsp;&nbsp;&nbsp;
			<c:if test="${param.kind eq '1'}">텐트</c:if>
			<c:if test="${param.kind eq '2'}">타프</c:if>
			<c:if test="${param.kind eq '3'}">매트/침낭</c:if>
			<c:if test="${param.kind eq '4'}">코펠/버너/취사</c:if>
			<c:if test="${param.kind eq '5'}">의자/테이블</c:if>
			<c:if test="${param.kind eq '6'}">화로대/BBQ</c:if>
			<c:if test="${param.kind eq '7'}">기타장비</c:if>
			<br><br>
		</div>
		<c:forEach items="${productKindList }" var="productVO">
			<div id="item" style="margin-left: 20px;">
				<a href="GetReadyServlet?command=product_detail&pnum=${productVO.pnum }">
					<img src="product_images/${productVO.image }"/>
					${productVO.pname }
					<p><fmt:formatNumber value="${productVO.price2 }" type="number"/> 원</p>
				</a>
			</div>
		</c:forEach>
		<div class="clear"></div>
	</div>
<%@ include file="../footer.jsp" %>
