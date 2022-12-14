<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/noticList.css" />

<title>공지사항목록</title>
<!-- 제이쿼리 -->
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0"); //검색어 유지
	}
	
	reloadList();
	
	$('#searchTxt').keypress(function(event){
	     if ( event.which == 13 ) {
	         $('#searchBtn').click();
	         return false;
	     }
	});


	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		
		//신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	})	

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
	
	$(".noticeContent").on("click",".noticCon",function(){
		$("#no").val($(this).attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","noticeDetail");
		$("#actionForm").submit();
		
	});
	
}); //document.ready end

function reloadList(){
	
	var params = $("#actionForm").serialize();

	$.ajax({
		url : "noticeAjax", //경로
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
		if(data.MUST_READ_YN == "0"){
			html +=	"<div class=\"noticCon\" no=\"" + data.POST_NO + "\">";
			html += "	<div class=\"listTit\">";
			html += "	<div class=\"labelNotic\">필독</div>";
		}else{
			html +=	"<div class=\"noticCon\" no=\"" + data.POST_NO + "\">";
			html += "	<div class=\"listTit\">";			
		}
	
			html += "	<span class=\"p\">" + data.TITLE + "</span>";
			html += "	<span class=\"date1\">" + data.REG_DT + "</span>";
			html += "	<span class=\"hit\">" + data.HIT + "</span>	";
		if(typeof(data.ATT_FILE) !="undefined"){
			html += "	<span class=\"fileF\">";
			html += "	<img src=\"resources/images/diskette.png\" id=\"searIcon\" />";
			html += "	</span>	";
		}else{
			html += "	<span class=\"fileF\">";
			
			
			
			html += "	</span>	";
		}
			html += "	</div> ";
			html += "	</div> ";
		
	}
	
	$(".noticBody").html(html); //내가 받은 html로 갈아 엎어라
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
			<div class="tit">공지사항</div>
			<div class="col"></div>	
			
			<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
			<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>
					
			<form action="#" id="actionForm" method="post">
			<div class="midBox">
				<!-- <div class=box1>글쓰기</div> -->
				<input type="hidden" name="no" id="no"/>
				<input type="hidden" name="sMemNo" id="sMemNo" value="${sMemNo}"/>
				<input type="hidden" name="page" id="page" value="${page}" />	
			<div class="searchWrap">
				<div class="selBox">
					<select class="sel" name="searchGbn" id="searchGbn">					
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>

				</div>
				<div class="searchBox">
					<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt}" placeholder="검색하기" />					
					<div class="search_ico">
						<img src="resources/images/search_icon.png" id="searchBtn" />
					</div>
					
				</div>
			</div>

			</div>
			</form>
			<div class="noticeContent">
				<div class="noticConTit">
				  <div class=listTit>
				  	<div class="num"> </div>
				
					<span class="pTitTh">제목</span>
					<span class="fileTh">첨부파일</span>				
					<span class="hitTh">조회수</span>				
					<span class="dateTh">날짜</span>
				 </div>
				</div>
				
				
				<div class="noticBody">
				
				</div>
	
		</div>
 			<div class="emptyBox"></div>
		


	
	
			<div class="pagination">
			<!-- 위로 올림 -->
	      	</div>
		
		</div>
	</div>
	







	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>