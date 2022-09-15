<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/idpw.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#cnfmBtn").on("click", function(){
		$("#email").val($("#findId").val() + "@" 
				+ $("#emailSel option:selected").val());
		
		if($.trim($("#findNm").val()) == ""){
			makeAlert("알림", "이름를 입력하세요.", function(){
				$("#findNm").focus();	
			});
		}else if($.trim($("#findId").val()) == ""){
			makeAlert("알림", "아이디를 입력하세요.", function(){
				$("#findId").focus();
			});
		}else{
			var params = $("#actionForm").serialize();
			$.ajax({
				url:"findPwdAjax", 
				type:"POST", 
				dataType:"json", 
				data : params,
				success: function(res) { 
					if(res.msg == "success"){
						$("#no").val(res.data.MEMBER_NO);
						$("#actionForm").attr("action", "viewPwd");
						$("#actionForm").submit();
					}else{
						makeAlert("알림", "등록된 정보가 없습니다.");
					}
				}, 
				error: function(request, status, error) { 
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
			<div class="find">
				<span>비밀번호 찾기</span>
				<span id="findMsg">비밀번호는 가입시 입력하신 이름과 아이디를 통해 찾을 수 있습니다.</span>
				<div class="findInfo">
					<form action="#" id="actionForm" method="post">
						<input type="hidden" id="no" name="no" />
						<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
						<input type="text" id="findId" name="findId" placeholder="아이디" />
						<input type="hidden" name="email" id="email">
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
					</form>
					<input type="button" id="cnfmBtn" value="확인">
				</div>
				<div class="btn">
					<p>아이디가 기억나지 않으시나요?</p>
					<a href="findId">아이디 찾기</a>
				</div>
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>