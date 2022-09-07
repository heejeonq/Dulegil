<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="../../css/board.css" />
<link rel="stylesheet" href="../../css/list.css" />
<link rel="stylesheet" href="../../css/fonts.css" />
<title>명예의전당</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">명예의 전당</div>
			<div class="col"></div>			
			<div class="midBox">
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
					<img src="../../css/images/search_icon.png" id="searIcon" />
					</div>	
				</div>
			</div>
			</div>
				
			<div class="monSelBox">
	            <div class="monthSel">
	         	◁   8월 ▷ 
	            </div>
	            <div class="midT">의 베스트</div>
	         </div>
		
			<div class="content">
				<div class="c_box">
					<img src="../../css/images/firstMedal.png" id="Medal" />
					
					<div class="c_b_photo">
						<img alt="명예의전당" src="../../css/images/bestpho.jpg" id="c_photo" />
					</div>
					
					<div class="c_b_lv">
						<div class="c_b_like">
						<img src="../../css/images/좋아요.png" id="good"/> 
						<div class="c_b_like2">127</div>
						</div>
					
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
							<div class="c_b_view2">3,425</div>				
						</div>
					</div>
					
					<div class="c_b_id">양똥이</div>
					<div class="c_b_tit">서울둘레길 완주</div>
					<div class="c_b_coss">완주</div>
					<div class="c_b_date">작성일 2022-05-10</div>
				</div>
		
		
				<div class="c_box" id="c_box">
					<img src="../../css/images/secondMedal.png" id="Medal" />
					<div class="c_b_photo">사진</div>
					
					<div class="c_b_lv">
						<div class="c_b_like">
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
						<img src="../../css/images/viewIcon1.png" id="view" />
						<div class="c_b_view2">조회수</div>				
						</div>
					</div>
					
					<div class="c_b_id">아이디</div>
					<div class="c_b_tit">제목</div>
					<div class="c_b_coss">코스</div>
					<div class="c_b_date">작성일</div>
				</div>
				
				<div class="c_box">
					<img src="../../css/images/thirdMedal.png" id="Medal" />
					<div class="c_b_photo">사진</div>
					<div class="c_b_lv">
						<div class="c_b_like">
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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
							<img src="../../css/images/좋아요.png" id="good"/> 
							<div class="c_b_like2">좋아요</div>
						</div>
						<div class="c_b_views">
							<img src="../../css/images/viewIcon1.png" id="view" />
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