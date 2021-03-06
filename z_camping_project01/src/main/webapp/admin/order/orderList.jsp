<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>    
<script type="text/javascript">
	function go_order_save(){
		var count = 0;
		if(document.frm.result.length == undefined){
			if(document.frm.result.checked == true){
				count++;
			}
		}else{
			for(var i=0; i<document.frm.result.length; i++){
				if(document.frm.result[i].checked == true){
					count++;
				}
			}
		}
		if(count == 0){
			alert("주문처리할 항목을 선택해 주세요.");
		}else{
			document.frm.action = "GetReadyServlet?command=admin_order_save";
			document.frm.submit();
		}
	}
</script>   
<article>
	<h1>주문리스트</h1>
	<form name="frm" method="post">
		<table style="float:right;" >
			<tr>
				<td>주문자 이름<input type="text" name="key">
				<input class="btn btn-outline-dark btn-sm" type="button" value="검색" onClick="go_search()">
				</td>
			</tr>
		</table>
		<br>
		<table class="table table-bordered">
			<tr>
				<th style="font-size: 14px;">주문처리(처리여부)</th><th style="font-size: 14px;">주문자</th><th style="font-size: 14px;">상품명</th><th>수량</th>
				<th style="font-size: 14px;">우편번호</th><th style="font-size: 14px;">배송지</th><th style="font-size: 14px;">전화</th><th style="font-size: 14px;">주문일</th>
			</tr>
			<c:forEach items="${orderList }" var="orderVO">
			<tr>
				<td>
					<c:choose>
						<c:when test='${orderVO.result=="1" }'>
							<span style="font-weight:bold; color: blue">${orderVO.odnum }</span>
							(<input type="checkbox" name="result" value="${orderVO.odnum }"> 미처리)
						</c:when>
						<c:otherwise>
							<span style="font-weight:bold; color: red">${orderVO.odnum }</span>
							(<input type="checkbox" checked="checked" disabled="disabled">처리완료)
						</c:otherwise> 
					</c:choose>
				</td>
				<td>${orderVO.mname }</td><td>${orderVO.pname }</td>
				<td>${orderVO.quantity }</td><td>${orderVO.postal_code }</td>
				<td>${orderVO.address }</td><td>${orderVO.phone }</td>
				<td><fmt:formatDate value="${orderVO.indate }"/></td>
			</tr>
			</c:forEach>
		</table>
		<input type="button" class="btn btn-outline-dark btn-sm" style="width: 200px"
			value="주문처리(입금확인)" onClick="go_order_save()">
	</form>
</article>
<%@ include file="/admin/footer.jsp" %> 
</body>
</html>