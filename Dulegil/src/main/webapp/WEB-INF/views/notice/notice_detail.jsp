<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/noticDetail.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>공지사항상세</title>
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
		<div class="tit">동행구하기</div>
		<div class="col"></div>
		
		<div class="midBox">
		<div class="emptyBox"></div>
		<div class="tit_tt">서울둘레길 통행금지구간 안내</div>
		<div class="ti_ttt">
			<div class="tit_writer">
			서울둘레길 </div>
			<div class="tit_date">
			
			작성일 2022-08-08</div>
			<div class="file">첨부파일</div>
			
		</div>
		<hr/>
		<div class="contentBox">
		<div class="emptyBox"></div>
		<div class= "content">
		<div class="te"> 서울둘레길안내센터에서 알림니다

현재 서울둘레길 통행금지구간입니다

1. 4-2코스 우면산구간( 산사태로 인하여 전면 통행 금지)

2. 6-2코스 양화교 아래 ~ 한강합수부 ~ 염강나들목 (침수로 인한 통행금지)


서울둘레길 탐방객은 통행금지구간을 확인하시고

그 외 서울둘레길 구간은 노면상태가 정상적인 트레킹이 어렵습니다

안전사고가 발생할 수 있으므로 안전사고에 각별히 주의하시길 바랍니다</div>
		</div>
	<div class="emptyBox"></div>
		
		<hr/>
	<div class="emptyBox"></div>
		<div class="btnBox">

			<input type="button" class="wriBtn" id="listBtn" value="목록"/>
			<input type="button" class="wriBtn" id="delBtn" value="삭제"/>		
			<input type="button" class="wriBtn" id="upBtn"  value="수정"/>
		</div>
				
		

		</div>
	
		
			</div>
			


	
		</div>
		
		





	<!-- footer -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>