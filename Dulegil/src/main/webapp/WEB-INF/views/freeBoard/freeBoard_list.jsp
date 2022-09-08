<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	

	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		
		//신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		//내가 입력한 값을 전으로 데
		
		
		reloadList();
	})
	
	$("#wriBtn").on("click",function(){
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","ATInsert");
		$("#actionForm").submit();
		
		
	});
	$("tbody").on("click","tr",function(){
		$("#no").val($(this).attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","ATDetail");
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

/* function drawList(list) {
	var html = "";
	
	for(var data of list){ // " +  + " 1(내용) 대신 넣자
		
		<tr no ="1">
		<td>1</td>
		<td>같이가실분</td>
		<td>둘레마스터</td>
		<td>20220817</td>
		<td>1</td>
		</tr>
		
	}
	
	$("tbody").html(html); //내가 받은 html로 갈아 엎어라
} */

</script>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
	


	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">둘레길 이야기</div>
			<div class="col"></div>			
			<div class="midBox">
				<!-- <div class=box1>글쓰기</div> -->
				<input type="button" class="btn" value="글쓰기" id="wriBtn"/>
				
			<div class="searchWrap">
				<div class="selBox">
					<select class="sel">
						<option selected="selected">select</option>
						<option>제목</option>
						<option>내용</option>
						<option>ID</option>
					</select>
				</div>
				<div class="searchBox">
					<input type="text" class="serchTxt" placeholder="검색하기" />
					
					<div class="search_ico" id="searchBtn"">
					<img src="resources/images/search_icon.png" id="searIcon"  />
					</div>
					
				</div>
			</div>


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
		<tr no ="1">
				<td>1</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
				<td>1</td>
		</tr>
			<tr>
				<td>2</td>
				<td>오늘 날씨가 좋네요</td>
				<td>김초코</td>
				<td>20220819</td>
				<td>4</td>
			</tr>
			<tr>
				<td>3</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>4</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>5</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>6</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>7</td>
				<td></td>
				
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>8</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>9</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>10</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
				<td>30</td>
			</tr>
			<tr>
				<td>11</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
				<td>30</td>
			</tr>	
			<tr>
				<td>12</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
				<td>30</td>
			</tr>
		</tbody>	
	</table>
		
					
					
		</div>
	
	  <div class="pagination">
      <span class="first_arw"><<</span>
      <span class="prev_arw"><</span>
      <span >1</span>
      <span >2</span>
      <span >3</span>
      <span >4</span>
      <span >5</span>

      <span class="next_arw" >></span>
      <span class="end_arw" >>></span>
      </div>
		
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>