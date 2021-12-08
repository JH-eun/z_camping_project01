<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- <%@ include file="sub_img.html" %> --%>
<%-- <%@ include file="sub_menu.html" %> --%>
<div class="container mt-3">
	<br><br><br>
	<h2>회원가입</h2>
	<hr>
	<br>
	<form id="join" action="GetReadyServlet?command=join" method="post" name="formm">
		<h4>기본정보</h4>
		<table class="table table-bordered" style="text-align: left;">
			<tr>
				<td >아이디</td>
				<td ><input type="text" name="id" >
				<input type="hidden" name="reid">
				<input type="button" value="중복 체크" class="dup" onclick="idcheck()"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="pwdCheck"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email">@
					<select name="emails" id="emails">
						<option value="naver">naver.com</option>
						<option value="gmail">gmail.com</option>
						<option value="nate">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td rowspan="3">주소</td>
				<td><input type="text" name="addressName" readonly>
                    <input type="button" value="주소 검색" onclick="findAddr()">
                </td>
            </tr>
            <tr>
            	<td><input type="text" name="addressName1" size="50"readonly></td>
            </tr>
            <tr>
            	<td><input type="text" name="addressName2" size="50" placeholder="상세 주소를 입력하세요"></td>
		</table>
		
		<fieldset>
			<!-- <legend>Basic Info</legend> -->
			<label>ID</label>
			<input type="text" name="id">
			<input type="hidden" name="reid">
			<input type="button" value="중복 체크" class="dup" onclick="idcheck()"><br>
			<label>비밀번호</label>
			<input type="password" name="pwd"><br>
			<label>비밀번호확인</label>
			<input type="password" name="pwdCheck"><br>
			<label>이름</label>
			<input type="text" name="name"><br>
			<label>주소</label>
			<input type="text" name="addressName" id="userZipcode" readonly class='box' />
                        <input type="button" value="주소 검색" onclick="findAddr()"><br>
         	<label></label>
         	<input type="text" name="addressName1" id="userAddress" size="50" readonly class='box' /> <br>
         	<label></label>
         	<input type="text" name="addressName2" class="form-control" placeholder="상세 주소를 입력하세요" size="50"/> <br>
			<label>E-Mail</label>
			<input type="text" name="email">@
					<select name="emails" id="emails">
						<option value="naver">naver.com</option>
						<option value="gmail">gmail.com</option>
						<option value="nate">nate.com</option>
					</select><br>
		</fieldset>
		
		<!-- <div class="form-group row">
				<label class="col-sm-2"> 주소 </label>
				<div class="col-sm-5">
					<input type="text" name="addressName" id="userZipcode" placeholder="우편번호 입력" readonly class='box' />
                        <input type="button" value="주소 검색" onclick="findAddr()"><br>
					<input type="text" name="addressName1" id="userAddress" placeholder="주소를 입력" readonly class='box' /> <br>
					<input type="text" name="addressName2" class="form-control" placeholder="상세 주소를 입력하세요"/> <br>
				</div>
			</div> -->
		<!-- <fieldset>
			<legend>Optional</legend>
			<label>Postal Code</label>
			<input type="text" name="postal_code" size="10">
			<input type="button" value="주소 찾기" class="dup" onclick="postal_code()"><br>
			<label>Address</label>
			<input type="text" name="add1" size="50">
			<input type="text" name="add2" size="25"><br>
			<label>Phone Number</label>
			<input type="text" name="phone"><br>
		</fieldset> -->
		<div class="clear"></div>
		<div id="button">
			<input type="button" value="회원가입" class="submit" onclick="go_save()">
			<input type="reset" value="취소" class="cancel">
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>