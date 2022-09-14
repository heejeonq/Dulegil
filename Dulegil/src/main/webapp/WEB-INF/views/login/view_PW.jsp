<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="resources/css/idpw.css" />
</head>
<body>
		
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="inpCon">
			<div class="view">
				<span>비밀번호 변경</span>
				<span id="viewMsgPwd">변경 할 비밀번호를 입력해주세요.</span>
				<div class="updInfo">
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