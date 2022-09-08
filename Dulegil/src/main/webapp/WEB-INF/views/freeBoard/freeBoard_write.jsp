<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>자유게시판작성</title>
<!-- 제이쿼리 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- CKEditor -->
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	//에디터 연결
	   //CKEDITOR.replace(아이디, 옵션) 
	      CKEDITOR.replace("con", {
	      resize_enabled : false, // resize_enabled : 크기조건기능 활용 여부 
	      language : "ko", // 사용언어 한국어
	      enterMode : "2", // 엔터키 처리방법  1:p / 2:br 3:div 인데 두개는 우리가 많이쓰니 2번으로 처리
	      width : 800, // 숫자일경우 px, 문자열일 경우 css크기
	      height : 400
	      });
 });
	
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
			<div class="titWrap">
				
				<div class="titNm">제목</div>
				<div class="titBox">
				<input type="text" class="titCon">
				</div>
			</div>

			<hr width="80%"/>
			<div class="conWrap">
				<div class="conNm">내용</div>
				<div class=contentBox>
				<textarea rows="19" cols="100" name="con" id="con"></textarea>
				</div>
	
	</div>

			
				<hr width="80%"/>
			<div class="filWrap">
				<div class="filNm">대표이미지</div>
				<div class="filBox">
					
					<input type="file" class="file"/>
					
					<div class="fileT">*이미지 파일만 첨부하여 주세요.</div>
				</div>
			</div>
				<div class="btnWrap">
					<div class="btnBox">
					<input type="button" class="btn" id="caBtn" value="취소">
					</div>
					<div class="btnBox">
					<input type="button" class="btn" id="inBtn"value="등록">
					</div>
				</div>


	</div>

	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>