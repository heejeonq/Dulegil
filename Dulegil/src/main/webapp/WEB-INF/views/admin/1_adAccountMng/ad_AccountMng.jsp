<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">

<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 로그아웃 버튼 클릭시
	$("#logoutBtn").on("click", function() {
		location.href = "adLogout";
	});
	
	
	// 메뉴 - 관리자 계정 관리 
	$("#actMngBtn").on("click", function() {
		location.href = "adAccountMng";
	});
	
	
	// 메뉴 - 공지사항
	$("#ntcBtn").on("click", function() {
		location.href = "adNtList";
	});
	
	
	// 메뉴 - 이벤트관리
	$("#evtBtn").on("click", function() {
		location.href = "adEvt";
	});
	
	
	// 메뉴 - 웹사이트 활동 집계
	$("#webTotalBtn").on("click", function() {
		location.href = "adWebTotal";
	});
	
	
	// 메뉴 - 회원관리
	$("#memMngBtn").on("click", function() {
		location.href = "adMemMng";
	});
	
	// 메뉴 - 신고 내역 관리
	$("#memRepBtn").on("click", function() {
		location.href = "adMemRep";
	});
	
	// 메뉴 - 게시물 관리
	$("#memPostBtn").on("click", function() {
		location.href = "adMemPost";
	});
	
	// 메뉴 - 댓글 관리
	$("#memCmtBtn").on("click", function() {
		location.href = "adMemCmt";
	});
	
	
	
	
	
});
</script>
</head>
<body>
		<!--  header 1  -->
	<div id="header1">
		<div id="logo"></div>
		<div id="time"></div>

		<div id="h_1">
			<div class="btnMembers">manager menu</div>

			<div class="btnAll" id="actMngBtn">
				<span class="material-symbols-outlined">account_circle </span>
				<span>관리자 계정 관리</span>
			</div>
			
			
	

			<div class="btnAll" id="ntcBtn">
				<span class="material-symbols-outlined" > edit_document </span>
				<span>공지사항</span>
			</div>


			<div class="btnAll" id="evtBtn">
				<span class="material-symbols-outlined"> calendar_month </span>
				<span>이벤트 관리</span>

			</div>


			<div class="btnAll" id="webTotalBtn">
				<span class="material-symbols-outlined"> bar_chart </span> 
				<span>웹사이트 활동 집계</span>
			</div>

			<div id="empty"></div>
			<div class="btnMembers">members</div>

			<div class="btnOne" id="memMngBtn">
				<span class="material-symbols-outlined"> person </span>
				<span>회원 관리</span>
			</div>


			<div class="btnOne" id="memRepBtn">
				<span class="material-symbols-outlined"> person_off </span>
				<span>신고내역 관리</span>
			</div>


			<div class="btnOne" id="memPostBtn">
				<span class="material-symbols-outlined"> edit_note </span>
				<span>게시물 관리</span>
			</div>


			<div class="btnOne" id="memCmtBtn">
				<span class="material-symbols-outlined"> comment </span>
				<span>댓글 관리</span>
			</div>
		</div>
	</div> <!-- 헤더 1 -->






	<div id="header2">
		<div id="hd2_header">
			<div class="hh2_icon">
				<div>알림</div>
				<div>
					<span class="material-symbols-outlined" id="logoutBtn" style="cursor:pointer;"> exit_to_app </span>로그아웃
				</div>
			</div>
		</div>
		
		
		
		
		
		<div id="hd2_content">
			<div id="hd2_Cname"></div>
			
			
			
			<div id="hd2_CC">
				<div id="CCbox">

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
						
					</div> <!-- login box end -->

				</div> <!-- cc box end -->
			</div>  <!-- cc end -->
			
		</div> <!-- hd2 content end -->
	</div>
</body>
</html>