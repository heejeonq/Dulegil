<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/idpw.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>서울 둘레길:로그인</title>
</head>
<body>
	
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="contents">
			<div class="loginWrap">
				<span>회원 로그인</span>
				<div class="loginBox">
					<input type="text" id="loginId" name="loginId" placeholder="아이디" /><br />
					<input type="password" id="loginPwd" name="loginPwd" placeholder="비밀번호" />
				</div>
				<input type="button" id="confirmBtn" value="로그인">
			</div>
			<ul class="btnWrap">
				<li>
					<a href="../join/joinMem.html">회원가입</a>
				</li>
				<li>
					<a href="../findIDPW/findID.html">아이디 찾기</a>
				</li>
				<li>
					<a href="../findIDPW/findPW.html">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>