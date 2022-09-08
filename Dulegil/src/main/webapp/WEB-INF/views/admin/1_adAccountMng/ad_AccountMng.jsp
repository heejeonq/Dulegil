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
</head>
<body>
		<!--  header 1  -->
	<div id="header1">
		<div id="logo"></div>
		<div id="time"></div>

		<div id="h_1">
			<div class="btnMembers">manager menu</div>

			<div class="btnAll">
				<span class="material-symbols-outlined">account_circle </span>
				<span>관리자 계정 관리</span>
			</div>
			
			
	

			<div class="btnAll">
				<span class="material-symbols-outlined"> edit_document </span>
				<span>공지사항</span>
			</div>


			<div class="btnAll">
				<span class="material-symbols-outlined"> calendar_month </span>
				<span>이벤트 관리</span>

			</div>


			<div class="btnAll">
				<span class="material-symbols-outlined"> bar_chart </span> 
				<span>웹사이트 활동 집계</span>
			</div>

			<div id="empty"></div>
			<div class="btnMembers">members</div>

			<div class="btnOne">
				<span class="material-symbols-outlined"> person </span>
				<span>회원 관리</span>
			</div>


			<div class="btnOne">
				<span class="material-symbols-outlined"> person_off </span>
				<span>신고내역 관리</span>
			</div>


			<div class="btnOne">
				<span class="material-symbols-outlined"> edit_note </span>
				<span>게시물 관리</span>
			</div>


			<div class="btnOne">
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
								info </span> <input type="text" class="input" placeholder="아이디"
								maxlength="20" />

						</div>
						<div class="pw_box">
							<span class="material-symbols-outlined"
								style="font-size: 20px; color: #C0C0C0; vertical-align: middle;">
								lock </span> <input type="password" class="input" placeholder="비밀번호"
								maxlength="20" />
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>