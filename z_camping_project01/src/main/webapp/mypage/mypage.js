function go_cart(){
	if(document.formm.quantity.value == ""){
		alert("수량을 입력해 주세요");
		document.formm.quantity.focus();
	}else{
		document.formm.action = "GetReadyServlet?command=cart_insert";
		document.formm.submit();
	}
}

function go_cart_delete(){
	var count = 0;
	
	if(document.formm.cnum.length == undefined){
		if(document.formm.cnum.checked == true){
			count++;
		}
	}
	for(var i=0; i<document.formm.cnum.length ; i++){
		alert("" + document.formm.cnum[i].checked);
		if(document.formm.cnum[i].checked == true){
			count++;
			alert("" + count);
		}
	}
	if(count == 0){
		alert("삭제할 항목을 선택해 주세요");
	}else{
		document.formm.action = "GetReadyServlet?command=cart_delete";
		document.formm.submit();
	}
}

function go_order_insert(){
	document.formm.action = "GetReadyServlet?command=order_insert";
	document.formm.submit();
}

function go_order_delete(){
	var count = 0;
	if(document.formm.onum.length == undefined){
		if(document.formm.onum.checked == true){
			count++;
		}
	}
	for(var i=0; i< document.formm.onum.length; i++){
		if(document.formm.onum[i].checked == true){
			count++;
		}
	}
	if(count == 0){
		alert("삭제할 항목을 선택해 주세요");
	}else{
		document.formm.action = "GetReadyServlet?command=order_delete";
	}
}

function go_order(){
	document.formm.action = "GetReadyServlet?command=mypage";
	document.formm.submit();
}

