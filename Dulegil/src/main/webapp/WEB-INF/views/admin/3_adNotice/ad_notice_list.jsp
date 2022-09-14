<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/jscss.jsp" flush="true" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 목록</title>
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
	/*width: 1000px;*/
	height: 80%;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: solid 1px #000; */
	text-align: center;
	font-size: 25px;
}

/* 테이블 */
th {
	width: 310px;
	height: 10%;
	font-size: 13px;
	padding: 14px;
	border-bottom: solid 1px #5e5e5e;
	color: #a1a1a1;
}

th:nth-child(2), td:nth-child(2) {
	width: 65%;
	text-align: left;
}

tr .tr_td:hover {
	background-color: #ebebeb;
	font-weight: 700px !important;
}

#tr_1 {
	font-size: 14px;
}

td {
	font-size: small;
	font-weight: 500;
	border-bottom: solid 0.5px #ebebeb;
	padding: 10px;
}
/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%;
	text-align: right;
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
	width: 6%;
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

#searchBtn {
	margin-right: 1%;
	background-color: #ededed;
	border-radius: 4px;
	border: 1px solid #f4f5ee;
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
	background-color: #ECECEC;
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
	
	
	
	// 목록 구분 설정
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	
	reloadList();
	
	
	
	// 검색 버튼 클릭시
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	})
	
	
	// 페이징 버튼
	$(".paging_area").on("click", "div", function(){
		//기존 검색 상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#page").val($(this).attr("page"));
		reloadLsit();
		
	});
	
	
	// 글 목록 클릭시 상세보기 // 체크 박스 선택시 x 
	$("tbody").on("click", "tr", function(){
		$("#no").val($(this).attr("no"));
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtDetail");
		$("#actionForm").submit();
	});
	
	
	
	
	// 공지 등록 버튼
	$("#insertBtn").on("click", function(){
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtWrite");
		$("#actionForm").submit();
	});
	
	
	
}); // document.ready end


function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "adNtAjax",
		type: "POST",
		dataType: "json",
		data : params,
		success : function(res){
			drawList(res.list);
			//drawPaging(res.pd);
			console.log(res);

		},
		error : function(request, status, error) { //실패했을 때 함수 실행
			console.log(request.responseText); //실패 상세내역
		}
	});
}

function drawList(list){
	var html = "";
	
	for(var data of list){
		// "+ +"                                                             
		html += "<tr class=\"tr_td\"no=\"" + data.MEMBER_NO + "\">";
		html += "<td colspan=\"1\">"+ data.POST_NO +"</td>";
		html += "<td colspan=\"6\">"+ data.TITLE +"</td>";
		html += "<td colspan=\"1\">"+ data.NM +"</td>";
		html += "<td colspan=\"1\">"+ data.REG_DT +"</td>";
		html += "<td colspan=\"1\"><input type=\"checkbox\" /></td>";
		html += "</tr>";
		                                                                
	}                                                                    
	$("tbody").html(html);
};

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
				<span class="material-symbols-outlined">account_circle </span> <span>관리자
					계정 관리</span>
			</div>




			<div class="btnAll" id="ntcBtn">
				<span class="material-symbols-outlined"> edit_document </span> <span>공지사항</span>
			</div>


			<div class="btnAll" id="evtBtn">
				<span class="material-symbols-outlined"> calendar_month </span> <span>이벤트
					관리</span>

			</div>


			<div class="btnAll" id="webTotalBtn">
				<span class="material-symbols-outlined"> bar_chart </span> <span>웹사이트
					활동 집계</span>
			</div>

			<div id="empty"></div>
			<div class="btnMembers">members</div>

			<div class="btnOne" id="memMngBtn">
				<span class="material-symbols-outlined"> person </span> <span>회원
					관리</span>
			</div>


			<div class="btnOne" id="memRepBtn">
				<span class="material-symbols-outlined"> person_off </span> <span>신고내역
					관리</span>
			</div>


			<div class="btnOne" id="memPostBtn">
				<span class="material-symbols-outlined"> edit_note </span> <span>게시물
					관리</span>
			</div>


			<div class="btnOne" id="memCmtBtn">
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
					<span class="material-symbols-outlined" id="logoutBtn">
						exit_to_app </span>로그아웃
				</div>
			</div>
		</div>


		<div id="hd2_content">
			<div id="hd2_Cname"></div>
			<!-- 상단 빈칸 용도 -->
			<div id="hd2_Cname">
				<div id="Cname_box">
					<span class="material-symbols-outlined"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						event_note </span>공지사항 목록
				</div>
			</div>

			<div id="hd2_CC">
				<div id="CCbox">
					<table>
						<thead>
							<tr>
								<th colspan="1">번호</th>
								<th colspan="6">글제목</th>
								<th colspan="1">작성자</th>
								<th colspan="1">작성일</th>
								<th colspan="1">삭제</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>



					<!-- 작성 삭제 버튼 -->
					<div id="write">
						<input type="button" value="글쓰기" class="delBtn" id="insertBtn" />
						<input type="button" value="삭제" class="delBtn" />
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
					<form action="#" id="actionForm" method="post">
						<input type="hidden" name="no" id="no" /> <input type="hidden"
							name="page" id="page" value="${page}" />

						<div class="Sbar1">
							<select class="sel" name="searchGbn" id="searchGbn">
								<option value="0">제목</option>
								<option value="1">내용</option>
							</select>
						</div>

						<div class="Sbar2">
							<input type="text" class="commentBoxT" name="searchTxt"
								id="searchTxt" value="${param.searchTxt }" />
						</div>
						<div class="Sbar3">
							<input type="button" id="searchBtn" value="검색" />
						</div>
					</form>
				</div>
			</div>
		</div>


	</div>






</body>
</html>