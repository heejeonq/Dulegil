<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>member manage</title>
<style type="text/css">
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
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.Sbar1 {
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.commentBoxT {
	border: none;
	width: 94%;
	height: 86%;
}

.sel {
	border: none;
	outline: none;
	/*position: absolute;*/
	/* margin: auto; */
	width: 100%;
	height: 100%;
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


</style>
<script type="text/javascript">
$(document).ready(function(){
	
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

	
	// 개별 수정
	$("tbody").on("click", "#update", function() {
		var updateNo= $(this).parent().parent().attr("no");
		$("#no").val(updateNo);	
		console.log($("#no").val());
	
		
		// 바뀐값으로 업데이트하기 1. 속성 값 취득 2. 값 넣기 3. 히든으로 보내기
		var eu = $('input[name=emailUpdate]').val(); 	
		$("#email").val(eu);
		
		// 현재값 취득
		//var emailU = $(this).parent().parent().children(3).children().attr('value');
		//$("#email").val(emailU);

		
		
		makePopup({
			title : "알림",
			contents : "수정하시겠습니까?",
			buttons : [ {
				name : "수정",
				func : function() {
					var params = $("#actionForm").serialize();
					$.ajax({
						url : "adMemAction/update", //경로 주소 새로생기면 컨트롤러 가
						type : "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
						dataType : "json", //
						data : params, //json 으로 보낼데이터
						success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행
							console.log(res);

							switch (res.msg) {

							case "success":
								location.href = "adMemList"
								break;
							case "fail":
								makeAlert("알림", "수정에 실패하였습니다.")
								break;
							case "error":
								makeAlert("알림", "수정 중 문제가 발생하였습니다.")
								break;
							}

						},
						error : function(request, status, error) { //실패했을 때 함수 실행
							console.log(request. responseText); //실패 상세내역
						}

					});
				}
			}, {
				name : "취소"
			} ]
		});
		
		
		
	});

	
}); // document ready end


// 게시글 목록 함수
function drawList(list){
	var html = "";
	
	for(var data of list){
		//"+ +"
	html += "<tr class=\"tr_td\"no=\"" +data.MEMBER_NO +"\">";
	html += "<td>"+ data.MEMBER_NO +"</td>";
	html += "<td>"+ data.AUTHORITY_NO +"</td>";
	html += "<td>"+ data.NM +"</td>";
	//html += "<td>" + data.EMAIL +"</td>";
	html += "<td><input type=\"text\" id=\"emailUpdate\" name=\"emailUpdate\" value=\"" + data.EMAIL +"\"</td>";
	html += "<td>"+ data.PHONE_NO +"</td>";
	html += "<td>"+ data.DATE_BIRTH +"</td>";
	html += "<td>"+ data.GENDER +"</td>";
	html += "<td>"+ data.ADDRESS +"</td>";
	html += "<td>"+ data.SCOURE +"</td>";
	html += "<td>"+ data.CNT +"</td>";
	html += "<td>	<span id=\"update\" name=\"update\" class=\"material-icons-outlined\" style=\"font-size: 14px; cursor: pointer;\"> \edit\ </span>";
	html += "		<span class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span>";
	html += "</td>";
	html += "</tr>";
	}
	
	$("tbody").html(html);
};




	

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
	};
	
	

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adMemAjax",
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
	<!-- 기존 검색 내용 유지용 -->
	<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
	<input type="hidden" id="oldTxt" value="${param.searchTxt}" />

	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<div class="Cname">
			<span class="material-icons" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">manage_accounts </span> 
			회원 관리
		</div>
			</div>


			<div id="hd2_CC">
				<div id="CCbox">
				<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" /> 
				<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />

					<!-- 기존 검색 내용 유지용 --> 
					<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
					<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
					<!-- 검색 부분 -->
					<div id="hd2_search">
					<form action="#" id="actionForm" method="post">
							<input type="hidden" name="no" id="no" value="${param.no}"/> 
							<input type="hidden" name="page" id="page" value="${page}" />
							<input type="hidden" name="email" id="email"value="${param.email}"  />
					
						<div class="Sbar1">
							<select class="sel" name="searchGbn" id="searchGbn">
								<option value="0">회원번호</option>
								<option value="1">아이디</option>
								<option value="2">성별</option>
								<option value="3">주소</option>
								<option value="4">신뢰도</option>
							</select>
						</div>
						<div class="Sbar2">
							<input type="text" class="commentBoxT" name="searchTxt"
									value="${param.searchTxt}" />
						</div>
						<div class="Sbar3">
							<input type="button" id="hdSearch" value="검색" />
						</div>
						</form>
					</div>


					<!-- 테이블 -->
					<table>
						<thead>
							<tr>
								<th colspan="1">회원번호</th>
								<th colspan="1">권한</th>
								<th colspan="1">닉네임</th>
								<th colspan="1">이메일</th>
								<th colspan="1">휴대폰 번호</th>
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