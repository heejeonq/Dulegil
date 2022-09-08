<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<div class="midBox">
				<!-- <div class=box1>글쓰기</div> -->
				<input type="button" class="btn" value="글쓰기"/>
				<div class="searchWrap">
				<div class="selBox">
					<select class="sel">
						<option selected="selected">select</option>
						<option>제목</option>
						<option>내용</option>					
						<option>코스</option>					
						<option>아이디</option>
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
			
			<div class="cosSelBox">
        
         </div>
				




	<div class="content_cosRev">
		<div class="c_box">
			<div class="c_b_photo">
				<img alt="명예의전당" src="resources/images/명1.jpg" id="c_photo" />
			</div>
				<div class="c_b_lv">
				<div class="c_b_like">
					<img src="resources/images/좋아요.png" id="good"/> 
					<div class="c_b_like2">25</div>
				</div>
				<div class="c_b_views">
				<img src="resources/images/viewIcon1.png" id="view" />
				<div class="c_b_view2">조회수</div>				
				</div>
			</div>
			
			<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">서울둘레길 완주</div>
			<div class="c_b_coss">1코스</div>
			<div class="c_b_date">2022-05-10</div>
		</div>


		<div class="c_box" id="c_box">
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
			
			<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
		</div>
		
		<div class="c_box">
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
			<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
		</div>
		<div class="c_box">
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
			<div class="c_b_photo">사진</div>
	<div class="c_b_lv">
				<div class="c_b_like">
					<img src="resources/images/좋아요.png" id="good"/> 
					<div class="c_b_like2">좋아요</div>
				</div>
				<div class="c_b_views">
				<img src="resources/viewIcon1.png" id="view" />
				<div class="c_b_view2">조회수</div>				
				</div>
			</div>
			<div class="c_b_id">아이디</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
		</div>
		<div class="c_box">
			<div class="c_b_photo">사진</div>
					<div class="c_b_lv">
						<div class="c_b_like">
							<img src="resources/images/좋아요.png" id="good" />
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="resources/images/viewIcon1.png" id="view" />
							<div class="c_b_view2">조회수</div>
						</div>
					</div>
					<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
		</div>
		<div class="c_box">
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
			<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
		</div>
		<div class="c_box">
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
			<div class="c_b_id">양똥이</div>
			<div class="c_b_tit">제목</div>
			<div class="c_b_coss">코스</div>
			<div class="c_b_date">작성일</div>
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
	
</div>





	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>