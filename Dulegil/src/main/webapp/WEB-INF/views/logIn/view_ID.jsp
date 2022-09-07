<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="../../css/main.css" />
<link rel="stylesheet" href="../../css/idpw.css" />
<link rel="stylesheet" href="../../css/fonts.css" />
<title>서울 둘레길:아이디 찾기</title>
</head>
<body>
		
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
	
	<!-- Container -->
	<div class="container-main">
		<div class="contents">
			<div class="viewWrap">
				<span>아이디 찾기</span>
				<span id="idFmsg">
				고객님의 정보와 일치하는 아이디는 <br/>
				<p id="userid">'123dm@naver.com'</p> 
				입니다
				</span>
				<div class="viewBtnWrap">
					<input type="button" id="loginBtn" value="로그인 하기" />
					<input type="button" id="findPWBtn" value="비밀번호 찾기" />
				</div>
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>