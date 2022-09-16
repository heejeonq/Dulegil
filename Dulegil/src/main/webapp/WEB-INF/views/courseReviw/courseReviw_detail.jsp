<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/cosRevDet.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>코스후기상세</title>
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
		<div class="emptyBox"></div>
		<div class="tit_tt">서울 둘레길 완주</div>
		<div class="tit_tt">
			<div class="tit_cos">
			<img src="resources/images/gitIcon.png" />
			1코스-수락·불암산코스	노원구,도봉구	18.6km	8시간 10분
			<img src="../../css/images/gitIcon.png" />
			</div>
		</div>
		<div class="ti_ttt">
			<div class="tit_writer">
			<img src="resources/images/sample1.jpg" />양똥이</div><span>&nbsp;&nbsp;</span>
			<div class="tit_date">
			작성일 2022-08-08</div>
		</div>
		<hr/>
		<div class="conBox">
		<div class="emptyBox"></div>
		<div class= "imgg">
		<img src="resources/images/bestpho.jpg" />
		</div>
		<div class="te"> 다같이 완주 ^^</div>
			
			<div class="goodBtn">
				<span class="like">
					<img src="resources/images/goodIco.png">
					<div class="goodCnt">25</div>
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
			
			<input type="button" class="btn" id="delBtn" value="삭제"/>		
			<input type="button" class="btn" id="upBtn" value="수정"/>
			<input type="button" class="btn" id="listBtn" value="목록"/>
		</div>
	
			</div>
		<div class="emptyBox"></div>
		<div class="emptyBox"></div>
			
			
		<hr/>
			<div class= mainview3>
				<div class="box3">
					<div class="comment">comment</div>
					
					<div class="commentBox1">
					로그인이 필요한 서비스입니다.
					<div class="green_Btn">로그인</div>
					</div>
					
					<div class="commentBox">
					<textarea class=commentBoxT placeholder="댓글을 입력하세요" /></textarea>
					</div>
					
					<input type="button" class="regBtn" value="등록"/>
				</div>
				<div class="coll"></div>
			</div>
			
			
			
			
			
			
			
			
			
			<div class="mainview4">
			
				<div class="iconBox">
					<img src="resources/images/detailViewIcon.png" />
				</div>
			<div class="idBox">
				<img src="resources/images/sample2.jpg" class="pimg"/> 지존루피
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
	
		</div>
		

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>