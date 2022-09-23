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
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>자유게시판목록</title>
<!-- 제이쿼리 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
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
		
		$("#actionForm").attr("action","freeBoardWrite");
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
	
	$("tbody").on("click","tr",function(){
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
		url : "FreeListAjax", //경로
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
		
	html +=	"<tr no =\"" + data.POST_NO + "\">";
	html +=	"<td> " + data.POST_NO + "</td>";
	html +=	"<td> " +data.TITLE + " ("+ data.CNT +")"+  "</td>";
	html +=	"<td>" + data.NM + " </td>";
	html +=	"<td>" + data.DT + " </td>";
	html +=	"<td>" + data.HIT + "</td>";
	html +=	"</tr>";
		
	}
	
	$("tbody").html(html); //내가 받은 html로 갈아 엎어라
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
	<c:import url="/header"></c:import>
	


	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">둘레길 이야기</div>
			<div class="col"></div>			
			<!-- <div class=box1>글쓰기</div> -->
			
			<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
			<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>
				
			<div class="midBox">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="memno" id="memno" value="${sMemNo}"/>
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
						<option value="2">작성자</option>
					</select>
				</div>
				<div class="searchBox">
					<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt}" placeholder="검색하기" />				
					<div class="search_ico" > <!-- 검색버튼 -->
					<img src="resources/images/search_icon.png" id="searchBtn"  />
					</div>
					
				</div>
			</div>
			</form>
			</div>
	<div class="content_free">
		<table class="table">
		<colgroup >
			<col width="11%" />
			<col width="59%" />
			<col width="9%" />
			<col width="9%" />
			<col width="9%" />
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>		
		</thead>
		<tbody>
		<!-- 위로올림 -->
		</tbody>	
	</table>
		
					
					
		</div>
	
	  <div class="pagination">
		<!-- 위로 -->
      </div>
		
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>