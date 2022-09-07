<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 둘레길:회원 가입</title>
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="../../css/join.css" />
<link rel="stylesheet" href="../../css/fonts.css" />
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">							
		<div class="mainWrap">
			<h1>회원가입</h1>
			<div class="col"></div>
			
			<p>필수 입력 사항</p>
			
			<table class="baseInfo">
				<colgroup>
				<col style="width:150px;">
				<col style="width:auto;">
				</colgroup>
				
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="uid" id="uid" placeholder="(영문소문자/숫자, 4~16자)" />
						<select id="emailSel">
							<option>직접입력</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
							<option>daum.net</option>
							<option>nate.com</option>
							<option>hotmail.com</option>
							<option>gmail.com</option>
							<option>icloud.com</option>
						</select>
						<input type="button" name="reBtn" id="reBtn" id="reBtn" value="중복확인" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="upw" id="upw" placeholder="(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="upwRe" id="upwRe" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="unm" id="unm" />
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" name="uph" id="uph" placeholder="- 없이 입력하세요" />
					</td>
				</tr>
			</table>
			
			<p>추가 입력 사항</p>
			<table class="addInfo">	
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="ubirth" id="ubirth">
					</td>	
					<th>성별</th>
					<td class="genBox">
						<input type="radio" name="gender" id="gender" value="m" checked="checked" />
      					<label for="m">남자</label>
						<input type="radio" name="gender" id="gender" value="f" />
						<label for="f">여자</label>
					</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td colspan="3">	
						<input type="text" name="zipcode" id="zipcode" value="우편 번호" />
						<input type="button" name="addressBtn" id="addressBtn" value="주소 검색" />	
						<input type="text" name="address" id="address" value="주소" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" name="addressDetail" id="addressDetail" value="상세 주소" />
					</td>
				</tr>
			</table>

			<div class="col"></div>
			
			<div class="btnBox">
				<input type="button" id="joinBtn" value="가입하기">
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>