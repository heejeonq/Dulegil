<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/list.css" />
<link rel="stylesheet" href="resources/css/fonts.css"" />
<title>코스후기목록</title>
<!-- 제이쿼리 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	if("${param.searchGbn}" !=""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	

	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		
		//신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	})	

	
	$("#wriBtn").on("click",function(){
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","courseReviewWrite");
		$("#actionForm").submit();
		
		
	});
	$(".pagination").on("click","span",function(){
		
		//기존검색유지		
		if($("#oldGbn").val() != "") {
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		//전에 입력한 구분과 텍스트를 현재로 데려옴
		}
		
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	$(".content_cosRev").on("click",".c_box",function(){
		$("#no").val($(this).attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","freeBoardDetail");
		$("#actionForm").submit();
		
	});
	
});;//document.ready end

function reloadList(){
	
	var params = $("#actionForm").serialize();

	$.ajax({
		url : "CourseRevListAjax", //경로
		type : "POST", //전송방식(GET : 주소형태,POST: 주소 헤더)
		dataType : "json",
		data : params,
		success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행
			drawList(res.list);
			drawPaging(res.pd);
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
	html += "	<div class=\"c_b_photo\">";
	html += " 	 <img src=\"resources/upload/" + data.B_IMG + "\" id=\"c_photo\" /> ";
	html += "	</div>";
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
	html += "	<div class=\"c_b_tit\">" + data.TITLE + "</div>";
	html += "	<div class=\"c_b_id\">" + data.NM + "</div>";
	html += "	<div class=\"c_b_coss\">" + data.COURSE_NO + " 코스 : "+ data.COURSE_NM +"</div>";
	html += "	<div class=\"c_b_date\">" + data.DT + "</div>";
	html += "</div>";
	
	}
	
	$(".content_cosRev").html(html); //내가 받은 html로 갈아 엎어라
} 
 
function drawPaging(pd){
	var html="";
	
   html += "<span class=\"first_arw\"page=\"1\"><<</span> ";
   if($("#page").val() == "1" ) {
   html += "<span class=\"prev_arw\" page=\"1\" ><</span>   ";
   }else{
	   html += "<span class=\"prev_arw\" page=\"" + ($("#page").val() *1 -1 )+ "\" ><</span>   ";
   }
   for(var i = pd.startP; i<=pd.endP; i++){
	   if($("#page").val() * 1 ==i){//현재페이지라면
		  html += "<span class=\"page_btn_on\" page=\"" + i + "\">" + i + "</span>"   
	   }else{
		  html += "<span class=\"page_btn\" page=\"" + i + "\">" + i + "</span>";	   
	   }	   
   }
   if($("#page").val() * 1 == pd.maxP){ //현재 체이지가 마지막 페이지면...
	   html += "<span class=\"next_arw\" page=\"" + pd.maxP + "\">></span>  ";
   }else{
	   html += "<span class=\"next_arw\"  page=\"" + ($("#page").val() * 1 + 1) + "\">></span>  ";
   }
   
   //마지막 페이지는 마지막 페이지
     html += "<span class=\"end_arw\" page=\"" + pd.maxP + "\">>></span>  ";
     
     $(".pagination").html(html);
   
}

</script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">코스 별 후기</div>
			<div class="col"></div>
			
						
			<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
			<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>
			
			<div class="midBox">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="no" id="no"/>
				<input type="hidden" name="page" id="page" value="${page}" />								
					<c:if test="${!empty sMemNo}">
						<input type="button" class="btn" value="글쓰기" id="wriBtn"/>
					</c:if>
					
				<div class="searchWrap">
				<div class="selBox">
					<select class="sel" name="searchGbn" id="searchGbn">						
						<option value="0">제목</option>
						<option value="1">내용</option>					
						<option value="2">코스</option>					
						<option value="3">아이디</option>
					</select>
				</div>
					<div class="searchBox">
					<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt}" placeholder="검색하기" />					
					<div class="search_ico" >
					<img src="resources/images/search_icon.png" id="searchBtn"/>
					</div>
					</div>
				</div>
        	</form>
				</div>			
<!-- 			<div class="cosSelBox">
         </div> -->

	<div class="content_cosRev">
		<!-- 위로 -->
		
		</div>
		

	  <div class="pagination">
		<!-- 위로올림 -->
      </div>

	</div>
	
		
	</div>
	
</div>





	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>