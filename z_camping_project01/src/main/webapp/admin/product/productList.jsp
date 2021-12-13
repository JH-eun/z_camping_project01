<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>

<article>
<h1>상품리스트</h1>	
<form name="frm" method="post">
<table style="float:right;">
  <tr>
  <td>
      상품명 
     <input type="text" name="key">
     <input class="btn btn-outline-dark btn-sm" type="button" name="btn_search" value="검색" onClick="go_search()">
     <input class="btn btn-outline-dark btn-sm" type="button" name="btn_total" value="전체보기 " onClick="go_total()">
     <input class="btn btn-outline-dark btn-sm" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
  </td>
  </tr>
</table>
<table class="table table-bordered">
    <tr>
        <th style="font-size: 14px;">번호</th><th style="font-size: 14px;">상품명</th><th style="font-size: 14px;">원가</th><th style="font-size: 14px;">판매가</th><th style="font-size: 14px;">등록일</th><th style="font-size: 14px;">사용유무</th>
    </tr>
    <c:choose>
    <c:when test="${productListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        등록된 상품이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${productList}" var="productVO">
    <tr>
      <td height="23" align="center" width=10%>${productVO.pnum}</td>
      <td align="center" width=35%>  
        <a href="#" onClick="go_detail('${tpage}', '${productVO.pnum}')">
    	 ${productVO.pname}     
   		</a>
   	  </td>
      <td width=15%><fmt:formatNumber value="${productVO.price1}"/></td>
      <td width=15%><fmt:formatNumber value="${productVO.price2}"/></td>
      <td width=15%><fmt:formatDate value="${productVO.indate}"/></td>
      <td width=10%>
      	<c:choose>
   	 		<c:when test='${productVO.puseyn=="1"}'>미사용</c:when>
   	 		<c:otherwise>사용</c:otherwise>   	 		
   	 	</c:choose>	 
   	  </td> 
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form> 
</article>
<%@ include file="/admin/footer.jsp"%>
</body>
</html>