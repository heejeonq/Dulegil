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
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">
<style type="text/css">
#header2 #hd2_content {
	width: 100%;
	height: 92%;
	background-color: white;
}

#header2 #hd2_Cname {
	width: 100%;
	height: 6%;
	font-size: 20px;
	background-color: white;
}

#name {
	width: 33%;
	height: 68%;
	margin: 1% 0;
	font-size: 20px;
	font-weight: 600;
	text-align: left;
}

#header2 #hd2_CC {
	width: 100%;
	height: 90%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

#header2 #hd2_CC #CCbox {
	display: inline-block;
	/*width: 1000px;*/
	height: 100%;
	text-align: center;
	font-size: 25px;
}

#box1 {
	width: 100%;
	height: 6%;
	font-size: small;
	margin: 8px 0px;
	text-align: -webkit-center;
	font-size: small;
	margin: 8px 0px;
}

#box2 {
	width: 100%;
	height: 11%;
	font-size: medium;
	margin: 10px 0px;
	text-align: -webkit-center;
	font-size: medium;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 50px;
	color: #404040;
	box-shadow: 3px 3px 3px 0px #ebebeb;
	border-radius: 4px;
}

td, th {
	border-collapse: collapse;
	text-align: center;
	padding: 4px;
	color: #404040;
	font-weight: 500;
}

th {
	width: 153px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}

td {
	font-size: small;
	padding: 8px;
}

#cal {
	width: 599px;
	height: 249px;
	margin-top: 70px;
	display: inline-block;
	background-image:
	url('http://localhost:8090/Dulegil/resources/images/mintable.png');
	background-size: cover;
}
</style>









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
			<!-- 빈칸 용도 -->
			<div id="hd2_CC">
				<div id="CCbox">
					<div id="hd2_Cname">
						<div id="name">
							<span class="material-symbols-outlined"
								style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
								bar_chart </span> <span>웹사이트활동 집계</span>
						</div>
					</div>

					<!-- 통계 표 -->
					<div id="cal"></div>



					<div id="box1">
						<table>
							<thead>
								<tr>
									<th>총 회원 수</th>
									<th>게시글 수</th>
									<th>댓글 수</th>
									<th>동행 신청 수</th>
									<th>동행 성사 수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>100</td>
									<td>100</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="box2">
						<table>
							<thead>
								<tr>
									<th>기간</th>
									<th>게시글</th>
									<th>댓글 수</th>
									<th>회원가입 수</th>
									<th>동행 신청 수</th>
									<th>동행 성사 수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2022.03.01 ~<br /> 2022.03.15
									</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2022.03.01 ~<br /> 2022.03.15
									</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2022.03.01 ~<br /> 2022.03.15
									</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2022.03.01 ~<br /> 2022.03.15
									</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
									<td>10</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>


	</div>






</body>
</html>