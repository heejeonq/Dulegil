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
<title>동행구하기 상세보기</title>
<style type="text/css">
.imgFile{
	display:none;
}
.attold span{
width: 90%;
 	font-size: 13px;
    line-height: 30px;
    color: gray;
    border-bottom: 1px solid gray;
}
.fileDelBtn{	
    font-size: 12px;
    vertical-align: center;
    cursor: pointer;
    padding: 5px;
    border: 1px solid gray;
    color: gray;
    background: #ededed;
    margin-left: 15px;

}

</style>
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
	
		
	
	$(".cosSell").change(function(){
		$("#courseNo").val($(this).val());
	});
	
	//취소버튼
	$("#cancelBtn").on("click", function() {
		$("#backForm").submit();
	 });
	 
	 //파일삭제버튼
	$(".fileDelBtn").on("click",function(){
		//기존파일 내역 영역 제거
		$(".attOld").remove();
		
		//기존 값 제거
		$("#imgFile").val("");
		//파일선택 영역 제공
		$(".imgFile").show();
		
		
	}); 
		
		
       
    //등록버튼
    $("#updateBtn").on("click", function() {
    	
        $("#contents").val(CKEDITOR.instances['contents'].getData());

        // $.trim(값) : 값 앞 뒤 공백제거
        if ($.trim($("#title").val()) == "") {
           makeAlert("알림", "제목을 입력하세요.", function() {
              $("#title").focus();
           });

        } else if ($("#contents").val() == "") {
           makeAlert("알림", "내용을 입력하세요.", function() {
              $("#contents").focus();
           });

        }  else if ($("#courseNo").val() == "") {
            makeAlert("알림", "코스를 선택하세요.", function() {
                $("#courseNo").focus();
             });

   }  else if ($("#accompanyDt").val() == "") {
            makeAlert("알림", "동행날짜를 선택하세요.", function() {
                $("#accompanyDt").focus();
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
       	 				$("#imgFile").val(res.fileName[0]);//올라간 파일명 보관
       	 			}
       	 		/*
       	 		글저장
       	 		
       	 		*/
       	 		$("#publicAge").val($('input[name=gender]:checked').val());
       	 		$("#publicGender").val($('input[name=age]:checked').val());
       	 		
       	 			 var params = $("#actionForm").serialize();   
       	               $.ajax({
       	                  url:"accompanyAction/update", //경로 주소 새로생기면 컨트롤러 가
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
       	                     console.log(request.responseText); //실패 상세내역
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
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-main">

		<div class="mainWrap">
			<div class="tit">동행구하기</div>
			<div class="col"></div>
			
			<form action="accompany" id="backForm" method="post">
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
				 <input type="hidden" name="courseNo" id="courseNo"  />
				 <input type="hidden" name="publicGender" id="publicGender"  />
				 <input type="hidden" name="publicAge" id="publicAge"  />
				<div class="titNm">제목</div>
				<div class="titBox">
				<input type="text" class="titCon" name="title" id="title" value="${data.TITLE}">
				</div>
			</div>

			<hr width="80%"/>
			
			<div class="cosWrap">
				<div class="cosNm">코스선택</div>
				<div class="cosBox">
					<select class="cosSell">
						<option value="0">코스를 선택해 주세요.</option>
						<option value="1">1코스-수락·불암산코스	</option>
						<option value="2">2코스-용마·아차산코스	</option>
						<option value="3">3코스-고덕·일자산코스	</option>
						<option value="4">4코스-대모·우면산코스	</option>
						<option value="5">5코스-관악·호암산코스	</option>
						<option value="6">6코스-안양천·한강코스	</option>
						<option value="7">7코스-봉산·앵봉산코스</option>
						<option value="8">8코스-북한·도봉산산코스</option>
					</select>
				</div>
			</div>
			<hr width="80%"/>
		 <div class="datWrap">            
            <div class="datNm">동행날짜</div>
            <div class="dateBox">
            <input type="date" class="dateCon" name="accompanyDt" id="accompanyDt" value="${data.ACCOMPANY_DT}"/>
            </div>
         </div>
			
			<hr width="80%"/>
			<div class="conWrap">
				<div class="conNm">내용</div>
				<div class=contentBox>
				<textarea rows="19" cols="100" name="contents" id="contents" >${data.CONTENTS}</textarea>
				
				</div>
			</div>
			
			<div class="MyWrap">
				<div class="MyNm">정보공개</div>
				<div class="MyBox">
				<div class="genBox">
				<span>성별 &nbsp;&nbsp;&nbsp;:</span>
					<span class="gong">공개</span><input type="radio" name="gender"checked="checkde" value="0">
					<span class="gong">비공개</span><input type="radio" name="gender" value="1">
				 </div>
				 <div class="ageBox">
				 <span>나이 &nbsp;&nbsp;&nbsp;:</span>
					<span class="gong">공개</span> <input type="radio" name="age"checked="checkde" value="0">공개
					<span class="gong">비공개</span> <input type="radio" name="age" value="1">비공개
				</div>
				</div>
			</div>
			
			</div>
			
			</div>

			
				<hr width="80%"/>
			<div class="filWrap">
				<div class="filNm">대표이미지</div>
				<div class="filBox">	
				<c:choose>
					<c:when test="${empty data.B_IMG}">
					<!-- 파일 없을때 -->
						<input type="file" class="file" name="attFile"/>					
						<div class="fileT">*이미지 파일만 첨부하여 주세요.</div> 
						<input type="hidden" name="imgFile" id="imgFile" />			
					</c:when>
					<c:otherwise>
					<!-- 파일 있을때 -->
				
					<span class="attOld"><!-- 기존파일 -->
						<span>
							<!-- fn:length(대상) : 대상 문자열의 길이나 배열, 리스트의 크기를 가져온다. -->
					
							<c:set var="fileLength" value="${fn:length(data.B_IMG)}"></c:set>
							<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
							<c:set var="fileName" value="${fn:substring(data.B_IMG, 20, fileLength)}"></c:set>
							${fileName}
						</span>	
							<span class="fileDelBtn">파일삭제</span>						
					</span>
														
					<span class="imgFile"> <!-- 기존파일 삭제후 새파일 용도 -->			
						<input type="file" class="file" name="attFile"/>
						<input type="hidden" name="imgFile" id="imgFile" value="${data.B_IMG}"/>
						<div class="fileT">*이미지 파일만 첨부하여 주세요.</div> 
					</span>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			
			</form>
			
			<div class="btnWrap">
				<div class="btnBox">
					<input type="button" class="btn" id="updateBtn" value="수정">
					<input type="button" class="btn" id="cancelBtn" value="취소">
				</div>
			</div>

	</div>


	</div>


	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>