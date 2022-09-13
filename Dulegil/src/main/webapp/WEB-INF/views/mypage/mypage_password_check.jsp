<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
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
		
		if($.trim($("#loginId").val()) == "") {
			makeAlert("알림", "아이디를 입력하세요", function(){;
				$("#loginId").focus();	
			});
		}
		else if($.trim($("#loginPwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요", function(){
				
			$("#loginPwd").focus();
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

function change_btn(e) {
	   var btns = document.querySelectorAll(".btnbox");
	   btns.forEach(function(btn, i) {
	      if(e.currentTarget == btn) {
	         btn.classList.add("active");
	      }
	      else {
	         btn.classList.remove("active");
	      }
	   });
	   console.log( e.currentTarget );


</script>


</head>
<body>
<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-mypage">

		<!-- Sidebar -->
		<div class="mypageBtn">
			<ul class="btnsBox">
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">내 정보</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox active" onclick="change_btn(event)">개인 정보 수정</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">게시글 관리</button></li>
				</a>
				<a href="#">
				  <li><button class="btnbox" onclick="change_btn(event)">댓글 관리</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">동행</button></li>
				</a>      
			</ul>
		</div>
		         
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>비밀번호 확인</span>		         
				</div>
				<div class = "user_box">
					<div id="introbh">
						<span id="id">${sMemNm}</span>
						<span id="checkment">님의 개인정보를 보호하기 위해</span><br>
						<span>비밀번호를 한번 더 확인합니다.</span>
						<br>
						<input type="text" class="pwd" id="pwd">
						<a href="마이페이지-개인정보수정.html">
						<input type="button" class="btn green" id="confirmBtn" value="확인">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>	
			
<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>