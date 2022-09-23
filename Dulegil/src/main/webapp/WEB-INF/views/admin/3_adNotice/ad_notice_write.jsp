<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../common/jscss.jsp" flush="true" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">
<style type="text/css">
#header2 #hd2_content {
	width: 100%;
	height: 80%;
	/*border: solid 1px #444;*/
	background-color: white;
}

#header2 #hd2_CC {
	width: 25%;
	height: 90%;
	background-color: rgb(255, 255, 255);
	text-align: center;
	/*text-align: center;쓰려면 자식 css에 인라인블록*/
}

#header2 #hd2_CC #CCbox {
	display: inline-block;
	width: 640px;
	height: 84%;
	border-top: none;
	text-align: left;
	font-size: 25px;
	text-align: center;
	/* border: solid; */
	position: absolute;
}

#Cname {
	width: 100%;
	margin: 10px 0px;
	text-align: left;
	padding: 15px 0;
}

#Ctitle {
	width: 100%;
	height: 32px;
	text-align: left;
}

#Ccontents {
	width: 100%;
	height: 10%;
}

#ct {
	margin-top: 20px;
}

#buttons {
	text-align: right;
}

.CTN {
	width: 20%;
	/* text-align: right; */
	display: inline-block;
	font-size: 12px;
	padding: 4px;
	line-height: revert;
}

.CTC {
	width: 39%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	border-bottom: 1px solid #ddd;
	position: relative;
}

.commentBox {
	display: inline-block;
	vertical-align: top;
	width: 708px;
	height: 36px;
	border: 1px solid #ddd;
}

.commentBoxT {
	border: none;
	height: 86%;
	position: absolute;
}

.checkbox {
	width: 50%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	position: relative;
}

.textarea {
	border: 1px solid #ddd;
	outline: none;
}

input:focus {
	outline: none;
}

.filbox{
	text-align: left;
    margin-top: 10px;
}



}
</style>

<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//에디터 연결
	   //CKEDITOR.replace(아이디, 옵션) 
	      CKEDITOR.replace("contents", {
	      resize_enabled : false, // resize_enabled : 크기조건기능 활용 여부 
	      language : "ko", // 사용언어 한국어
	      enterMode : "2", // 엔터키 처리방법  1:p / 2:br 3:div 인데 두개는 우리가 많이쓰니 2번으로 처리
	       // 숫자일경우 px, 문자열일 경우 css크기
	      height : 400
	      });
	
	
	// 로그아웃 버튼 클릭시
	$("#logoutBtn").on("click", function() {
		location.href = "adLogout";
	});
	
	
	// 메뉴 - 관리자 계정 관리 
	$("#actMngBtn").on("click", function() {
		location.href = "adAccountMng";
	});
	
	
	// 메뉴 - 공지사항
	$("#ntcBtn").on("click", function() {
		location.href = "adNtList";
	});
	
	
	// 메뉴 - 이벤트관리
	$("#evtBtn").on("click", function() {
		location.href = "adEvt";
	});
	
	
	// 메뉴 - 웹사이트 활동 집계
	$("#webTotalBtn").on("click", function() {
		location.href = "adWebTotal";
	});
	
	
	// 메뉴 - 회원관리
	$("#memMngBtn").on("click", function() {
		location.href = "adMemList";
	});
	
	// 메뉴 - 신고 내역 관리
	$("#memRepBtn").on("click", function() {
		location.href = "adMemRep";
	});
	
	// 메뉴 - 게시물 관리
	$("#memPostBtn").on("click", function() {
		location.href = "adMemPost";
	});
	
	// 메뉴 - 댓글 관리
	$("#memCmtBtn").on("click", function() {
		location.href = "adCmtList";
	});
	
	
	
	
	//작성 버튼
	$("#insertBtn").on("click", function() {
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
	   	 				$("#attFile").val(res.fileName[0]);//올라간 파일명 보관
	   	 			}
	   	 		/*
	   	 		글저장
	   	 		
	   	 		*/
	   	 			 var params = $("#actionForm").serialize();   
	   	               $.ajax({
	   	                  url:"adNtAction/insert", //경로 주소 새로생기면 컨트롤러 가
	   	                  type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
	   	                  dataType: "json", //
	   	                  data: params, //json 으로 보낼데이터
	   	                  success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
	   	                     console.log(res);
	   	                  
	   	                 
	   	                  switch(res.msg){
	   	                  
	   	                  case "success" :
	   	                    $("#page").val("1");
	   	                    $("#searchgbn").val("0");
	   	                    $("#searchTxt").val("");
	   	                    
	   	                    
	   	                 	location.href = "adNtList"
	   	                     break;
	   	                  case "fail" :
	   	                     makeAlert("알림", "등록에 실패하였습니다.")
	   	                     break;
	   	                  case "error" :                     
	   	                     makeAlert("알림", "등록중 문제가 발생하였습니다.")
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
	
	//목록버튼
	$("#listBtn").on("click", function() {
	    history.back();
	 });
	
	
	
		
});
</script>
</head>
<body>
	<!--  header 1  -->
	<div id="header1">
		<div id="logo"></div>
		<div id="time"></div>

		<div id="h_1">
			<div class="btnMembers">manager menu</div>

			<div class="btnAll" id="actMngBtn">
				<span class="material-symbols-outlined">account_circle </span> <span>관리자
					계정 관리</span>
			</div>




			<div class="btnAll" id="ntcBtn">
				<span class="material-symbols-outlined"> edit_document </span> <span>공지사항</span>
			</div>


			<div class="btnAll" id="evtBtn">
				<span class="material-symbols-outlined"> calendar_month </span> <span>이벤트
					관리</span>

			</div>


			<div class="btnAll" id="webTotalBtn">
				<span class="material-symbols-outlined"> bar_chart </span> <span>웹사이트
					활동 집계</span>
			</div>

			<div id="empty"></div>
			<div class="btnMembers">members</div>

			<div class="btnOne" id="memMngBtn">
				<span class="material-symbols-outlined"> person </span> <span>회원
					관리</span>
			</div>


			<div class="btnOne" id="memRepBtn">
				<span class="material-symbols-outlined"> person_off </span> <span>신고내역
					관리</span>
			</div>


			<div class="btnOne" id="memPostBtn">
				<span class="material-symbols-outlined"> edit_note </span> <span>게시물
					관리</span>
			</div>


			<div class="btnOne" id="memCmtBtn">
				<span class="material-symbols-outlined"> comment </span> <span>댓글
					관리</span>
			</div>
		</div>
	</div>
	<!-- 헤더 1 -->






	<div id="header2">
		<!-- 상단바 -->
		<div id="hd2_header">
			<div class="hh2_icon">
				<div>알림</div>
				<div>
					<span class="material-symbols-outlined" id="logoutBtn">
						exit_to_app </span>로그아웃
				</div>
			</div>
		</div>





		<div id="hd2_content">
			<div id="hd2_Cname"></div>






			<div id="hd2_CC">
				<div id="CCbox">
					<div id="Cname">
						<span class="material-symbols-outlined "
							style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;">
							edit_square </span>공지사항 작성
					</div>
					
					
					<!-- 파일업로드 폼 -->
					<form action="fileUploadAjax" id="actionForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="attFile" id="attFile" />
						<!-- 실 저장된 파일명 보관용 -->
						<input type="hidden" name="memberNo" id="memberNo"
							value="${sMemNo}" />
						<!-- 실 저장된 파일명 보관용 -->
						
						
						<!-- 메인띄우기 -->
						<div id="Ctitle">
							<div class="CTN">메인으로 띄우기</div>
							<div class="checkbox">
								<input type="checkbox" id="mainCheck" name="mainCheck" value="0" class="commentBoxT">
							</div>
						</div>

						<!-- 제목 -->
						<div id="Ctitle" style="margin-bottom:5px;">
							<div class="CTN">제목</div>
							<div class="CTC">
								<input type="text" name="title" id="title" class="commentBoxT">
							</div>
						</div>
						
						<!-- 글 내용 -->
						<textarea rows="30" cols="60" name="contents" id="contents"
							class="textarea"></textarea>
						
						
						<!-- 파일 첨부 -->
						<div class="filWrap">
							<div class="filBox">
								<input type="file" class="file" name="attFile" id="attFile" />	
							</div>
						</div>
					</form>
					
					<!-- 버튼 -->
					<div id="buttons">
						<input type="button" id="insertBtn" value="작성" class="myButton" />
						<input type="button" id="listBtn" value="목록" class="myButton" />
					</div>

				</div>
			</div>
		</div>


	</div>

</body>
</html>