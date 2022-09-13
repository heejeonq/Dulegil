<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/idpw.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>서울 둘레길:아이디 찾기</title>
</head>
<body>
	
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="contents">
			<div class="findWrap">
				<span>아이디 찾기</span>
				<span id="idmsg">아이디는 가입시 입력하신 이름과 휴대전화번호을 통해 찾을 수 있습니다.</span>
				<div class="findBox">
					<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
					<input type="text" id="findPn" name="findPn" placeholder="휴대전화번호" />

					<input type="button" id="confirmBtn" value="확인">
				</div>
			</div>	
			<div class="btnWrap">
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