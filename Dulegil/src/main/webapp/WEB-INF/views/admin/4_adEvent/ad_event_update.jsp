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
<style type="text/css">
#header2 #hd2_content {
	width: 100%;
	height: 80%;
	/*border: solid 1px #444;*/
	background-color: white;
}


#header2 #hd2_CC {
	width: 25%;
	height: 90%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

#header2 #hd2_CC #CCbox {
	display: inline-block;
    width: 462px;
    height: 84%;
    border-top: none;
    text-align: left;
    font-size: 25px;
    text-align: center;
    /* border: solid; */
    position: absolute;
}

#Cname {
	width: 100%;
	margin: 10px 0px;
	text-align: left;
	padding: 15px 0;
}

#Ctitle {
	width: 100%;
	height: 32px;
	text-align: left;
}

#Ccontents {
	width: 100%;
	height: 10%;
}

#ct {
	margin-top: 20px;
}

#buttons {
	height: 10%;
	text-align: right;
}

.CTN {
	width: 8%;
    /* text-align: right; */
    display: inline-block;
    font-size: 12px;
    padding: 4px;
    line-height: revert;
}

.CTC {
	width: 39%;
    height: 60%;
    display: inline-block;
    text-align: left;
    vertical-align: middle;
    border-bottom: 1px solid #ddd;
    position: relative;
}

.commentBox {
	display: inline-block;
	vertical-align: top;
	width: 708px;
	height: 36px;
	border: 1px solid #ddd;
}

.commentBoxT {
	border: none;
	width:100%;
	height: 86%;
	position: absolute;
	font-family: 'Gothic A1';
    font-weight: 500;
}

.checkbox {
	width: 50%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	position: relative;
}

.textarea {
	border: 1px solid #ddd;
	outline: none;
}

input:focus {
	outline: none;
}
</style>

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
		location.href = "adNtc";
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
					<span class="material-symbols-outlined"> exit_to_app </span>로그아웃
				</div>
			</div>
		</div>





		<div id="hd2_content">
			<div id="hd2_Cname"></div>






			<div id="hd2_CC">
				<div id="CCbox">
					<div id="Cname">
					
						<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_calendar </span>이벤트
						수정
					</div>
					<div id="Ctitle">
						<div class="CTN">제목</div>
						<div class="CTC">

							<input type="text" class="commentBoxT">
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN">날짜</div>
						<div class="CTC">
							<input type="date" class="commentBoxT" />
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN"> ~ </div>
						<div class="CTC">
							<input type="date" class="commentBoxT" />
						</div>
					</div>
					<textarea rows="30" cols="60" id="ct" name="ct" class="textarea"></textarea>
					<div id="buttons">
						<input type="button" value="수정" class="myButton" /> <input
							type="button" value="목록" class="myButton" />
					</div>

				</div>
			</div>
		</div>


	</div>


</body>
</html>