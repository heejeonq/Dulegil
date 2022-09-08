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
				<input type="button" class="wriBtn" value="글쓰기"/>
				
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
					
					<div class="search_ico" onclick="chk_search();">
					<img src="resources/images/search_icon.png" id="searIcon" />
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
		<tr>
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