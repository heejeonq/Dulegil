<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/css/idpw.css" />
<script type="text/javascript">
$(document).ready(function(){
});
</script>
</head>

<body>
		
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
	
	<!-- Container -->
	<div class="container-main">
		<div class="inpCon">
			<div class="view">
				<span>아이디 찾기</span>
				<span id="viewMsgId"> 
				고객님의 정보와 일치하는 아이디는 <br/>
				<p id="viewId" name="email">${param.email}</p> &nbsp; 
				입니다. 
				</span>
				<input type="button" id="lgnBtn" value="로그인 하기" />
				<input type="button" id="findPwdBtn" value="비밀번호 찾기" />
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>