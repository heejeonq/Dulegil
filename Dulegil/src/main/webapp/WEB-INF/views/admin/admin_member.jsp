<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>member manage</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="../css/header1.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

<style type="text/css">

/*오른쪽 전체 크기*/
#header2 #hd2_content {
	width: 100%;
	height: 88%;
	/*border: solid 1px #444;*/
	background-color: white;
}

#header2 #hd2_search {
	height: 60px;
	text-align: left;
	font-size: 20px;
	background-color: white;
}

/* vertical-align 은 여기 버튼 css에서 설정해준다. div아님*/
#header2 #hd2_search .Sbar1, .Sbar2, .Sbar3 {
	margin-top: 20px;
	display: -webkit-inline-box;
}

.Sbar3 {
	border: none;
}

/* 상단바 */
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
}

/* 오른쪽 하단 크기 */
#header2 #hd2_CC {
	width: 100%;
	height: 87%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

/* 내용 크기 */
#header2 #hd2_CC #CCbox {
	display: inline-block;
	text-align: -webkit-center;
	/*width: 1000px;*/
	height: 70%;
	/*border: solid 1px #000;*/
	font-size: 25px;
	padding: 23px;
}

/* 테이블 */
table  {
	border-collapse: collapse;
	margin-top: 30px;
	color: #404040;
	box-shadow: 3px 3px 3px 0px #ebebeb;
	border-radius: 4px;
}

th, td {
	border-collapse: collapse;
	text-align: center;
	padding: 4px;
	color: #404040;
	font-weight: 500;
}

td:nth-child(12) {
	width: 10px;
}

th:nth-child(5) {
	width: 170px;
}

th {
	width: 114px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}


td {
	font-size: small;
	border-bottom: solid 0.5px #ebebeb;
	padding: 8px;
	color: #4e4e4e;
}

.tr_td:hover {
	background-color: #ebebeb;
	font-weight: 700px !important;
}

/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 93%;
	text-align: right;
}

.delBtn {
	margin-right: 1%;
	background-color: #ededed;
	border-radius: 4px;
	border: 1px solid #f4f5ee;
	display: inline-block;
	cursor: pointer;
	color: #5e5e5e;
	font-family: Arial;
	font-size: 13px;
	padding: 7px 13px;
	text-decoration: none;
	margin-top: 4px;
}

.delBtn:hover {
	background-color: #ECECEC;
}

input:focus {
	outline: none;
}

#hdSearch {
	background-color: #ededed;
	border-radius: 5px;
	border: 1px solid #f4f5ee;
	display: inline-block;
	cursor: pointer;
	color: #5e5e5e;
	font-family: Arial;
	font-size: 13px;
	text-decoration: none;
	font-weight: 700;
	padding: 4px 10px;
}

.Sbar3 {
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	position: relative;
}

.Sbar2 {
	width: 13%;
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.Sbar1 {
	width: 8%;
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.commentBoxT {
	border: none;
	width: 96%;
	height: 86%;
}

.sel {
	border: none;
	outline: none;
	position: absolute;
	/* margin: auto; */
	width: 100%;
	height: 100%;
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
		<!-- 상단바 -->
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
			<div id="hd2_Cname">
				<div id="Cname_box">
					<span class="material-icons"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						manage_accounts </span> 회원 관리
				</div>
			</div>


			<div id="hd2_CC">
				<div id="CCbox">
					<div id="hd2_search">
						<div class="Sbar1">
							<select class="sel">
								<option>회원번호</option>
								<option>아이디</option>
								<option>성별</option>
								<option>주소</option>
								<option>신뢰도</option>
							</select>
						</div>
						<div class="Sbar2">
							<input type="text" class="commentBoxT" />
						</div>
						<div class="Sbar3">
							<input type="button" id="hdSearch" value="검색" />
						</div>
					</div>


					<!-- 테이블 -->
					<table>
						<thead>
							<tr>
								<th colspan="1">회원번호</th>
								<th colspan="1">권한</th>
								<th colspan="1">아이디</th>
								<th colspan="1">이름</th>
								<th colspan="1">휴대폰 번호</th>
								<th colspan="1">이메일</th>
								<th colspan="1">생년월일</th>
								<th colspan="1">성별</th>
								<th colspan="1">주소</th>
								<th colspan="1">신뢰도</th>
								<th colspan="1">신고<br />당한<br />횟수
								</th>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr_td">
								<td>1</td>
								<td>회원</td>
								<td>lemonpoundcake</td>
								<td>정시원</td>
								<td>010-0000-0000</td>
								<td>lemon@gmail.com</td>
								<td>2022/11/11</td>
								<td>여</td>
								<td>가산디지털단지</td>
								<td>★★★★★ / 5</td>
								<td>0</td>
								<td><span class="material-icons-outlined"
									style="font-size: 14px; cursor: pointer;"> edit </span> <span
									class="material-icons"
									style="font-size: 14px; cursor: pointer;"> close </span></td>
							</tr>
							<tr class="tr_td">
								<td>1</td>
								<td>회원</td>
								<td>lemonpoundcake</td>
								<td>정시원</td>
								<td>010-0000-0000</td>
								<td>lemon@gmail.com</td>
								<td>2022/11/11</td>
								<td>여</td>
								<td>가산디지털단지</td>
								<td>★★★★★ / 5</td>
								<td>0</td>
								<td><span class="material-icons-outlined"
									style="font-size: 14px; cursor: pointer;"> edit </span> <span
									class="material-icons"
									style="font-size: 14px; cursor: pointer;"> close </span></td>
							</tr>
							<tr class="tr_td">
								<td>1</td>
								<td>회원</td>
								<td>lemonpoundcake</td>
								<td>정시원</td>
								<td>010-0000-0000</td>
								<td>lemon@gmail.com</td>
								<td>2022/11/11</td>
								<td>여</td>
								<td>가산디지털단지</td>
								<td>★★★★★ / 5</td>
								<td>0</td>
								<td><span class="material-icons-outlined"
									style="font-size: 14px; cursor: pointer;"> edit </span> <span
									class="material-icons"
									style="font-size: 14px; cursor: pointer;"> close </span></td>
							</tr>
							<tr class="tr_td">
								<td>1</td>
								<td>회원</td>
								<td>lemonpoundcake</td>
								<td>정시원</td>
								<td>010-0000-0000</td>
								<td>lemon@gmail.com</td>
								<td>2022/11/11</td>
								<td>여</td>
								<td>가산디지털단지</td>
								<td>★★★★★ / 5</td>
								<td>0</td>
								<td><span class="material-icons-outlined"
									style="font-size: 14px; cursor: pointer;"> edit </span> <span
									class="material-icons"
									style="font-size: 14px; cursor: pointer;"> close </span></td>
							</tr>
							<tr class="tr_td">
								<td>1</td>
								<td>회원</td>
								<td>lemonpoundcake</td>
								<td>정시원</td>
								<td>010-0000-0000</td>
								<td>lemon@gmail.com</td>
								<td>2022/11/11</td>
								<td>여</td>
								<td>가산디지털단지</td>
								<td>★★★★★ / 5</td>
								<td>0</td>
								<td><span class="material-icons-outlined"
									style="font-size: 14px; cursor: pointer;"> edit </span> <span
									class="material-icons"
									style="font-size: 14px; cursor: pointer;"> close </span></td>
							</tr>
							
						</tbody>
					</table>
				</div>



				<!--  페이징  -->
				<div id="hd2_paging">
					<div id="pBtn_GD">
						<input type="button" value="이전" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="1" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="2" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="3" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="4" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="5" class="pBtn" />
					</div>
					<div id="pBtn_GD">
						<input type="button" value="다음" class="pBtn" />
					</div>
				</div>
				<!-- 페이징 -->

			</div>
			<!-- hd2_CC -->

		</div>
		<!-- 오른쪽 하단 전체 크기 hd2_content -->


	</div>
	<!-- header2 -->






</body>
</html>