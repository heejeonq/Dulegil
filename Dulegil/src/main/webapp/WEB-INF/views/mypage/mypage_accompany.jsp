<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>동행</title>
<script>
$(document).ready(function(){
	reloadList();
	
	//별점 그리기
	$("#memRate").on("change", ".star input", function(){
		$(this).parent().children().eq(0).css("width", $(this).val()*20 + "%");
		console.log($(this).val());
	})
	//별점 주기
	$("#memRate").on("click","#confirmBtn" , function(){
		let amemNo = $(this).parent().parent().attr("amemNo");
		let postNo = $(this).parent().parent().parent().attr("postNo");
		let rateValue = $(this).parent().parent().children().eq(0).children().eq(0).children().eq(0).children().eq(1).val();
		$("#applyMemNo").val(amemNo);
		$("#applyPostNo").val(postNo);
		$("#rateValue").val(rateValue);
		
		action("rateUpdate");
	});
	//신고하기
	$("#memRate").on("click", ".singo img", function(){
		
		if($(this).parent().children(".singo_contents").css("display") == "none"){
			$(".singo_contents").css("display", "none");
			$(this).parent().children(".singo_contents").css("display", "flex");
			//$(".singo_contents").show();		
		}
		else {
			$(this).parent().children(".singo_contents").css("display", "none");
		}
		
	});
	$("#memRate").on("click", "#reportBtn", function(){
		let amemNo = $(this).parent().parent().parent().children().eq(1).attr("amemNo");
		let amemNm = $(this).parent().parent().parent().children().eq(1).attr("amemNm");
		let reportNo = $('input[name="report"]:checked').val();
		console.log()
		$("#applyMemNo").val(amemNo);
		$("#applyMemNm").val(amemNm);
		$("#reportTypeNo").val(reportNo);
		if (reportNo == null) {
            makeAlert("알림", "신고내용을 선택하세요.", function() {
            });
		 }
		else{
			if($("#reportTypeNo").val() == "5"){
				reportText();
			}
			else{
				action("report");			
			}
			$(".singo_contents").css("display", "none");
			
		}

		
	});
	
	//동행 신청자 수락 버튼 클릭시 
	$(".join_mem_list").on("click", "#acceptBtn" , function(){
		
		var amemNo = $(this).parent().parent().attr("amemNo");
		var postNo = $(this).parent().parent().attr("postNo");
		$("#applyMemNo").val(amemNo);
		$("#applyPostNo").val(postNo);
		$("#stateNo").val(2);


		action("applyMemUpdate");
	});
	//거절 버튼 클릭시
	$(".join_mem_list").on("click", "#rejectBtn" , function(){
		var amemNo = $(this).parent().parent().attr("amemNo");
		var postNo = $(this).parent().parent().attr("postNo");
		$("#applyMemNo").val(amemNo);
		$("#applyPostNo").val(postNo);
		
		$("#stateNo").val(0);
		action("applyMemUpdate");
	});
	
	
	
});
function reportText() {
	html = "";
	
	html += "			<table class=\"board_detail_table\">  		";
	html += "				<tbody>                                                                   			";
	html += "				<tr>                                                                  			";
	html += "					<th class=\"popup_th\">신고 내용을 입력하세요</th>                                                      			";
	html += "				</tr>                                                                  			";
	html += "				<tr>                                                                  			";
	html += "					<td>";
	html += "					<textarea rows=\"4\" cols=\"35\" name=\"descript\" id=\"descript\"></textarea>";
	html += "					</td>    ";
	html += "				</tr>                                                                  			";
	html += "				</tbody>                                                                  			";
	html += "			</table>";
	
		makePopup({
			depth : 1,
			width : 300,
			height : 200,
			bg : true,
			bgClose : false,
			title : "신고하기 기타사유",
			contents : html,
			draggable : false,
			buttons : [{
				name : "신고하기",
				func:function() {
					console.log("기타사유 쓰기");
					$("#reportContents").val($("#descript").val());
					console.log($("#reportContents").val());
					
					if ($.trim($("#descript").val()) == "") {
			             makeAlert("알림", "내용을 입력하세요.", function() {
			                $("#descript").focus();
			             });
					 }
					 else{
						action("report");
						closePopup();
						 
					 }
				}
			}, {
				name : "취소"
			}]
		});
}
function action(flag){

		 var params = $("#actionForm").serialize();
	     console.log(params);

	     $.ajax({
	        url:"accompanyAjax/" + flag, 
	        type:"POST", 
	        dataType:"json", 
	        data : params,
	        success: function(res) { 
	        	switch(res.msg) {
	        	case "success" : 
					
	        		reloadList();
	        		break;
	        	case "fail" :
	        		if(flag == "report"){
	        			 makeAlert("알림",  "이미 신고한 회원입니다.");
	        		}
	        		else {
	        			  makeAlert("알림",  "에 실패하였습니다.");
	        		}
	    			break;
	    		
	     		case "error" : makeAlert("알림", " 중 문제가 발생하였습니다.");
	 				break;
	 			}
	           
	        }, 
	        error: function(request, status, error) { 
	           console.log(request.responseText); 
	           
	        }
	     });// Ajax End
	} 
function reloadList() {
	var params = $("#searchForm").serialize();
	
	console.log(params);
	$.ajax({
		url : "accompanyList", //경로
		type : "POST", //전송방식
		dataType : "json", //데이터 형태
		data : params, //보낼 데이터
		success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
			drawList(res.list1, res.list2, res.list3, res.list4, res.list5);
		},
		error : function(request, status, error) {
			console.log(request.responseText); //실패 상세 내역
		}
	});
		
		
}
function reloadList2() {
	var params = $("#searchForm").serialize();
	
	console.log(params);
	$.ajax({
		url : "accompanyMemList", //경로
		type : "POST", //전송방식
		dataType : "json", //데이터 형태
		data : params, //보낼 데이터
		success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
			drawList2(res.memList);
		},
		error : function(request, status, error) {
			console.log(request.responseText); //실패 상세 내역
		}
	});
		
		
}

function drawList(list1, list2, list3, list4, list5){
	var html1 = "";
	var html2 = "";
	var html3 = "";
	var html4 = "";
	var html5 = "";

	

	
	//동행 신청자 리스트
	for(var data of list1){                                                          
		html1 += "<table class=\"standard c\">                                            ";
		html1 += "	<tr>                                                                ";
		html1 += "		<th>" + data.COURSE_NO +"코스</th>                                      ";
		html1 += "		<th colspan=\"5\">" + data.TITLE +"</th>                                ";
		html1 += "	</tr>                                                               ";
		html1 += "	<tr amemNo=\"" + data.MEM_NO + "\" postNo=\"" + data.POST_NO + "\">                                                              ";
		html1 += "		<td class=\"mem_img\"><img src=\"resources/upload/" + data.IMG_FILE + "\"></td>    ";
		html1 += "		<td class=\"mem_id\">" + data.NM +"</td>                                     ";
		html1 += "		<td class=\"mem_lvl\">" + data.RELIABILITY +"</td>                                      ";
		if(data.PUBLIC_AGE == 0){
			html1 += "		<td class=\"mem_age\">" + data.AGE +"세</td>                                        ";			
		}
		else {
			html1 += "		<td class=\"mem_age\">나이 비공개</td>                                        ";			
		}
		if(data.PUBLIC_GENGER == 0){
			html1 += "		<td>" + data.GENDER +"</td>                                                   ";
		}
		else {
			html1 += "		<td class=\"mem_age\">성별 비공개</td>                                        ";			
		}
		//stateno가 2일때 수락버튼 비활성화 0일때 거절 버튼 비활성화
		if(data.STATE_NO == 2){
			html1 += "		<td><input type=\"button\" value=\"수락\" class=\"btn green\" id=\"acceptBtn\" disabled=\"disabled\">        ";
			html1 += "		<input type=\"button\" value=\"거절\" class=\"btn green\" id=\"rejectBtn\"></td>   ";
		}	
		else if(data.STATE_NO == 0) {
			html1 += "		<td><input type=\"button\" value=\"수락\" class=\"btn green\" id=\"acceptBtn\">        ";
			html1 += "		<input type=\"button\" value=\"거절\" class=\"btn green\" id=\"rejectBtn\" disabled=\"disabled\"></td>   ";
			
		}
		else {
			html1 += "		<td><input type=\"button\" value=\"수락\" class=\"btn green\" id=\"acceptBtn\">        ";
			html1 += "		<input type=\"button\" value=\"거절\" class=\"btn green\" id=\"rejectBtn\"></td>   ";
			
		}
		html1 += "		</tr>                                                               ";
		html1 += "</table>";
	
	}
	//채팅 목록
	for(var data of list2){        
		html2 += "<li>" + data.TITLE +"</li>";
		html2 += "<input type=\"button\" value=\"x\">"; 
	}
	//나의 동행 신청목록
	for(var data of list3){  
		html3 += "<tr>";
		html3 += "<td>" + data.POST_NO +"</td>                            ";
		html3 += "<td>" + data.COURSE_NO +"코스</td>                         ";
		html3 += "<td>" + data.TITLE +"</td>        ";
		html3 += "<td>" + data.NM +"</td>                     ";
		if(data.STATE_NO == 0){
			html3 += "<td>거절</td>                        ";
			
		}else if(data.STATE_NO == 1){
			html3 += "<td>대기</td>                        ";
		}else{
			html3 += "<td>수락</td>                        ";
		}
		html3 += "<td>" + data.REG_DT +"</td>                    ";
		html3 += "</tr>";
	}
	
	//동행 히스토리
	for(var data of list4){       
	
		html4 += "<tr>";
		html4 += "<td>" + data.POST_NO +"</td>                            ";
		html4 += "<td>" + data.COURSE_NO +"코스</td>                         ";
		html4 += "<td>" + data.TITLE +"</td>        ";
	
		$("#postNo").val(data.POST_NO);
		reloadList2();
		
		html4 += "<td class=\"historyNo" + data.POST_NO + "\"></td>                     ";	
		html4 += "<td>" + data.ACCOMPANY_DT +"</td>                    ";
		html4 += "</tr>";
	}
	
	//동행 상대평가
	
	for(var data of list4){  
		html5 += "<table class=\"mem_rate\">";
		html5 += "<tbody class=\"postNo" + data.POST_NO + "\" postNo=\"" + data.POST_NO + "\">";
		html5 += "	<tr>                                                                                     ";
		html5 += "		<th class=join_title>" + data.POST_NO +"</th>                                      ";
		html5 += "		<th class=join_title>" + data.COURSE_NO +"코스</th>                                      ";
		html5 += "		<th colspan=\"3\"  class=join_title>" + data.TITLE +"</th>                                      ";
		html5 += "		<th class=join_title>" + data.ACCOMPANY_DT +"</th>                                      ";
		html5 += "	</tr>                                                                                        ";
		html5 += "</tbody>";
		html5 += "</table>";
		
	}
		
	$(".join_mem_list").html(html1);
	$(".chat_list").html(html2);
	$(".myApply").html(html3);
	$(".accompanyHistory").html(html4);
	$("#memRate").html(html5);
}

function drawList2(memList){
	var html1 = ""; 
	var html2 = "";
	
	//동행 히스토리의 동행자들
	for(var data of memList){  
		html1 += data.NM + " ";
	}
	
	//신뢰도평가멤버 리스트
	for(var data of memList){  
		html2 += "	<tr>                                                                                         ";
		html2 += "		<td rowspan=\"2\" class=\"mem_img\"><img src=\"resources/upload/" + data.IMG_FILE + "\"></td>                  ";
		html2 += "		<td id=\"mem_id\" class=\"item\" amemNo=\"" + data.MEMBER_NO+ "\" amemNm=\"" + data.NM+ "\">" + data.NM +"</td>                                               ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td class=\"singo\"><img src=\"resources/images/detailViewIcon.png\" />                                                       ";
		html2 += "			<div class=\"singo_contents\">                                                         ";
		html2 += "				<label><input type=\"radio\" value=\"1\" name=\"report\" value=\"성희롱\">성희롱</label>                         ";
		html2 += "				<label><input type=\"radio\" value=\"2\" name=\"report\" value=\"욕설\">욕설</label>                             ";
		html2 += "				<label><input type=\"radio\" value=\"3\" name=\"report\" value=\"악의적 비방\">악의적</label>                    ";
		html2 += "				<label><input type=\"radio\" value=\"4\" name=\"report\" value=\"스팸(광고)\">스팸(광고)</label>                 ";
		html2 += "				<label><input type=\"radio\" value=\"5\" name=\"report\" value=\"기타\">기타</label>                             ";
		html2 += "				<input type=\"button\" value=\"신고\" id=\"reportBtn\">                                               ";
		html2 += "			</div>                                                                               ";
		html2 += "		</td>                                                                                    ";
		html2 += "	</tr>                                                                                        ";
		html2 += "	<tr>                                                                                         ";
		html2 += "		<td colspan=\"2\">                                                                         ";
		html2 += "			<div class=\"startRadio\">                                                             ";
		html2 += "				<span class=\"star\">★★★★★															";
		html2 += "					<span>★★★★★</span>";
		if(data.SCOURE != null){
			html2 += "					<input type=\"range\"  value=\"" + data.SCOURE+ "\" step=\"0.5\" min=\"0\" max=\"5\" class=\"q\"disabled=\"disabled\" >";
			html2 += "				</span>";
			html2 += "			</div>                                                                               ";
			html2 += "		</td>                                                                                    ";
			html2 += "		<td><input type=\"button\" value=\"완료\" class=\"btn green\" id=\"confirmBtn\" disabled=\"disabled\"></td>                            ";
		} 
		else {
			html2 += "					<input type=\"range\"  value=\"0\" step=\"0.5\" min=\"0\" max=\"5\" class=\"q\">";
			html2 += "				</span>";
			html2 += "			</div>                                                                               ";
			html2 += "		</td>                                                                                    ";
			html2 += "		<td><input type=\"button\" value=\"완료\" class=\"btn green\" id=\"confirmBtn\"></td>                            ";
		}
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "	</tr>";	

	}
	
	$(".historyNo" + data.POST_NO).html(html1);
	$(".postNo" + data.POST_NO).append(html2);
	
	$("input[type='range']").each(function() {
		$(this).parent().children("span").css("width", $(this).val() * 20 + "%");
	});
}





</script>
</head>
<body>
<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-mypage">

		<jsp:include page="mypage_tab.jsp"></jsp:include>
					
		<!-- Contents -->
		<div class="contents">
			<form action="#" id="searchForm">
				<input type="hidden" name="memNo">
				<input type="hidden" name="postNo" id="postNo">
			</form>
			<form action="#" id="actionForm">
				<input type="hidden" name="memNo">
				<input type="hidden" name="amemNo" id="applyMemNo">
				<input type="hidden" name="amemNm" id="applyMemNm">
				<input type="hidden" name="postNo" id="applyPostNo">
				<input type="hidden" name="stateNo" id="stateNo">
				<input type="hidden" name="rate" id="rateValue">
				<input type="hidden" name ="reportTypeNo" id="reportTypeNo">
				<input type="hidden" name ="reportContents" id="reportContents">
			</form>

			<div class="mypage_contents">
				<div class="mypage_area1">
			
					<div class="area_tit"><span>신청자 목록</span></div>
					<div class="join_mem_list">
					
					</div>
				</div>
					<div class="mypage_area1">
					<div class="area_tit"><span>채팅 목록</span></div>
				<div class="chat_list">
					<ul class="standard">
						
					</ul>
				</div>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>내가 신청한 동행</span></div>
					<table class="standard a">
				
						<thead>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>ID</th>
								<th>상태</th>
								<th>신청 일자</th>
							</tr>
						</thead>
						<tbody class = "myApply">
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 history</span></div>
					<table class="standard b">
				
						<thead>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>동행자들</th>
								<th>동행 일자</th>
							</tr>
						</thead>
						<tbody class = "accompanyHistory">
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 상대 평가</span></div>
					<div id="memRate">
					
					</div>
					
				</div>
			</div>
		</div>
	</div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>