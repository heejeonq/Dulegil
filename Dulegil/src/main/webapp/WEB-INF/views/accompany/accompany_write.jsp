<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>동행구하기 상세보기</title>
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
			<div class="tit">동행구하기</div>
			<div class="col"></div>
			
			<div class="midBox">
			
			<div class="titWrap">
				
				<div class="titNm">제목</div>
				<div class="titBox">
				<input type="text" class="titCon">
				</div>
			</div>

			<hr width="80%"/>
			
			<div class="cosWrap">
				<div class="cosNm">코스선택</div>
				<div class="cosBox">
					<select class="cosSell">
						<option>코스를 선택해 주세요.</option>
						<option>1코스-수락·불암산코스	노원구,도봉구	18.6km	8시간 10분</option>
						<option>2코스-용마·아차산코스	광진구,중랑구	12.3km	5시간 10분</option>
						<option>3코스-고덕·일자산코스	강동구,송파구	25.6㎞	8시간50분</option>
						<option>4코스-대모·우면산코스	강남구,서초구	18.3㎞	8시간10분</option>
						<option>5코스-관악·호암산코스	관악구,금천구	13.0㎞	6시간</option>
						<option>6코스-안양천·한강코스	강서구,구로구,금천구,영등포구	18.2km	4시간 30분</option>
						<option>7코스-봉산·앵봉산코스	마포구,은평구	16.8km	6시간 25분</option>
						<option>8코스-북한·도봉산산코스	강북구,도봉구,성북구,은평구,종로구	33.7km	16시간30분</option>
					</select>
				</div>
			</div>
			<hr width="80%"/>
		 <div class="datWrap">            
            <div class="datNm">동행날짜</div>
            <div class="dateBox">
            <input type="date" class="dateCon" />
            </div>
         </div>
			
			<hr width="80%"/>
			<div class="conWrap">
				<div class="conNm">내용</div>
				<div class=contentBox>
				<textarea rows="19" cols="100" name="con" id="con"></textarea>
				</div>
			</div>
			
			<div class="MyWrap">
				<div class="MyNm">정보공개</div>
				<div class="MyBox">
				<div class="genBox">
				<span>성별 &nbsp;&nbsp;&nbsp;:</span>
					<span class="gong">공개</span><input type="radio" name="gender"checked="checkde" >
					<span class="gong">비공개</span><input type="radio" name="gender" >
				 </div>
				 <div class="ageBox">
				 <span>나이 &nbsp;&nbsp;&nbsp;:</span>
					<span class="gong">공개</span> <input type="radio" name="age"checked="checkde">공개
					<span class="gong">비공개</span> <input type="radio" name="age" >비공개
				</div>
				</div>
			</div>
			
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