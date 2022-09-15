<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 <jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>자유게시판작성</title>
<script type="text/javascript" src="resources/script/common/popup.js"></script>

<script type="text/javascript">
$(document).ready(function(){	
	//에디터 연결
	   //CKEDITOR.replace(아이디, 옵션) 
	      CKEDITOR.replace("contents", {
	      resize_enabled : false, // resize_enabled : 크기조건기능 활용 여부 
	      language : "ko", // 사용언어 한국어
	      enterMode : "2", // 엔터키 처리방법  1:p / 2:br 3:div 인데 두개는 우리가 많이쓰니 2번으로 처리
	      width : 800, // 숫자일경우 px, 문자열일 경우 css크기
	      height : 400
	      });
	
//목록버튼
$("#cancelBtn").on("click", function() {
    history.back();
 });
 

$("#fileDelBtn").on("click",function(){
	//기존파일 내역 영역 제거
	$(".IMGOld").remove();
	//기존 값 제거
	$("#imgFile").val("");
	//파일선택 영역 제공
	$(".imgFile").show();
});
//등록버튼
$("#updateBtn").on("click", function() {
    $("#contents").val(CKEDITOR.instances['contents'].getData())

    // $.trim(값) : 값 앞 뒤 공백제거
    if ($.trim($("#title").val()) == "") {
       makeAlert("알림", "제목을 입력하세요.", function() {
          $("#title").focus();
       });

    } else if ($("#contents").val() == "") {
       makeAlert("알림", "내용을 입력하세요.", function() {
          $("#contents").focus();
       });

    } else {
   	 //1.파일 업로드 ->  2.업로드 파일명 취득->  3. 글 저장
   	 //폼 객체 취득
   	 var form = $("#actionForm");
   	 // ajaxForm 적용
   	 form.ajaxForm({
   	 	success:function(res){ // 데이터 주고받기 성공 시
   	 		if(res.result =="SUCCESS"){//파일전송 성공
   	 			//올라간 파일이 존재한다면
   	 			if(res.fileName.length > 0){//배열의 갯수가 0보다 크다면
   	 				$("#bImg").val(res.fileName[0]);//올라간 파일명 보관
   	 			}
   	 		/*
   	 		글저장
   	 		
   	 		*/
   	 			 var params = $("#actionForm").serialize();   
   	               $.ajax({
   	                  url:"FREEAction/update", //경로 주소 새로생기면 컨트롤러 가
   	                  type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
   	                  dataType: "json", //
   	                  data: params, //json 으로 보낼데이터
   	                  success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
   	                     console.log(res);
   	                  
   	                 
   	                  switch(res.msg){
   	                  
   	                  case "success" :
   	                    $("#backForm").submit();
   	                     break;
   	                  case "fail" :
   	                     makeAlert("알림", "수정에 실패하였습니다.")
   	                     break;
   	                  case "error" :                     
   	                     makeAlert("알림", "수정중 문제가 발생하였습니다.")
   	                     break;
   	                  }
   	                  
   	               
   	                  },
   	                  error :function(request, status, error) { //실패했을 때 함수 실행
   	                     console.log(request,responseText); //실패 상세내역
   	                  }
   	                  
   	               });
       	 		
   	 		}else{//문제발생
   	 			makeAlert("알림", "파일업로드에<br/> 문제가 발생하였습니다.");
   	 		}
   	 		
   	 	},
   	 	error:function(){//에러 시
   	 		makeAlert("알림", "파일업로드에<br/> 문제가 발생하였습니다.");
   	 	}
   	 }); //ajaxForm 설정 끝
   	 
   	 //ajaxForm 실행
   	 form.submit();
      

    }
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
			<div class="tit">둘레길이야기</div>
			<div class="col"></div>
			
			<form action="freeBoard" id="backForm" method="post">
		  		<!-- 전화면에서 넘어온 페이지정보 -->
		   		<input type="hidden" id="page" name="page" value="${param.page}"/>
		      	<!-- 전화면에서 넘어온 검색 정보 -->
		      	<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" /> 
		        <input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
		       
		   </form>
			<div class="midBox">
			<div class="titWrap">
			
			<form action="fileUploadAjax" id="actionForm" method="post" enctype="multipart/form-data">
				 <input type="hidden" name="imgFile" id="imgFile" /> <!-- 실 저장된 파일명 보관용 -->
				 <input type="hidden" name="memberNo" id="memberNo" value="${sMemNo}" /> <!-- 실 저장된 파일명 보관용 -->
				 
				<div class="titNm">제목</div>
				<div class="titBox">
				<input type="text" class="titCon" name="title" id="title" value="${data.TITLE}"/>
				</div>
			</div>

			<hr width="80%"/>
			<div class="conWrap">
				<div class="conNm">내용</div>
				<div class=contentBox>
				<textarea rows="19" cols="100" name="contents" id="contents">				
				<img src="resources/upload/${data.B_IMG}"/>
				${data.CONTENTS}
				</textarea>
				</div>
	
	</div>

			
				<hr width="80%"/>
			<div class="filWrap">
				<div class="filNm">대표이미지</div>
				<div class="filBox">
					<c:choose>
						<c:when test="${empty data.B_IMG}">
						<!-- 파일없을때 -->
							<input type="hidden" name="imgFile" id="imgFile" />
							<input type="file" class="file" name="attFile"/>
							<div class="fileT">*이미지 파일만 첨부하여 주세요.</div>						
						</c:when>
						<c:otherwise>
						<!-- 파일있을때 -->
							<span class="IMGOld"><!-- 기존파일 -->
							<c:set var="fileLength" value="${fn:length(data.B_IMG)}"></c:set>
							<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
							<c:set var="fileName" value="${fn:substring(data.B_IMG, 20, fileLength)}"></c:set>
							${fileName}
							<div class="cmn_btn_ml float_right_btn" id="fileDelBtn">파일 삭제</div> 
						</span>
						
						<span class="imgFile"> <!-- 기존파일 삭제후 새파일 용도 -->
							<input type="file" name="attFile"/>
							<input type="hidden" name="bImg" id="att" value="${data.B_IMG}"/>
						</span>
						</c:otherwise>
					
					</c:choose>
				</div>
			</div>
			
			</form>
				
				<div class="btnWrap">
					<div class="btnBox">
					<input type="button" class="btn" id="insertBtn" value="등록">
					</div>
					<div class="btnBox">
					<input type="button" class="btn" id="listBtn" value="목록">
					</div>
				</div>


	</div>

	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>