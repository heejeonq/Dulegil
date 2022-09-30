<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 계정 관리</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;"> badge </span>
			관리자 계정 관리
		</div>
		<div class="Ccon">
			<div class="login_box">
				<div class="id_box">
					<span class="material-symbols-outlined" style="font-size: 20px; color: #C0C0C0; vertical-align: middle;"> info </span>  
					<input type="text" class="input" value="${sMemNm}"/>
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