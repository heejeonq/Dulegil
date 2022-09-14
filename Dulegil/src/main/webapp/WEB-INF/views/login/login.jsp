<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/idpw.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#actionForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13){
			$("#loginBtn").click();
			return false;
		}
	});
	
	$("#loginBtn").on("click", function(){
		if($.trim($("#lgnId").val()) == "") {
			makeAlert("알림", "아이디를 입력하세요", function(){;
			$("#lgnId").focus();	
			});
		}
		else if($.trim($("#lgnPwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요", function(){
			$("#lgnPwd").focus();
			});
		}
		else {
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "memberLoginAjax", 
				type : "POST",
				dataType : "json", 
				data : params, 
				success : function(res) {
					if(res.msg == "success"){
						location.href = "main";
					}
					else{
						makeAlert("알림", "아이디나 비밀번호가 틀립니다.");
					}
				},
				error : function(request, status, error) {
					console.log(request.responseText); 
				}
			});
		}
	});
});
</script>
</head>
<body>
	
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="inpCon">
		<form action="#" id="actionForm">
			<div class="lgn">
				<span>회원 로그인</span>
				<div class="lgnInfo">
					<input type="text" id="lgnId" name="lgnId" placeholder="아이디" /><br />
					<input type="password" id="lgnPwd" name="lgnPwd" placeholder="비밀번호" />
				</div>
				<input type="button" id="loginBtn" value="로그인">
			</div>
		</form>
			<ul class="btn">
				<li>
					<a href="./join">회원가입</a>
				</li>
				<li>
					<a href="findIdBtn">아이디 찾기</a>
				</li>
				<li>
					<a href="findPwdBtn">비밀번호 찾기</a>
				</li>
			</ul>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>