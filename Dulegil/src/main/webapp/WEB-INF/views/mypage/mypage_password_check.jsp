<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>비밀 번호 확인</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#actionForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13){
			//직접 함수 호출
			//login();
			//버튼 이벤트 발생
			$("#confirmBtn").click();
			return false;
		}
	});
	
	$("#confirmBtn").on("click", function(){
		if($.trim($("#pwd").val()) == "") {
			makeAlert("알림", "비밀번호를 입력하세요", function(){;
				$("#pwd").focus();	
			});
		}
		
		else {
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "mypageAjax/passwordCheck", //경로
				type : "POST", //전송방식
				dataType : "json", //데이터 형태
				data : params, //보낼 데이터
				success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
					if(res.msg == "success"){
						location.href = "mypageMyinfoUpdate";
					}
					else{
						makeAlert("알림", "비밀번호가 틀립니다.");
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
	<div class="container-mypage">
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		         
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>비밀번호 확인</span>		         
				</div>
				<form action="#" id="actionForm">
				<div class = "mem_box">
					<div id="intropwd">
						<input type="hidden" name="memNo" value="${sMemNo}">
						<span id="id">${sMemNm}</span>
						<span id="checkment">님의 개인정보를 보호하기 위해</span><br>
						<span>비밀번호를 한번 더 확인합니다.</span>
						<br>
						<input type="password" class="pwd" id="pwd" name="pwd">
						<input type="button" class="btn green" id="confirmBtn" value="확인">
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>	
			
<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>