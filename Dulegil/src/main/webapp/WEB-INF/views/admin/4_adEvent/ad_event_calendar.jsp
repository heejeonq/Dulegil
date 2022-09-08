<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 달력</title>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">

/*오른쪽 전체 크기*/
#header2 #hd2_content {
	width: 100%;
	height: 80%;
	/*border: solid 1px #444;*/
	background-color: white;
}

/* 상단바 */
#header2 #hd2_Cname {
	width: 100%;
	height: 35px;
	text-align: left;
	font-size: 20px;
	background-color: white;
	/* margin-top: 2%; */
	/* margin-bottom: 1%; */
	margin: 10px 10px 31px 0px;
}

#header2 #hd2_Cname #Cname_box {
	display: inline-block;
	width: 22%;
	/*border: solid 1px #444;*/
}

/* 오른쪽 하단 크기 */
#header2 #hd2_CC {
	width: 92%;
	height: 80%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	margin: auto;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

/* 내용 크기 */
#header2 #hd2_CC #CCbox {
	display: inline-block;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: solid 1px #000; */
	text-align: center;
	font-size: 25px;
}

/* 테이블 */
table {
	margin-bottom: 70px;
}

th {
	width: 310px;
	height: 10%;
	font-size: 13px;
	padding: 14px;
	border-bottom: solid 1px #5e5e5e;
	color: #a1a1a1;
}

th:nth-child(2), td:nth-child(2) {
	width: 70%;
	text-align: left;
}

#tr_1 {
	font-size: 14px;
}

td {
	font-size: small;
	border-bottom: solid 0.5px #ebebeb;
	padding: 10px;
}
/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%
}

/* 페이징 */
#header2 #hd2_CC #hd2_paging {
	display: inline-block;
	margin-top: 3px;
	text-align: -webkit-center;
	width: 40%;
	height: 5%;
}

#header2 #hd2_CC #hd2_paging #pBtn {
	width: 15px;
	height: 15px;
	display: inline-block;
	margin-right: 11px;
}

#header2 #hd2_CC #hd2_paging #pBtn_GD {
	width: 15px;
	height: 15px;
	margin-right: 30px;
	margin-top: 1%;
	display: inline-block;
}

.pBtn {
	border: none;
	font-size: 12px;
	background-color: white;
	display: inline-box;
}

.pBtn:hover {
	background-color: #ECECEC;
}

/* 검색창 */
#header2 #search {
	height: 54px;
	text-align: center;
	font-size: 20px;
	background-color: white;
	margin-bottom: 40px;
}

/* vertical-align 은 여기 버튼 css에서 설정해준다. div아님*/
#header2 #search .Sbar1, .Sbar11, .Sbar2, .Sbar3 {
	margin-top: 20px;
	display: -webkit-inline-box;
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
	width: 80px;
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
	position: absolute;
}

#hdSearch {
	margin-right: 1%;
	background-color: #ededed;
	border-radius: 4px;
	border: none;
	display: inline-block;
	cursor: pointer;
	color: #5e5e5e;
	font-family: Arial;
	font-size: 13px;
	padding: 5px 27px;
	text-decoration: none;
	font-weight: 700;
}

input:focus {
	outline: none;
}

#hdSearch:hover {
	background-color: #ddd;
}

.sel {
	border: none;
	outline: none;
	position: inherit;
	width: 100%;
}

.eventCal {
	width: 670px;
	height: 400px;
	margin: 16px auto;
	border: 1px solid #ddd;
}

#hd2_content .wrap_1 {
	display: inline-block;
	width: 914px;
	height: 116%;
	border: 1px solid #ddd;
}

#hd2_content .wrap_2 {
	display: inline-block;
	width: 20%;
	height: 93%;
	position: absolute;
	border: 1px solid #ddd;
}

#hd2_content .wrap_2 #hd2_paging  {
display: -webkit-inline-box;

}

#hd2_content .wrap_2  #page {

text-align:center;
}

#event_Cal td {
	padding: 13px 64px 41px 8px;
	border: 1px solid #ddd;
}

th {
	border-bottom: none;
}

th:nth-child(2), td:nth-child(2) {
	width: 310px;
	text-align: center;
}

#month {
	font-size: 20px;
	vertical-align: top;
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
			<!-- 왼쪽 박스 -->
			<div class=wrap_1>
				<div id="hd2_Cname"></div>
				<!-- 상단 빈칸 용도 -->


				<div id="hd2_CC">
					<div id="CCbox">

						<div id="hd2_Cname">
							<div id="Cname_box">
								<span class="material-symbols-outlined"
									style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
									event_note </span>이벤트 목록
							</div>
						</div>
						<!-- 이벤트 달력 -->

						<div class="date">
							<span class="material-icons"> chevron_left </span> <span
								id="month">9월</span> <span class="material-icons">
								chevron_right </span>
						</div>


						<div class="eventCal">
							<table id="event_Cal">
								<thead>
									<tr>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
										<th>일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>

									</tr>
									<tr>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td>11</td>

									</tr>
									<tr>
										<td>12</td>
										<td>13</td>
										<td>14</td>
										<td>15</td>
										<td>16</td>
										<td>17</td>
										<td>18</td>

									</tr>
									<tr>
										<td>19</td>
										<td>20</td>
										<td>21</td>
										<td>22</td>
										<td>23</td>
										<td>24</td>
										<td>25</td>

									</tr>
									<tr>
										<td>26</td>
										<td>27</td>
										<td>28</td>
										<td>29</td>
										<td>30</td>
										<td></td>
										<td></td>

									</tr>
								</tbody>
							</table>
						</div>


						<!-- 작성 삭제 버튼 -->
						<div id="write">
							<input type="button" value="이벤트 추가" class="delBtn" /> <input
								type="button" value="삭제" class="delBtn" />
						</div>
					</div>
					<!-- ccbox -->





					<div id="page">
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
					</div>


					<div id="search">
						<div class="Sbar1">
							<select class="sel">
								<option>카테고리</option>
								<option>제목</option>
								<option>내용</option>
							</select>
						</div>
						<div class="Sbar2">
							<input type="text" class="commentBoxT" />
						</div>
						<div class="Sbar3">
							<input type="button" id="hdSearch" value="검색" />
						</div>
					</div>
					<!-- 서치 -->


				</div>
			</div>
			<!-- 오른쪽 박스 -->
			<div class="wrap_2">

				<div id="page">
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
				</div>


				<div id="search">
					<div class="Sbar1">
						<select class="sel">
							<option>카테고리</option>
							<option>제목</option>
							<option>내용</option>
						</select>
					</div>
					<div class="Sbar2">
						<input type="text" class="commentBoxT" />
					</div>
					<div class="Sbar3">
						<input type="button" id="hdSearch" value="검색" />
					</div>
				</div>
				<!-- 서치 -->
			</div>
		</div>


	</div>






</body>
</html>