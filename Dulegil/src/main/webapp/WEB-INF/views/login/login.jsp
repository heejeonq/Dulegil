<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>서울 둘레길:로그인</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/idpw.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#actionForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13){
			//직접 함수 호출
			//login();
			//버튼 이벤트 발생
			$("#cnfmBtn").click();
			return false;
		}
	});
	
	$("#cnfmBtn").on("click", function(){
		
		if($.trim($("#id").val()) == "") {
			makeAlert("알림", "아이디를 입력하세요", function(){;
				$("#id").focus();	
			});
		}
		else if($.trim($("#pwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요", function(){
				
			$("#pwd").focus();
			});
		}
		else {
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "memberLoginAjax", //경로
				type : "POST", //전송방식
				dataType : "json", //데이터 형태
				data : params, //보낼 데이터
				success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
					if(res.msg == "success"){
						location.href = "main";
					}
					else{
						makeAlert("알림", "아이디나 비밀번호가 틀립니다.");
					}
				},
				error : function(request, status, error) {
					console.log(request.responseText); //실패 상세 내역
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
		<div class="contents">
		<form action="#" id=actionForm>
			<div class="lgn">
				<span>회원 로그인</span>
				<div class="lgnInfo">
					<input type="text" id="id" name="id" placeholder="아이디" /><br />
					<input type="password" id="pwd" name="pwd" placeholder="비밀번호" />
				</div>
				<input type="button" id="loginBtn" value="로그인">
			</div>
		</form>
			<ul class="btn">
				<li>
					<a href="joinBtn">회원가입</a>
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