<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 상세</title>
<link
	href="https://fonts.googleapis.com/css?family=Gothic+A1:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
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
@import
	url('https://fonts.googleapis.com/css?family=Gothic+A1:100,200,300,400,500,600,700,800,900')
	;

#header2 #hd2_content {
	width: 100%;
	height: 80%;
	/*border: solid 1px #444;*/
	background-color: white;
}

#header2 #hd2_Cname {
	width: 100%;
	height: 35px;
	text-align: center;
	font-size: 20px;
	font-weight: 800;
	background-color: white;
	margin-top: 2%;
	margin-bottom: 1%;
}

#header2 #hd2_Cname #Cname_box {
	display: inline-block;
	width: 22%;
	/*border: solid 1px #444;*/
	font-family: "Gothic A1", sans-serif;
}

#header2 #hd2_CC {
	width: 82%;
	height: 80%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	margin: auto;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

#header2 #hd2_CC #CCbox {
	display: inline-block;
	/*width: 1000px;*/
	height: 80%;
	margin-top: 10px;
	margin-bottom: 10px;
	/*border: solid 1px #000;*/
	text-align: center;
	font-size: 25px;
}

#header2 #hd2_CC #hd2_paging {
	display: inline-block;
	margin-top: 3px;
	text-align: -webkit-center;
	width: 40%;
	height: 5%;
	font-family: "Gothic A1";
	font-weight: 500;
}

#header2 #hd2_CC #hd2_paging #pBtn {
	width: 15px;
	height: 15px;
	display: inline-block;
	margin-right: 11px;
	font-family: "Gothic A1";
	font-weight: 500;
}

#header2 #hd2_CC #hd2_paging #pBtn_GD {
	width: 15px;
	height: 15px;
	margin-right: 30px;
	margin-top: 1%;
	display: inline-block;
	font-family: "Gothic A1";
	font-weight: 500;
}

#header2 #search {
	width: 100%;
	height: 10%;
	text-align: center;
	font-size: 20px;
	background-color: white;
}

/* vertical-align 은 여기 버튼 css에서 설정해준다. div아님*/
#header2 #search .Sbar1, .Sbar11, .Sbar2, .Sbar3 {
	margin-top: 20px;
	display: -webkit-inline-box;
}

#update {
	width: 100%;
	text-align: right;
	margin-top: 10px;
}

/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%;
	text-align: right;
}

table {
	border-collapse: collapse;
	margin-bottom: 0px;
}

th {
	width: 310px;
	height: 10%;
	font-size: 13px;
	padding: 14px;
	border-bottom: solid 1px #ededed;
	color: #a1a1a1;
}

td {
	font-size: small;
	font-weight: 500;
	padding: 10px;
	border-bottom: solid 1px #ededed;
}

th:nth-child(2), td:nth-child(2) {
	width: 67%;
	text-align: left;
}

#tr_1 {
	font-size: 14px;
}

#gongzi {
	height: 74%;
	border-bottom: solid 1px #ededed;
	background-color: white;
	color: #444;
	padding: 20px;
	font-size: 13px;
	font-weight: 400;
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
				<span class="material-symbols-outlined">account_circle </span> <span>관리자
					계정 관리</span>
			</div>




			<div class="btnAll">
				<span class="material-symbols-outlined"> edit_document </span> <span>공지사항</span>
			</div>


			<div class="btnAll">
				<span class="material-symbols-outlined"> calendar_month </span> <span>이벤트
					관리</span>

			</div>


			<div class="btnAll">
				<span class="material-symbols-outlined"> bar_chart </span> <span>웹사이트
					활동 집계</span>
			</div>

			<div id="empty"></div>
			<div class="btnMembers">members</div>

			<div class="btnOne">
				<span class="material-symbols-outlined"> person </span> <span>회원
					관리</span>
			</div>


			<div class="btnOne">
				<span class="material-symbols-outlined"> person_off </span> <span>신고내역
					관리</span>
			</div>


			<div class="btnOne">
				<span class="material-symbols-outlined"> edit_note </span> <span>게시물
					관리</span>
			</div>


			<div class="btnOne">
				<span class="material-symbols-outlined"> comment </span> <span>댓글
					관리</span>
			</div>
		</div>
	</div>
	<!-- 헤더 1 -->




	<div id="header2">
		<div id="hd2_header"></div>
		<div id="hd2_content">
			<div id="hd2_Cname"></div>
			<!-- 빈칸용도 -->
			<div id="hd2_Cname">
				<div id="Cname_box">
					<span class="material-symbols-outlined"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						event_note </span> 이벤트
				</div>
			</div>
			<div id="hd2_CC">
				<div id="CCbox">
					<table>
						<thead>
							<tr>
								<th colspan="1">번호</th>
								<th colspan="6">글 제목</th>
								<th colspan="1">작성자</th>
								<th colspan="1">기간</th>
								<th colspan="1">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="1">01</td>
								<td colspan="6">여름맞이 둘레길 이벤트</td>
								<td colspan="1">관리자</td>
								<td colspan="1">22.06.30 ~ 22.07.30</td>
								<td colspan="1">1000</td>
							</tr>
						</tbody>
					</table>

					<div id="gongzi">
						<a> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br />
							여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는
							이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트
							입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br />

						</a>
					</div>
					<div id="update">
						<input type="button" value="수정" class="delBtn" />
					</div>
				</div>
				<!-- ccbox -->


				<div id="search">
					<div class="Sbar3">
						<input type="button" class="delBtn" value="목록" />
					</div>
				</div>
			</div>
		</div>


	</div>






</body>
</html>