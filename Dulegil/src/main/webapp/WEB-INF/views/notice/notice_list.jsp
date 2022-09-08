<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/noticList.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>공지사항목록</title>
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
			<div class="tit">공지사항</div>
			<div class="col"></div>			
			<div class="midBox">
				<!-- <div class=box1>글쓰기</div> -->
				
			<div class="searchWrap">
				<div class="selBox">
					<select class="sel">
						<option selected="selected">select</option>
						<option>제목</option>
						<option>내용</option>
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
			<div class="content">
				<div class="noticConTit">
				  <div class=listTit>
				  	<div class="num"> </div>
				
					<span class="pTit">제목</span>
					<span class="date">2022-08-13</span>
					<span class="hit">조회수</span>				
					<span class="file">첨부파일</span>				
				 </div>
				</div>
				
				
				<div class="noticCon">
				  <div class=listTit>
					<div class="labelNotic">필독</div>
					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>				
					<span class="hit">30</span>	
					<span class="fileF">
					<img src="resources/images/diskette.png" id="searIcon" />
					</span>	
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>
					<div class="labelNotic">필독</div>
					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>
				
					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					
					<span class="hit">30</span>				
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>	
					<span class="hit">30</span>				
				 </div>
				</div>
				<div class="noticCon">
				  <div class=listTit>

					<span class="p">서울둘레길 통행금지구간 안내</span>
					<span class="date">2022-08-13</span>
					<span class="hit">30</span>					
				</div>
			</div>
		</div>
 			<div class="emptyBox"></div>
		


	
	
			<div class="pagination">
				<span class="first_arw">&lt;&lt;</span>
				<span class="prev_arw">&lt;</span>
				<span >1</span>
				<span >2</span>
				<span >3</span>
				<span >4</span>
				<span >5</span>
				
				<span class="next_arw" >&gt;</span>
				<span class="end_arw" >&gt;&gt;</span>
	      	</div>
		
		</div>
	</div>
	







	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>