<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
$(document).ready(function(){
	
	// 로그아웃 버튼 클릭시
	$("#logoutBtn").on("click", function() {
		location.href = "adLogout";
	});
	
	// 메뉴 - 관리자 계정 관리 
	$("#actMngBtn").on("click", function() {
		location.href = "adminList";
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
		location.href = "adMemList";
	});
	
	// 메뉴 - 신고 내역 관리
	$("#memRepBtn").on("click", function() {
		location.href = "adReportList";
	});
	
	// 메뉴 - 게시글 관리
	$("#memPostBtn").on("click", function() {
		location.href = "adPostList";
	});
	
	// 메뉴 - 댓글 관리
	$("#memCmtBtn").on("click", function() {
		location.href = "adCmtList";
	});	
	
});
</script>
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="headerIcon">
			<span class="material-symbols-outlined"> assignment_ind </span>
			<span id="adNm">${adMemNm} ( ${adNm} )</span>
			<span class="material-symbols-outlined" id="logoutBtn"> Logout </span>로그아웃
		</div>
	</div>

	<!-- sidebar -->
	<div class="sidebar">
		<div id="logo"></div>

		<div id="h_1">
			<div class="adMenu"> <b>Manager Menu</b>
				<div class="btnAll" id="actMngBtn">
					<span class="material-symbols-outlined"> supervisor_account </span>
					<span>관리자 계정 관리</span>
				</div>
	
				<div class="btnAll" id="ntcBtn">
					<span class="material-symbols-outlined" > assignment </span>
					<span>공지사항 관리</span>
				</div>
	
				<div class="btnAll" id="evtBtn">
					<span class="material-symbols-outlined"> calendar_month </span>
					<span>이벤트 관리</span>
				</div>
	
				<div class="btnAll" id="webTotalBtn">
					<span class="material-symbols-outlined"> leaderboard </span> 
					<span>웹사이트 활동 집계</span>
				</div>
			</div>
				
			<div class="adMenu"> <b>Members</b>
				<div class="btnAll" id="memMngBtn">
					<span class="material-symbols-outlined"> manage_accounts </span>
					<span>회원 관리</span>
				</div>

				<div class="btnAll" id="memRepBtn">
					<span class="material-symbols-outlined"> person_off </span>
					<span>신고내역 관리</span>
				</div>
	
				<div class="btnAll" id="memPostBtn">
					<span class="material-symbols-outlined"> library_books </span>
					<span>게시글 관리</span>
				</div>
	
				<div class="btnAll" id="memCmtBtn">
					<span class="material-symbols-outlined"> comment </span>
					<span>댓글 관리</span>
				</div>
			</div>
		</div>
	</div> 
</body>
</html>