<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/idpw.css" />
</head>
<body>
	
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="inpCon">
			<div class="find">
				<span>아이디 찾기</span>
				<span id="findMsg">아이디는 가입시 입력하신 이름과 휴대전화번호을 통해 찾을 수 있습니다.</span>
				<div class="findInfo">
					<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
					<input type="text" id="findPhn" name="findPhn" placeholder="휴대전화번호" />

					<input type="button" id="confirmBtn" value="확인">
				</div>
			</div>	
			<div class="btn">
				<p>회원정보가 기억나시나요?</p>
				<a href="findPW">비밀번호 찾기</a>
				<a href="login">로그인</a>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>