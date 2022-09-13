<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댓글 관리</title>
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
#header2 #hd2_search .Sbar1, .Sbar11, .Sbar2, .Sbar3 {
	margin: 20px 0px 0px 0px;
	display: -webkit-inline-box;
	border: 1px solid #ddd;
	position: relative;
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

/* 오른쪽 하단 크기 스크롤*/
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
	/*width: 1000px;*/
	height: 70%;
	/*border: solid 1px #000;*/
	font-size: 25px;
	padding: 23px;
}

/* 테이블 */
table  {
	width: 100%;
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

/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%;
	text-align: right;
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

.commentBoxT {
	border: none;
	width: 96%;
	height: 86%;
}

.sel {
	border: none;
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
		<!-- 상단바 -->
		<div id="hd2_header">
			<div class="hh2_icon">
				<div>알림</div>
				<div>
					<span class="material-symbols-outlined" id="logoutBtn"> exit_to_app </span>로그아웃
				</div>
			</div>
		</div>


		<!-- 오른쪽 하단 전체 크기 -->
		<div id="hd2_content">
			<div id="hd2_Cname"></div>
			<!-- 공백 -->
			<div id="hd2_Cname">
				<div id="Cname_box">
					<span class="material-icons"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						comment </span> 댓글 관리
				</div>
			</div>



			<div id="hd2_CC">
				<div id="CCbox">
					<!-- 검색 구분 -->
					<div id="hd2_search">

						<div class="Sbar1">
							<select class="sel">
								<option>카테고리</option>
								<option>댓글 내용</option>
								<option>아이디</option>
							</select>
						</div>
						<div class="Sbar2">
							<input type="text" class="commentBoxT" />
						</div>
						<div class="Sbar3">
							<input type="button" id="hdSearch" value="검색" />
						</div>
					</div>



					<!-- 테이블  -->
					<table>
						<thead>
							<tr>
								<th colspan="1"><input type="checkbox" /></th>
								<th colspan="1">회원번호</th>
								<th colspan="1">카테고리</th>
								<th colspan="1">아이디</th>
								<th colspan="5">댓글 내용</th>
								<th colspan="1">날짜</th>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="1"><input type="checkbox" /></td>
								<td colspan="1">1</td>
								<td colspan="1">동행구하기</td>
								<td colspan="1">scone</td>
								<td colspan="5">안녕하세요 ㅎㅎ 9월 22날 동행 구해요 심심한 사람들 모이세요~</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="2"><span
									class="material-icons"
									style="font-size: 14px; cursor: pointer; line-height:2;"> close </span></td>
							</tr>
							
							<tr>
								<td colspan="1"><input type="checkbox" /></td>
								<td colspan="1">1</td>
								<td colspan="1">동행구하기</td>
								<td colspan="1">scone</td>
								<td colspan="5">안녕하세요 ㅎㅎ 9월 22날 동행 구해요 심심한 사람들 모이세요~</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="2"><span
									class="material-icons"
									style="font-size: 14px; cursor: pointer; line-height:2;"> close </span></td>
							</tr>
							
							<tr>
								<td colspan="1"><input type="checkbox" /></td>
								<td colspan="1">1</td>
								<td colspan="1">동행구하기</td>
								<td colspan="1">scone</td>
								<td colspan="5">안녕하세요 ㅎㅎ 9월 22날 동행 구해요 심심한 사람들 모이세요~</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="2"><span
									class="material-icons"
									style="font-size: 14px; cursor: pointer; line-height:2;"> close </span></td>
							</tr>
							
							<tr>
								<td colspan="1"><input type="checkbox" /></td>
								<td colspan="1">1</td>
								<td colspan="1">동행구하기</td>
								<td colspan="1">scone</td>
								<td colspan="5">안녕하세요 ㅎㅎ 9월 22날 동행 구해요 심심한 사람들 모이세요~</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="2"><span
									class="material-icons"
									style="font-size: 14px; cursor: pointer; line-height:2;"> close </span></td>
							</tr>
							
							<tr>
								<td colspan="1"><input type="checkbox" /></td>
								<td colspan="1">1</td>
								<td colspan="1">동행구하기</td>
								<td colspan="1">scone</td>
								<td colspan="5">안녕하세요 ㅎㅎ 9월 22날 동행 구해요 심심한 사람들 모이세요~</td>
								<td colspan="1">2022/08/24</td>
								<td colspan="2"><span
									class="material-icons"
									style="font-size: 14px; cursor: pointer; line-height:2;"> close </span></td>
							</tr>
							
							
						</tbody>
					</table>
					<!-- 작성 삭제 버튼 -->
					<div id="write">
						<input type="button" value="삭제" class="delBtn" />
					</div>
				</div>
				<!-- ccbox -->




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