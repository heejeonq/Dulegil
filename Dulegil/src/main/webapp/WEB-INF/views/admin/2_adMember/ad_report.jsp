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
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">
<style type="text/css">
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

/* vertical-align 은 여기 버튼 css에서 설정해준다. div아님*/
#header2 #hd2_search .Sbar1, .Sbar11, .Sbar2, .Sbar3 {
	margin-top: 20px;
	display: -webkit-inline-box;
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

#header2 #hd2_CC {
	width: 100%;
	height: 90%;
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
	margin-bottom: 70px;
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

th:nth-child(12) {
	width: 70px;
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
}

td:nth-child(9) {
	position: relative;
	width: 10%;
}

.tr_td:hover {
	background-color: #ebebeb;
	font-weight: 700px !important;
}

/* 펼치기 */
#header2 #hd2_CC #CCbox #hide {
	padding: 56px 80px;
	margin: auto;
	width: 50%;
	height: 38%;
	font-size: 11px;
	position: absolute;
	background-color: rgb(254, 250, 239);
	background-color: rgb(231 231 231/ 26%);
	backdrop-filter: blur(30px);
	-webkit-backdrop-filter: blur(30px);
	border: 0px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	border-radius: 12px;
	-webkit-border-radius: 12px;
	color: #f5f5f1;
	width: 50%;
	height: 38%;
	font-size: 11px;
	position: absolute;
	background-color: rgb(254, 250, 239);
	background-color: rgb(231 231 231/ 26%);
	backdrop-filter: blur(30px);
	-webkit-backdrop-filter: blur(30px);
	border: 0px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-border-radius: 12px;
	z-index: 10;

}

#show {
	font-size: 11px;
}

#hidebox {
	text-ailgn: center;
	text-align: -webkit-center;
}

.hb_left, .CB, .CBC {
	width: 100%;
	display: inline-block;
	font-size: 11px;
}

#tr_1 {
	font-size: 14px;
}

.CB {
	height: 40%;
	margin-top: 2%;
	color: #444;
}

.CBC {
	height: 20%;
	margin-top: 4%;
	border-top: solid 1px #dcdcdc;
}


.delBtn {
	background-color: #ededed;
	border-radius: 4px;
	border: 1px solid #f4f5ee;
	display: inline-block;
	cursor: pointer;
	color: #5e5e5e;
	font-weight: 600;
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

/*페이징*/
#header2 #hd2_CC #hd2_paging {
	display: inline-block;
	margin-top: 3px;
	text-align: -webkit-center;
	width: 40%;
	height: 5%;
	z-index:-1;
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



.sel {
	border: none;
	outline: none;
	position: inherit;
	margin: auto;
	width: 100%;
	height: 100%;
	text-align: center;
}

#wrap .comment_icon {
	display: inline-block;
	width: 34px;
	height: 34px;
	border-radius: 100px;
	text-align: left;
	background: #f3cdd4;
}

#wrap .comment_nm {
	display: inline-block;
	width: 44px;
	height: 17px;
	color: #444;
	vertical-align: top;
	font-family: "Gothic A1";
	font-weight: 700;
}

.comment_box {
	display: inline-block;
	width: 70%;
	height: 68%;
	color: #444;
	margin: 10px 12px 0px 0px;
	text-align: left;
	font-family: "Gothic A1";
	font-weight: 500;
}

#wrap {
	display: inline-block;
	margin: 10px 12px 0px 0px;
	vertical-align: top;
}

.hide_table th {
	background: none;
	border-bottom: 1px solid #ccb;
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
		<!-- 상단바 -->
		<div id="hd2_header">
			<div class="hh2_icon">
				<div>알림</div>
				<div>
					<span class="material-symbols-outlined" id="logoutBtn"> exit_to_app </span>로그아웃
				</div>
			</div>
		</div>



		<div id="hd2_content">
			<div id="hd2_Cname"></div>
			<div id="hd2_Cname">
				<div id="Cname_box">
				
				
					<span class="material-symbols-outlined"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						person_off </span>신고 내역 관리
				</div>
			</div>



			<div id="hd2_CC">
				<div id="CCbox">
					<!-- 검색 구분  -->
					<div id="hd2_search">

						<div class="Sbar1">
							<select class="sel">
								<option>카테고리</option>
								<option>신고자 아이디</option>
								<option>신고대상 아이디</option>
								<option>신고 카테고리</option>
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
							<tr id="tr_1">
								<th colspan="1"></th>
								<th colspan="1">번호</th>
								<th colspan="1">신고 카테고리</th>
								<th colspan="1">아이디</th>
								<th colspan="1">신고자<br />아이디
								</th>
								<th colspan="1">신고날짜</th>
								<th colspan="1">게시글 카테고리</th>
								<th colspan="1">항목</th>
								<th colspan="2">처리여부</th>
							</tr>
						</thead>


						<tbody>
							<tr>
								<td colspan="1">
									<div>
										<a href=#none id="show"
											onclick="if(hide.style.display=='none') {
												hide.style.display='';
												show.innerText='▲'
												
												} else {
													hide.style.display='none';
													show.innerText='▼'
													
												}">
												
												<span class="material-symbols-outlined"> arrow_drop_down </span></a>
										<div id="hide" style="display: none">
											<div id="hidebox">
												<div class="hb_left">
													<table class="hide_table">
														<thead>
															<tr>
																<th>번호</th>
																<th>게시판 카테고리</th>
																<th colspan='2'>글 제목</th>
																<th>작성자</th>
																<th>작성일</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>22</td>
																<td>동행 구하기</td>
																<td colspan='2'>오늘 관리자님 이상하지 않나요</td>
																<td>시메트라</td>
																<td>2022.07.01</td>
															</tr>
														</tbody>
													</table>
												</div>


											</div>
											<div class="CB">관리자 이상하지 않음? 아무리 생각해도 이상함 반박시 너말이 맞음</div>
											<div class="CBC">
												내용 박스
												<div id="wrap">
													<div class="comment_icon"></div>
													<div class="comment_nm">babo</div>
												</div>
												<div class="comment_box">ㄹㅇ 그니까 ㅅㅂ</div>
											</div>

										</div>
									</div>
								</td>
								<td colspan="1">1</td>
								<td colspan="1">욕설</td>
								<td colspan="1">babo</td>
								<td colspan="1">scone</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="1">동행게시판</td>
								<td colspan="1">댓글</td>
								<td colspan="2"><select class="sel">
										<option>활동 중지</option>
										<option>반려</option>
										<option>강제 탈퇴</option>
								</select></td>
							</tr>

						</tbody>
					</table>

				
				</div><!-- ccbox -->



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
			</div>

		</div>


	</div>






</body>
</html>