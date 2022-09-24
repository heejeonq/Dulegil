<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<div class="login_banner">
				<p>관리자 정보</p>
			</div>
			<div class="icon">
				<span class="material-symbols-outlined"
					style="font-size: 200px; color: #C0C0C0;"> badge </span>
			</div>
			<div class="login_box">
				<div class="id_box">
					<span class="material-symbols-outlined"
						style="font-size: 20px; color: #C0C0C0; vertical-align: middle;">
						info </span>  <input type="text" class="input" placeholder="아이디"
						maxlength="20" value="${sMemNm}"/>
				</div>
				<div class="pw_box">
					<span class="material-symbols-outlined"
						style="font-size: 20px; color: #C0C0C0; vertical-align: middle;">
						lock </span> <input type="text" class="input" placeholder="비밀번호"
						maxlength="20" value="${sMemPw}" />
				</div>
			</div> 
		</div> 
	</div>  
</body>
</html>