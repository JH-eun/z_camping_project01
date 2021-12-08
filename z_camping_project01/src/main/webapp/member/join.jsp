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
		<h5>기본정보</h5>
		<table class="table table-bordered" style="text-align: left; width:940px;">
			<tr>
				<td style="padding-left: 20px; padding-top: 20px;">아이디</td>
				<td ><input type="text" name="id" size="50" >
				<input type="hidden" name="reid">
				<input class="btn btn-success" style="width:70px; height: 30px; font-size: 12px;" type="button" value="중복 체크" onclick="idcheck()"></td>
			</tr>
			<tr>
				<td style="padding-top: 20px; padding-left: 20px;">비밀번호</td>
				<td><input type="password" name="pwd" size="50" ></td>
			</tr>
			<tr>
				<td style="padding-left: 20px; padding-top: 20px;">비밀번호확인</td>
				<td><input type="password" name="pwdCheck" size="50" ></td>
			</tr>
			<tr>
				<td style="padding-left: 20px; padding-top: 20px;">이름</td>
				<td><input type="text" name="name" size="50" ></td>
			</tr>
			<tr>
				<td style="padding-left: 20px; padding-top: 20px;">E-mail</td>
				<td style="vertical-align: center;"><input type="text" name="email" size="30">@
					<select name="emails" id="emails">
						<option value="naver">naver.com</option>
						<option value="gmail">gmail.com</option>
						<option value="nate">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;" rowspan="3">주소</td>
				<td><input type="text" name="addressName" id="userZipcode" readonly>
                    <input class="btn btn-success" style="width:70px; height: 30px; font-size: 12px;"  type="button" value="주소 검색" onclick="findAddr()">
                </td>
            </tr>
            <tr>
            	<td><input type="text" name="addressName1" id="userAddress" size="70"readonly></td>
            </tr>
            <tr>
            	<td><input type="text" name="addressName2" size="70" placeholder="상세 주소를 입력하세요"></td>
            </tr>
            <tr>
            	<td style="padding-left: 20px; padding-top: 20px;">전화번호</td>
            	<td><input type="text" name="phone" size="50" ></td>
            </tr>
		</table>
		<br>
		<h5>전체 동의</h5>
		<table class="table table-bordered" style="text-align: left; width:940px;">
			<tr>
				<td style="padding-left: 20px; padding-top: 20px;"><input type="checkbox" name="allcheck" onClick="allcheck_onclick()">  
				이용약관 및 개인정보 수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;">
					[필수] 이용약관 동의<br><br>
					<textarea rows="15" cols="100">
					제 1조 (목적)
					이 이용약관(이하 '약관')은 주식회사 GetReady(이하 회사) 와 이용 고객(이하 '회원')간에 회사가 제공하는 서비스 의 가입조건 및 
					이용에 관한 다음의 제반 사항과 기타 기본적인 사 항을 구체적으로 규정함을 목적으로 합니다.
					
					</textarea><br>
					이용약관에 동의하십니까? <input type="checkbox" name="agree1"> 동의함
				
				</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;">
					[필수] 개인정보 수집 및 이용 동의<br><br>
					<textarea rows="15" cols="100">
					제 1조 (목적)
					이 이용약관(이하 '약관')은 주식회사 GetReady(이하 회사) 와 이용 고객(이하 '회원')간에 회사가 제공하는 서비스 의 가입조건 및 
					이용에 관한 다음의 제반 사항과 기타 기본적인 사 항을 구체적으로 규정함을 목적으로 합니다.
					
					</textarea><br>
					개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" name="agree2"> 동의함
				</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;">
					[선택] 개인정보 제3자 제공 동의<br><br>	
					<textarea rows="15" cols="100">
					제 1조 (목적)
					이 이용약관(이하 '약관')은 주식회사 GetReady(이하 회사) 와 이용 고객(이하 '회원')간에 회사가 제공하는 서비스 의 가입조건 및 
					이용에 관한 다음의 제반 사항과 기타 기본적인 사 항을 구체적으로 규정함을 목적으로 합니다.
					
					</textarea><br>
					개인정보 제3자 제공에 동의하십니까? <input type="checkbox" name="agree3"> 동의함
				</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;">
					[선택] 쇼핑정보 수신 동의<br><br>
					<textarea rows="15" cols="100">
					제 1조 (목적)
					이 이용약관(이하 '약관')은 주식회사 GetReady(이하 회사) 와 이용 고객(이하 '회원')간에 회사가 제공하는 서비스 의 가입조건 및 
					이용에 관한 다음의 제반 사항과 기타 기본적인 사 항을 구체적으로 규정함을 목적으로 합니다.
					
					</textarea><br>
					이메일 수신을 동의하십니까? <input type="checkbox" name="agree4"> 동의함
				</td>
			</tr>
					
			
		</table>
		
		<!-- <fieldset>
			<legend>Basic Info</legend>
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
		</fieldset> -->
		
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
		<div id="button" style="text-align: center;">
			<input type="button" value="회원가입" class="submit" onclick="go_save()">
			<input type="reset" value="취소" class="cancel">
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>