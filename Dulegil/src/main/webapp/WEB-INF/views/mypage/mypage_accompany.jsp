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
	
	
	
	//신고하기
	$("#memRate").on("click", ".singo img", function(){
	
		if($(this).parent().children(".singo_contents").css("display") == "none"){
			$(this).parent().children(".singo_contents").css("display", "flex");
			//$(".singo_contents").show();		
		}
		else {
			$(this).parent().children(".singo_contents").hide();
		}
		
	});
	
	$(".join_mem_list").on("click", "#acceptBtn" , function(){
		("#stateNo").val(2);
		
	
		
		action("update");
	});
	$("#rejectBtn").on("click", function(){
		
	});

	function action(flag){

		 var params = $("#actionForm").serialize();
	     
	     $.ajax({
	        url:"categoryAction/" + flag, 
	        type:"POST", 
	        dataType:"json", 
	        data : params,
	        success: function(res) { 
	        	switch(res.msg) {
	        	case "success" : 
	        		//내용 초기화
	        		$("#con").val("");
	        		$("#no").val("");
	        		
	        		//목록 재조회
	        		switch(flag){
	        		case "insert" : 
	        			break;
	        		case "delete" :
	        		
	        
	        			break;
	        		case "update" :
	        			//기존값 유지
	        		
	        			
	        			$(".insert").show();
	        			$(".update").hide();
	        			break;
	        		}
	        		reloadList();
	        		break;
	        	
	        	case "fail" :  makeAlert("알림", msg[flag] + "에 실패하였습니다.");
	    			break;
	    		
	     		case "error" : makeAlert("알림", msg[flag] + " 중 문제가 발생하였습니다.");
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
		html1 += "<table class=\"standard\">                                            ";
		html1 += "<form action=\"#\" id=\"actionForm\">";
		html1 += "<input type=\"hidden\" name=\"postNo\" value=\"" + data.POST_NO + "\"> ";
		html1 += "<input type=\"hidden\" name=\"memNo\" value=\"" + data.MEMBER_NO + "\"> ";
		html1 += "<input type=\"hidden\" name=\"stateNo\" id=\"stateNo\"> ";
		html1 += "</form>";
		html1 += "	<tr>                                                                ";
		html1 += "		<th colspan=\"2\">" + data.COURSE_NO +"코스</th>                                      ";
		html1 += "		<th colspan=\"5\">" + data.TITLE +"</th>                                ";
		html1 += "	</tr>                                                               ";
		html1 += "	<tr>                                                              ";
		html1 += "		<td class=\"mem_img\"><img src=\"resources/upload/" + ${data.IMG_FILE} "\"></td>    ";
		html1 += "		<td class=\"mem_id\">" + data.NM +"</td>                                     ";
		html1 += "		<td class=\"mem_lvl\">" + data.RELIABILITY +"</td>                                      ";
		html1 += "		<td class=\"mem_age\">" + data.AGE +"</td>                                        ";
		html1 += "		<td>" + data.GENDER +"</td>                                                   ";
		html1 += "		<td><input type=\"button\" value=\"수락\" class=\"btn green\" id=\"acceptBtn\">        ";
		html1 += "		<input type=\"button\" value=\"거절\" class=\"btn green\" id=\"rejectBtn\"></td>   ";
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
		html5 += "<colgroup>";
		html5 += "	<col width=\"10%\">";
		html5 += "	<col width=\"10%\">";
		html5 += "	<col width=\"10%\">";
		html5 += "	<col width=\"10%\">";
		html5 += "	<col width=\"15%\">";
		html5 += "	<col width=\"15%\">";
		html5 += "</colgroup>";
		html5 += "<tbody class=\"postNo" + data.POST_NO + "\">";
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
		html1 += data.NM + ", ";
	}
	
	//신뢰도평가멤버 리스트
	for(var data of memList){  
		html2 += "	<tr>                                                                                         ";
		html2 += "		<td rowspan=\"2\" class=\"mem_img\"><img src=\"resources/upload/" + data.IMG_FILE + "\"></td>                  ";
		html2 += "		<td id=\"mem_id\" class=\"item\">" + data.NM +"</td>                                               ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td class=\"singo\"><img src=\"resources/images/detailViewIcon.png\" />                                                       ";
		html2 += "			<div class=\"singo_contents\">                                                         ";
		html2 += "				<label><input type=\"radio\" value=\"성희롱\">성희롱</label>                         ";
		html2 += "				<label><input type=\"radio\" value=\"욕설\">욕설</label>                             ";
		html2 += "				<label><input type=\"radio\" value=\"악의적 비방\">악의적</label>                    ";
		html2 += "				<label><input type=\"radio\" value=\"스팸(광고)\">스팸(광고)</label>                 ";
		html2 += "				<label><input type=\"radio\" value=\"기타\">기타</label>                             ";
		html2 += "				<input type=\"button\" value=\"신고\">                                               ";
		html2 += "			</div>                                                                               ";
		html2 += "		</td>                                                                                    ";
		html2 += "	</tr>                                                                                        ";
		html2 += "	<tr>                                                                                         ";
		html2 += "		<td colspan=\"2\">                                                                         ";
		html2 += "			<div class=\"startRadio\">                                                             ";
		html2 += "				<label class=\"startRadio__box\">                                                  ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 1개</span></span>       ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                  ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 1.5개</span></span>     ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 2개</span></span>       ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 2.5개</span></span>     ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 3개</span></span>       ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 3.5개</span></span>     ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 4개</span></span>       ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 4.5개</span></span>     ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 5개</span></span>       ";
		html2 += "				</label>                                                                         ";
		html2 += "				<label class=\"startRadio__box\">                                                   ";
		html2 += "					<input type=\"radio\" name=\"star\">                                       ";
		html2 += "					<span class=\"startRadio__img\"><span class=\"blind\">별 5.5개</span></span>     ";
		html2 += "				</label>                                                                         ";
		html2 += "			</div>                                                                               ";
		html2 += "		</td>                                                                                    ";
		html2 += "		<td><input type=\"button\" value=\"완료\" class=\"btn green\"></td>                            ";
		html2 += "		<td></td>                                                                                ";
		html2 += "		<td></td>                                                                                ";
		html2 += "	</tr>";	
	}
	
	$(".historyNo" + data.POST_NO).html(html1);
	$(".postNo" + data.POST_NO).append(html2);
}
});

</script>
</head>
<body>
<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-mypage">

		<jsp:include page="mypage_tab.jsp"></jsp:include>
					
		<!-- Contents -->
		<div class="contents">
			<form action="#" id="searchForm">
			<input type="hidden" name="memNo">
			<input type="hidden" name="postNo" id="postNo">
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
					<table class="standard">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="45%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
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
					<table class="standard">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="45%">
							<col width="20%">
							<col width="15%">
						</colgroup>
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