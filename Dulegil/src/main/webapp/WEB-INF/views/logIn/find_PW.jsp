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
<title>서울 둘레길:비밀번호 찾기</title>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
	

	<!-- Container -->
	<div class="container-main">
		<div class="contents">
			<div class="findWrap">
				<span>비밀번호 찾기</span>
				<span id="pwmsg">비밀번호는 가입시 입력하신 이름과 아이디를 통해 찾을 수 있습니다.</span>
				<div class="findBox">
					<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
					<input type="text" id="findEM" name="findEM" placeholder="아이디" />
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
					<input type="button" id="confirmBtn" value="확인">
				</div>
				<div class="btnWrap">
					<p>아이디가 기억나지 않으시나요?</p>
					<a href="../findIDPW/findID.html">아이디 찾기</a>
				</div>
			</div>	
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>