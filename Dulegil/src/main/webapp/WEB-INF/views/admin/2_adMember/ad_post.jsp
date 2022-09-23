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
<title>member manage</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">
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
	width: 1000px;
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

th {
	width: 131px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}

th:nth-child(5) {
	width: 45%;
}

td {
	font-size: small;
	border-bottom: solid 0.5px #ebebeb;
	padding: 8px;
	line-height: 0;
}

/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%;
	text-align: right;
}



/*
.wrap{
	width: 965px;
	height: 95%;
    margin: auto;
    position:relative;
}
*/

/* 페이징 */

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
	margin-right: 11px;
	display: inline-block;
	border: none;
	font-size: 12px;
}

.pBtn {
	border: none;
	font-size: 12px;
	background-color: white;
	display: inline-box;
}
.pBtn_GD {
	border: none;
	font-size: 12px;
	background-color: #ECECEC;
	display: inline-box;
}

.pBtn:hover {
	background-color: #ECECEC;
}
.sel {
	border: none;
	outline: none;
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
		location.href = "adMemRep";
	});
	
	// 메뉴 - 게시물 관리
	$("#memPostBtn").on("click", function() {
		location.href = "adPostList";
	});
	
	// 메뉴 - 댓글 관리
	$("#memCmtBtn").on("click", function() {
		location.href = "adCmtList";
	});
	
	
	
	
	// 목록 구분 설정
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}	
	reloadList();
	
	// 검색 버튼 클릭시
	$("#hdSearch").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	
	// 페이징 버튼
	$("#hd2_paging").on("click", ".pBtn", function(){
			// 기존 검색상태 유지
			$("#searchGbn").val($("#oldGbn").val());
			$("#searchTxt").val($("#oldTxt").val());
			
			$("#page").val($(this).attr("page"));
			reloadList();		
		});

	
	
	
	// thead 체크박스
	$("thead").on("click", "#allCheck", function(){
		if($(this).is(":checked")){
			$("tbody #Check").prop("checked", true);
		}else{
			$("tbody #Check").prop("checked", false);			
		}
		
		var arr = [];
		$("tbody #Check:checked").each(function(){
			arr.push($(this).val());
		});
		
		$("#no").val(arr);
	});	
	
	
	// tbody 체크박스
	$("tbody").on("click", "#Check", function(){
		var arr = [];
		
		$("tbody #Check:checked").each(function(){
			arr.push($(this).val());
		});
		
		if(arr.length == $("tbody #Check").length){
			$("thead #allChecked", true)
		}else{
			$("thead #allCheck").prop("checked", false);
		}
			// arr에 체크된 곳에 no 값을 넣어줌
			$("#no").val(arr);		
	});
	
	
	
	// 체크박스 삭제
	$("#deleteBtn").on("click", function(){
		var arr = [];
		
		
		// 내가 체크박스에 값 1 넣어놔서 tr의 no 취득하기
		$("tbody #Check:checked").each(function(){
			arr.push($(this).parent().parent().attr("no"));
		});
		console.log(arr);
		$("#delNo").val(arr);
		
		if(arr.length == ""){
			makeAlert("알림", "삭제할 공지사항을 선택해주세요.");
		}else{
			makePopup({
				title : "알림",
				contents : "삭제 하시겠습니까?",
				buttons	: [{
					name : "삭제",
					func : function(){
						// serialize() : 해당 내용물들 중 값 전달이 가능한 것들을 전송 가능한 문자 형태로 전환.
						var params = $("#actionForm").serialize();
						console.log(params);
						$.ajax({
							url : "adPostAction/delete",
							type :"POST",
							dataType :"json",
							data : params,
							success : function(res){
								// 성공했을 때 결과를 res에 받고 함수 실행
								
								switch(res.msg){
								case "success" :
									reloadList();
									break;
								case "fail" :
									makeAlert("알림", "삭제에 실패했습니다.")
									break;
								case "exception" :
									makeAlert("알림", "삭제 중 문제가 발생했습니다.")
									break;
								}
							},
							error : function(request, status, error){
								console.log(request.responseText);
								
							}
						});
						
						closePopup();
					}
				},{
					name : "취소"
				}]	
			})
		}
	});
	
	
	
	// 개별 삭제
	$("tbody").on("click","#delBtn", function(){
		var del = $(this).parent().parent().attr("no");
		$("#no").val(del);
		console.log(del);
		
		makePopup({
			title : "알림",
			contents : "삭제 하시겠습니까?",
			buttons	: [{
				name : "삭제",
				func : function(){
					// serialize() : 해당 내용물들 중 값 전달이 가능한 것들을 전송 가능한 문자 형태로 전환.
					var params = $("#actionForm").serialize();
					console.log(params);
					$.ajax({
						url : "adPostAction/del",
						type :"POST",
						dataType :"json",
						data : params,
						success : function(res){
							// 성공했을 때 결과를 res에 받고 함수 실행
							
							switch(res.msg){
							case "success" :
								reloadList();
								break;
							case "fail" :
								makeAlert("알림", "삭제에 실패했습니다.")
								break;
							case "exception" :
								makeAlert("알림", "삭제 중 문제가 발생했습니다.")
								break;
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
							
						}
					});
					
					closePopup();
				}
			},{
				name : "취소"
			}]	
		})
		
	});
	
	
}); // document ready end







// 게시글 그리기
function drawList(list){
	var html ="";
	
	for(var data of list){
		
		// "+ +"
		html += "<tr no=\"" +data.POST_NO +"\">";
		html += "<td colspan=\"1\"><input type=\"checkbox\" id=\"Check\" name=\"Check\"/></td>";
		html += "<td colspan=\"1\">"+ data.MEMBER_NO +"</td>";
		
		// 게시판 벨류 0,1,2 일때 이름 도출하는거 하기 
		html += "<td colspan=\"1\">"+ data.BLTNBOARD_NO +"</td>";
		html += "<td colspan=\"5\">"+ data.NM +"</td>";
		html += "<td colspan=\"1\">"+ data.TITLE +"</td>";
		html += "<td colspan=\"1\">"+ data.REG_DT +"</td>";
		html += "<td colspan=\"2\"><span id=\"delBtn\" name=\"delBtn\" class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span></td>";
		html += "</tr>                                                                                                           ";
	}
	
	$("tbody").html(html);
};// drawList end


function drawPaging(pd){
	var html = "";
	// " + + " 복사
	
	// 처음
	html += "<div id=\"pBtn\">";
	html += "<input type=\"button\" page=\"1\" value=\"<<\" class=\"pBtn\" />";
	html += "</div>";
	
	//이전
	if($("#page").val()=="1"){		
		html += "<div id=\"pBtn\">";
		html += "<input type=\"button\" page=\"1\" value=\"<\" class=\"pBtn\" />";
		html += "</div>";
		
	} else{
		html += "<div id=\"pBtn\">";
		html += "<input type=\"button\" page=\"" + ($("#page").val() * 1 - 1 ) + "\" value=\"<\" class=\"pBtn\" />";
		html += "</div>";
	}
	
	// 현재 페이지
	for(var i = pd.startP; i<=pd.endP; i++){
		if($("#page").val() * 1 == i){
			html += "<div id=\"pBtn_GD\">";
			html += "<input type=\"button\" page=\"" + i + "\" value=\"" + i + "\" class=\"pBtn_GD\" />";
			html += "</div>";		
		}else{
			html += "<div id=\"pBtn\">";
			html += "<input type=\"button\" page=\"" + i + "\" value=\"" + i + "\" class=\"pBtn\" />";
			html += "</div>";	
			
		}
	}
		
	
	// 다음
	if($("#page").val() * 1 == pd.maxP){
		html += "<div id=\"pBtn\">";
		html += "<input type=\"button\" page=\"" + pd.maxP + "\" value=\">\" class=\"pBtn\" />";
		html += "</div>";	
	}else{
		html += "<div id=\"pBtn\">";
		html += "<input type=\"button\" page=\"" + ($("#page").val() * 1 + 1) + "\" value=\">\" class=\"pBtn\" />";
		html += "</div>";	
	}
	
	// 끝
	html += "<div id=\"pBtn\">";
	html += "<input type=\"button\" page=\"" + pd.maxP + "\" value=\">>\" class=\"pBtn\" />";
	html += "</div>";
	
	$("#hd2_paging").html(html);
};// paging end


function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adPostAjax",
		type: "POST",
		dataType: "json",
		data : params,
		success : function(res){
			drawList(res.list);
			drawPaging(res.pd);
			console.log(res);
		},
		error : function(request, status, error){
			console.log(request.responseText);
			
		}
		
		
	});
	
}; // reloadList end



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
			<div id="hd2_Cname">
				<div id="Cname_box">
					<span class="material-symbols-outlined"
						style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
						edit_note </span>게시물관리
				</div>
			</div>


			<div id="hd2_CC">
				<div id="CCbox">
					<!-- 검색 구분, 검색어 보내기 -->
					<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn }"/>
					<input type="hidden" id="searchGbn2" name="searchGbn2" value="${param.searchGbn2 }"/>
					<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt }"/>

					<!-- 기존 검색 내용 유지용 -->
					
					
					
					<!-- 검색 부분 -->
					<div id="hd2_search">
					<form action="#" id="actionForm" method="post">
						<input type="hidden" name="no" id="no"/>
						<input type="hidden" id="delNo" name="delNo"/><!-- 목록 체크박스 삭제 -->
						<input type="hidden" name="page" id="page" value="${page}"/>

						<div class="Sbar1" >
							<select class="sel" name="searchGbn" id="searchGbn">
								<option value="0">코스별 평가</option>
								<option value="1">동행 구하기</option>
								<option value="2">자유게시판</option>
							</select>
						</div>

						<div class="Sbar11">
							<select class="sel" name="searchGbn2" id="searchGbn2">
								<option value="0">회원번호</option>
								<option value="1">글번호</option>
								<option value="2">아이디</option>
								<option value="3">제목</option>
							</select>
						</div>
						<div class="Sbar2">
							<input type="text" class="commentBoxT" name="searchTxt" value="${param.searchTxt}"/>
						</div>
						<div class="Sbar3">
							<input type="button" id="hdSearch" value="검색" />
						</div>
						
					</div>



					<!-- 테이블 -->
					<table>
						<thead>
							<tr>
								<th colspan="1"><input type="checkbox" id="allCheck" name="allCheck"/></th>
								<th colspan="1">회원번호</th>
								<th colspan="1">카테고리</th>
								<th colspan="1">아이디</th>
								<th colspan="5">제목</th>
								<th colspan="1">날짜</th>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<!-- 작성 삭제 버튼 -->
					<div id="write">
						<input type="button" value="삭제" class="delBtn" id="deleteBtn" />
					</div>
				</div>
				</form>
				<!-- ccbox -->





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