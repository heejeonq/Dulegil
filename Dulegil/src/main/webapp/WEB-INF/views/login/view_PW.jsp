<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="resources/css/idpw.css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#cnfmBtn").on("click",function(){
		if($.trim($("#updPwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요.", function(){
				$("#updPwd").focus();	
			});
		}else if($("#updRPwd").val() != $("#updPwd").val()){
			makeAlert("알림", "비밀번호가 일치하지 않습니다.", function(){
				$("#updRPwd").focus();
			});
		}else{
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url:"updPwdAjax", 
				type:"POST", 
				dataType:"json", 
				data : params,
				success: function(res) { 
					switch (res.msg) {
					case "success":
						makeAlert("알림", "비밀번호가 변경되었습니다.");
						location.href = "login"; 
						break;
					case "fail":
						makeAlert("알림", "수정에 실패하였습니다.");
						break;
					case "error": 
						makeAlert("알림", "수정 중 문제가 발행하였습니다.");
						break;
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
			<div class="view">
				<span>비밀번호 변경</span>
				<span id="viewMsgPwd">변경할 비밀번호를 입력해주세요.</span>
				<div class="updInfo">
					<form action="#" id="actionForm" method="post">
						<input type="hidden" name="no" value="${param.MEMBER_NO}" />
						<input type="password" id="updPwd" name="updPwd" placeholder="비밀번호" /><br />
						<input type="password" id="updRPwd" name="updRPwd" placeholder="비밀번호 확인" /><br />
					</form>
				</div>
				<input type="button" id="cnfmBtn" value="확인">
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>