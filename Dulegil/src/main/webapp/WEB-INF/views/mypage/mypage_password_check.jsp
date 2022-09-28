<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    //actionForm이 실행될 때 
    //keypress는 '입력할 수 있는 키보드'를 눌렀을 때에만 반응하기 때문에 
    //input 부분에 엔터키를 누르면 확인 버튼이 클릭 되는 기능.  
	$("#actionForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13){
			//직접 함수 호출
			//login();
			//버튼 이벤트 발생
			$("#confirmBtn").click();
			//밑에 설명 참조.(값이 들어가 있지 않으면 submit을 하지 않고, false로 return한다는 뜻)
			return false;
		}
	});
	
	//확인 버튼을 클릭하면
	$("#confirmBtn").on("click", function(){
		//trim이 써 있기 때문에 스페이스바도 공백으로 처리, 패스워드의 입력 값이 없거나 스페이스바가 찍히면
		if($.trim($("#pwd").val()) == "") {
			makeAlert("알림", "비밀번호를 입력해주세요.", function(){;
				$("#pwd").focus();	
			});
		}
		
		else {
			
			//serialize: id=actionForm 아래에 있는 것들을 HashMap으로 바꿔줌.(name을 key로)
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
						makeAlert("알림", "비밀번호가 틀렸습니다.",function(){
						$("#pwd").val("");	
						$("#pwd").focus();
						});
						
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
	<c:import url="/header"></c:import>

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
					    <!-- header에 있는 id랑 달라서 여기에 써줘야 
                        로그인 세션 저장 되어 있는 sMemNo의 값인 MEMBER_NO을 받아옴 -->
						<input type="hidden" name="memNo" value="${sMemNo}">
						<!--로그인 세션 저장 되어 있는 sMemNo의 값인 MEMBER_NM을 받아 옴.-->
						<span id="id" >${sMemNm}</span>
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