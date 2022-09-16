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
	$(".singo span").on("click", function(){
		if($(this).parent().children(".singo_contents").css("display") == "none"){
			$(this).parent().children(".singo_contents").css("display", "flex");
			//$(".singo_contents").show();		
		}
		else {
			$(this).parent().children(".singo_contents").hide();
		}
		
	});

	function action(flag){
		//con의 <를 웹문자로 변환
		$("#nm").val($("#nm").val().replace(/</gi, "&lt;"));
		//con의 >를 웹문자로 변환
		$("#nm").val($("#nm").val().replace(/>/gi, "&gt;"));
		//Javascript Object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수 있다 
		// 							 Java의 Map에서 get, put 역할
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
	        			//조회 데이터 초기화
	        			$("#page").val("1");
	        			$("#searchGbn").val("0");
	        			$("#searchText").val("");
	        			$("#oldGbn").val("0");
	        			$("#oldText").val("");
	        			break;
	        		case "update" :
	        			//기존값 유지
	        			$("#oldGbn").val($("#searchGbn").val());
	        			$("#oldText").val($("#searchText").val());
	        			//입력내용 초기화
	        			$("#nm").val("");
	        			$("#no").val("");
	        			
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
			drawList(res.list1, res.list2);
		},
		error : function(request, status, error) {
			console.log(request.responseText); //실패 상세 내역
		}
	});
		
		
	}
function drawList(list1, list2){
	var html1 = "";
	var html2 = "";
	
	//동행 신청자 리스트
	for(var data of list1){                                                          
		html1 += "<table class=\"standard\">                                            ";
		html1 += "	<tr>                                                                ";
		html1 += "		<th colspan=\"2\">" + data.COURSE_NO +"코스</th>                                      ";
		html1 += "		<th colspan=\"5\">" + data.TITLE +"</th>                                ";
		html1 += "	</tr>                                                               ";
		html1 += "	<tr>                                                            ";
		html1 += "		<td class=\"mem_img\"><img src=\"resources/upload/" + ${data.IMG_FILE} "\"></td>    ";
		html1 += "		<td class=\"mem_id\">" + data.NM +"</td>                                     ";
		html1 += "		<td class=\"mem_lvl\">" + data.RELIABILITY +"</td>                                      ";
		html1 += "		<td class=\"mem_age\">" + data.AGE +"</td>                                        ";
		html1 += "		<td>" + data.GENDER +"</td>                                                   ";
		html1 += "		<td><input type=\"button\" value=\"수락\" class=\"btn green\">        ";
		html1 += "		<input type=\"button\" value=\"거절\" class=\"btn green\"></td>   ";
		html1 += "		</tr>                                                               ";
		html1 += "</table>";
		
	}
	//채팅 목록
	for(var data of list2){        
		html2 += "<li>" + data.TITLE +"</li>";
		html2 += "<input type=\"button\" value=\"x\">"; 
	}
	
	
	$(".join_mem_list").html(html1);
	$(".join_mem_list").html(html1);
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
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
					</ul>
				</div>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>내가 신청한 동행</span></div>
					<table class="standard">
						<tbody>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>ID</th>
								<th>상태</th>
								<th>신청 일자</th>
							</tr>
							<tr>
								<td>1</td>
								<td>1코스</td>
								<td>수락산 둘레길 동행해요</td>
								<td>gmlwjd123</td>
								<td>신청중</td>
								<td>2022.07.01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 history</span></div>
					<table class="standard">
						<tbody>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>동행자들</th>
								<th>동행 일자</th>
							</tr>
							<tr>
								<td>1</td>
								<td>4코스</td>
								<td>동행 해요</td>
								<td>tmfdk123, tndud123, tldnjs123, auddn123</td>
								<td>2022.03.01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 상대 평가</span></div>
					<table class="mem_rate">
						<tr>
							<th colspan="6"  class=join_title>같이 둘레길1</th>
						</tr>
						<tr>
							<td rowspan="2" id="mem_img"><img src="resources/images/sample1.jpg"></td>
							<td id="mem_id" class="item">에디님</td>
							<td></td>
							<td></td>
							<td></td>
							<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱" name="singo">성희롱</label>
										<label><input type="radio" value="욕설" name="singo">욕설</label>
										<label><input type="radio" value="악의적 비방" name="singo">악의적</label>
										<label><input type="radio" value="스팸(광고)" name="singo">스팸(광고)</label>
										<label><input type="radio" value="기타" name="singo">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="startRadio">
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 1개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 2개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 3개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 4개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
									</label>
								</div>
							</td>
							<td><input type="button" value="완료" class="btn green"></td>
							<td></td>
							<td></td>
						</tr>
				</table>
					<table class="mem_rate">
							<tr>
								<th colspan="6"  class=join_title>같이 둘레길2</th>
							</tr>
							<tr>
								<td rowspan="2" id="mem_img"><img src="../css/images/sample2.jpg"></td>
								<td id="mem_id" class="item">뽀로로님</td>
								<td></td>
								<td></td>
								<td></td>
								<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱">성희롱</label>
										<label><input type="radio" value="욕설">욕설</label>
										<label><input type="radio" value="악의적 비방">악의적</label>
										<label><input type="radio" value="스팸(광고)">스팸(광고)</label>
										<label><input type="radio" value="기타">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="startRadio">
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
										</label>
									</div>
								</td>
								<td><input type="button" value="완료" class="btn green"></td>
								<td></td>
								<td></td>
							</tr>	
							<tr>
								<td rowspan="2" id="mem_img"><img src="../css/images/sample3.png"></td>
								<td id="mem_id" class="item">루피님</td>
								<td></td>
								<td></td>
								<td></td>
								<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱">성희롱</label>
										<label><input type="radio" value="욕설">욕설</label>
										<label><input type="radio" value="악의적 비방">악의적</label>
										<label><input type="radio" value="스팸(광고)">스팸(광고)</label>
										<label><input type="radio" value="기타">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="startRadio">
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
										</label>
									</div>
								</td>
								<td><input type="button" value="완료" class="btn green"></td>
								<td></td>
								<td></td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>