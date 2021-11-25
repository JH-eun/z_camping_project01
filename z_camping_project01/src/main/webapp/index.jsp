<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../header.jsp"%>

<!-- main image -->
<div class="clear"></div>
<div id="main_img">
	<img src="images/img_ready.jpeg">
</div>

<div class="clear"></div>

<%-- <div id="front">
	<h2>New Item</h2>
	<div id="bestProduct">
		<c:forEach items="${newProductList }" var="productVO">
			<div id="item">
				<a href="GetReadyServlet?command=product_detail$pnum=${productVO.pnum}">
					<img src="product_images/${productVO.image }" />
					<h3>${productVO.name }</h3>
					<p>${productVO.price2 }</p>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>

	<h2>Best Item</h2>
	<div id="bestProduct">
		<c:forEach items="${bestProductList }" var="productVO">
			<div id="item">
				<a href="GetReadyServlet?command=product_detail&pnum=${productVO.pnum }">
					<img src="product_images/${productVO.image }" />
					<h3>${productVO.name }</h3>
					<p>${productVO.price2 }</p>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
</div> --%>
<!-- footer -->
<%@ include file="../footer.jsp"%>
