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
<title>서울 둘레길:비밀번호 변경</title>
</head>
<body>
		
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>


	<!-- Container -->
	<div class="container-main">
		<div class="contents">
			<div class="viewWrap">
				<span>비밀번호 변경</span>
				<span id="pwFmsg">변경 할 비밀번호를 입력해주세요.</span>
				<div class="updateBox">
					<input type="text" id="updatePW" name="updatePW" placeholder="비밀번호" /><br />
					<input type="text" id="updateRPW" name="updateRPW" placeholder="비밀번호 확인" /><br />
				</div>
				<input type="button" id="confirmBtn" value="확인">
			</div>	
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>