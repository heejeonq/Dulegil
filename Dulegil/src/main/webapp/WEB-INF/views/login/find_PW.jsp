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
<!-- 이메일 select -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function emailSelect(ele){
    var $ele = $(ele);
    var $emailId = $('input[name=emailId]');

    if($ele.val() == "1"){
        $emailId.attr('readonly', false);
        $emailId.val('');
    } else {
        $emailId.attr('readonly', true);
        $emailId.val($ele.val());
    }
}

$(document).ready(function(){
	$("#cnfmBtn").on("click", function(){
		$("#email").val($("#findId").val() + "@" + $("#emailId").val());
		
		if($.trim($("#findNm").val()) == ""){
			makeAlert("알림", "이름를 입력하세요.", function(){
				$("#findNm").focus();	
			});
		}else if($.trim($("#findId").val()) == ""){
			makeAlert("알림", "아이디를 입력하세요.", function(){
				$("#findId").focus();
			});
		}else if($.trim($("#emailId").val()) == ""){
			makeAlert("알림", "이메일 주소를 입력하세요.", function(){
				$("#emailId").focus();
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
						<input type="hidden" name="email" id="email">
						<input type="text" id="findNm" name="findNm" placeholder="이름" /><br />
						<input type="text" id="findId" name="findId" placeholder="아이디" />
						<p id="at">@</p> 
						<input type="text" id="emailId" name="emailId" placeholder="직접입력" />
						<select id="emailSel" name="emailSel" onChange="emailSelect(this)">
							<option value="1">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="icloud.com">icloud.com</option>
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