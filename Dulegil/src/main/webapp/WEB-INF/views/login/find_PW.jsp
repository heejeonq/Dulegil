<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/idpw.css" />
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="inpCon">
			<div class="find">
				<span>비밀번호 찾기</span>
				<span id="findMsg">비밀번호는 가입시 입력하신 이름과 아이디를 통해 찾을 수 있습니다.</span>
				<div class="findInfo">
					<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
					<input type="text" id="findId" name="findId" placeholder="아이디" />
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
					<input type="button" id="cnfmBtn" value="확인">
				</div>
				<div class="btn">
					<p>아이디가 기억나지 않으시나요?</p>
					<a href="findId">아이디 찾기</a>
				</div>
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>