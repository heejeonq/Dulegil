<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/list.css" />
<title>명예의전당</title>
<script type="text/javascript">

$(document).ready(function(){
	
	
	
	calendarInit();
   
	 
	$('#searchTxt').keypress(function(event){
	     if ( event.which == 13 ) {
	         $('#searchBtn').click();
	         return false;
	     }
	});


	
	if("${param.searchGbn}" !=""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	

	$("#searchBtn").on("click",function(){
		
		//신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	})	
	

	$(".content_bst").on("click",".c_box",function(){
		$("#no").val($(this).attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","courseReviewDetail");
		$("#actionForm").submit();
		
	});
	
	//이전달로 이동
	//이전달을 누르면 현재월-1의 값이 월의 값에 담겨야함
	//만약 1월이 되면 다시 12월,년도는 -1
	
		date_value = new Date(); 		
		var dateMonth = date_value.getMonth()+1;
		var dateYear=date_value.getFullYear() // 2013
		
	$('.go-prev').on('click', function() {	//이전달로 이동				
		
		if(dateMonth==1){    // 1월이면
			dateMonth = 12;    //12월로 
			dateYear = dateYear-1 //년도는 -1		 
		}else{                 //아니면		
			dateMonth = dateMonth-1; // 그냥 월 -1
		}	
 
   	 if(dateMonth < 10) {
	    	dateMonth = "0" + dateMonth;
	    }  
	    
	  $('.year-month').html(dateYear + '.' + (dateMonth)); //.YEAR-MONTH에 새로 그려줅
	  	 
	  $("#month").val(dateYear + '.' + (dateMonth));  //#month의 값에 년+월울 넣어줄게	  

		console.log($("#month").val())
		reloadList();
		
	});

	// 다음달로 이동
	$('.go-next').on('click', function() {
		 
		if(dateMonth==12){
			dateMonth = 01;
			dateYear = dateYear+1
		
		}else if( dateMonth == date_value.getMonth()+1 && dateYear==date_value.getFullYear()){
			alert("마지막 페이지입니다");
		}
		else{
		//		
		dateMonth = (dateMonth * 1)+1;
		}	
		console.log(dateMonth);
		console.log(dateYear);
		 if(dateMonth < 10) {
		    	dateMonth = "0" + dateMonth;
		    } 
	
		 $('.year-month').html(dateYear + '.' + (dateMonth)); //.YEAR-MONTH에 새로 그려줅
	  	 
		  $("#month").val(dateYear + '.' + (dateMonth)); 
	  reloadList();
	 
	});
	
});//documen

function calendarInit() {
	
    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    
    var currentYear = date.getFullYear();
    var currentMonth = date.getMonth() + 1;
    
    if(currentMonth < 10) {
    	currentMonth = "0" + currentMonth;
    }
    
    
    $('.year-month').html(currentYear + '.' + currentMonth);

	$("#month").val(currentYear + '.' + currentMonth);
	
	reloadList();
}


 //그리기
    

function reloadList(){
	
	    // 캘린더 렌더링
	
	var params = $("#actionForm").serialize();

	$.ajax({
		url : "BestRevListAjax", //경로
		type : "POST", //전송방식(GET : 주소형태,POST: 주소 헤더)
		dataType : "json",
		data : params,
		success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행
			drawList(res.list);
		},
		error : function(request, status, error) { //실패했을 때 함수 실행
			console.log(request.responseText); //실패 상세내용
		}

	});
	
}

function drawList(list) {
	var html = "";
		
	
	for(var data of list){ // " +  + " 1(내용) 대신 넣자
		
	html += "	<div class=\"c_box\" no=\""+ data.POST_NO + "\">";
	//만약 1등이면 금메달,2등이면 은메달,3등이면 동메달

   if(data.GRNK==1){
		html += "    <img src=\"resources/images/firstMedal.png\" id=\"Medal\" />";
	      html += "   <div class=\"c_b_photo\">";
	      html += "     <img src=\"resources/upload/" + data.B_IMG + "\" id=\"c_photo\" /> ";
	      html += "   </div>";
	         
	   }else if(data.GRNK==2){
		 html += "    <img src=\"resources/images/secondMedal.png\" id=\"Medal\" />";
	      html += "   <div class=\"c_b_photo\">";
	      html += "     <img src=\"resources/upload/" + data.B_IMG + "\" id=\"c_photo\" /> ";
	      html += "   </div>";   
	      
	   }else if(data.GRNK==3){
		 html += "    <img src=\"resources/images/thirdMedal.png\" id=\"Medal\" />";
	      html += "   <div class=\"c_b_photo\">";
	      html += "     <img src=\"resources/upload/" + data.B_IMG + "\" id=\"c_photo\" /> ";
	      html += "   </div>";      
	      
	   }else{
	      html += "   <div class=\"c_b_photo\">";
	      html += "     <img src=\"resources/upload/" + data.B_IMG + "\" id=\"c_photo\" /> ";
	      html += "   </div>";
	   }
	html += "		<div class=\"c_b_lv\">";
	html += "		<div class=\"c_b_like\">";
	html += "			<img src=\"resources/images/좋아요.png\" id=\"good\"/>";
	html += "			<div class=\"c_b_like2\">" + data.GOOD + "</div>";
	html += "		</div>";
	html += "		<div class=\"c_b_views\">";
	html += "		<img src=\"resources/images/viewIcon1.png\" id=\"view\" />";
	html += "		<div class=\"c_b_view2\">" + data.HIT + "</div>			";
	html += "		</div>";
	html += "	</div>";
	html += "	<div class=\"c_b_tit\">" + data.TITLE + " ("+ data.CNT +")"+"</div>";
	html += "	<div class=\"c_b_c\">" +"("+ data.CNT +")" + "</div>";
	html += "	<div class=\"c_b_id\">" + data.NM + "</div>";
	html += "	<div class=\"c_b_coss\">" + data.COURSE_NO + " 코스 : "+ data.COURSE_NM +"</div>";
	html += "	<div class=\"c_b_date\">" + data.DT + "</div>";
	html += "</div>";
	
	}
	
	$(".content_bst").html(html); //내가 받은 html로 갈아 엎어라
	
} 




</script>
</head>
<body>
	<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">명예의 전당</div>
			<div class="col"></div>	
			
			<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
			<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>
					
			<div class="midBox">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="no" id="no"/>
				<input type="hidden" name="month" id="month" /> 
				<input type="hidden" name="sMemNo" id="sMemNo" value="${sMemNo}" />
				
	
			    <!-- <input type="hidden" name="page" id="page" value="${page}" /> -->								
				
				<div class="searchWrap">
					<div class="selBox">
					<select class="sel" name="searchGbn" id="searchGbn">						
						<option value="0">제목</option>
						<option value="1">내용</option>					
						<option value="2">작성자</option>					
						<option value="3">코스</option>
					</select>
					</div>
					<div class="searchBox">
						<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt}" placeholder="검색하기" />					
						<div class="search_ico" >
						<img src="resources/images/search_icon.png" id="searchBtn"/>
						</div>
					</div>
				</div>
				</div>

		          
		         <!--------------------------- 날짜선택 ----------------------------->   
		         	<div class="sec_cal">
					  <div class="cal_nav">
					    <span class="go-prev" id="goPrev">&lt;</span>
					    <div class="year-month" id="bstGal"></div>
					    <span class="go-next" id="goNext">&gt;</span>
					  </div>					  					  
		            </div>
		         

			</form>
			
			<div class="content_bst">
				<div class="c_box">
					<img src="resources/images/firstMedal.png" id="Medal" />
					
					<div class="c_b_photo">
						<img alt="명예의전당" src="resources/images/bestpho.jpg" id="c_photo" />
					</div>
					
					<div class="c_b_lv">
						<div class="c_b_like">
						<img src="resources/images/좋아요.png" id="good"/> 
						<div class="c_b_like2">127</div>
						</div>
					
						<div class="c_b_views">
							<img src="resources/images/viewIcon1.png" id="view" />
							<div class="c_b_view2">3,425</div>				
						</div>
					</div>
					
					<div class="c_b_id">양똥이</div>
					<div class="c_b_tit">서울둘레길 완주</div>
					<div class="c_b_coss">완주</div>
					<div class="c_b_date">작성일 2022-05-10</div>
				</div>
		
		
				<div class="c_box" id="c_box">
					<img src="resources/images/secondMedal.png" id="Medal" />
					<div class="c_b_photo">사진</div>
					
					<div class="c_b_lv">
						<div class="c_b_like">
							<img src="resources/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
						<img src="resources/images/viewIcon1.png" id="view" />
						<div class="c_b_view2">조회수</div>				
						</div>
					</div>
					
					<div class="c_b_id">아이디</div>
					<div class="c_b_tit">제목</div>
					<div class="c_b_coss">코스</div>
					<div class="c_b_date">작성일</div>
				</div>
				
				<div class="c_box">
					<img src="resources/images/thirdMedal.png" id="Medal" />
					<div class="c_b_photo">사진</div>
					<div class="c_b_lv">
						<div class="c_b_like">
							<img src="resources/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="resources/images/viewIcon1.png" id="view" />
							<div class="c_b_view2">조회수</div>				
						</div>
					</div>
					<div class="c_b_id">아이디</div>
					<div class="c_b_tit">제목</div>
					<div class="c_b_coss">코스</div>
					<div class="c_b_date">작성일</div>
				</div>
		
				
	
		
				
	
				
		
			</div>
		</div>
	</div>


	<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>