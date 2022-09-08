<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/freeBorDet.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>자유게시판상세</title>
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
		<div class="tit">자유게시판</div>
		<div class="col"></div>
		
		<div class="midBox">
		<div class="emptyBox"></div>
		<div class="tit_tt">완주했어융</div>
	
		<div class="ti_ttt">
			<div class="tit_writer">
			<img src="resources/images/sample1.jpg" />둘레마스터</div><span>&nbsp;&nbsp;</span>
			<div class="tit_date">
			작성일 2022-08-08</div>
		</div>
		<hr/>
		<div class="contentBox">
		<div class="emptyBox"></div>
		<div class= "imgg">
		<img src="resources/images/완주사진.jpg" />
		<div class="te"> 지도앞에서 한컷</div>
		</div>
	
			</div>
		<div class="emptyBox"></div>
		
		<div class="box2">
		
			<div class="reporBtn">
				<span class="report">
					<img src="resources/images/report1.png" />
				</span>
				<span class="reporTit">신고하기</span>			
			</div>
			
			<input type="button" class="wriBtn" id="delBtn" value="삭제"/>		
			<input type="button" class="wriBtn" id="upBtn" value="수정"/>
			<input type="button" class="wriBtn" id="listBtn" value="목록"/>
		</div>

		
	

			</div>
		<div class="emptyBox"></div>
		<div class="emptyBox"></div>
			
			
		<hr/>
			<div class= mainview3>
				<div class="box3">
					<div class="comment">comment</div>
					
					<div class="commentBox">
					<input type="text" class=commentBoxT placeholder="댓글을 입력하세요" />
					</div>
					
					<input type="button" class="regBtn" value="등록"/>
				</div>
				<div class="coll"></div>
			</div>
			
			
			
			<div class="mainview4">
			<div class="iconBox">
			<img src=".resources/images/detailViewIcon.png" />
			</div>
			<div class="idBox">
			<img src="resources/images/sample2.jpg" class="bbo"/> 지존루피
		    </div>			
		    <div class="commentDe">와 저도 가보고싶어요와 저도 가보고싶어요<br/>
		    다음에 갈땐 나도 데려가요가요가요가요<br/>
		    나도 둘레둘레 할래
		    </div>
		    <div class="date">2022-08-13</div>
		   <div class="more">
				<input type="button" class="moreBtn" value="더보기+" />
			</div>
			</div>
			
			
				
		

	
		</div>
		
		





	<!-- footer -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>