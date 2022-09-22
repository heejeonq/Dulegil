<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
 <jsp:include page="../../common/jscss.jsp" flush="true" />
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
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
	width: 462px;
	height: 84%;
	border-top: none;
	text-align: left;
	font-size: 25px;
	text-align: center;
	/* border: solid; */
	position: absolute;
	height: 84%;
	border-top: none;
	text-align: left;
	font-size: 25px;
	text-align: center;
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
	height: 10%;
	text-align: right;
}

.CTN {
	width: 21%;
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

.checkbox {
	width: 50%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
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
	
	
	// 메인 체크
	if(document.getElementById("mainCheck").checked){
		document.getElementById("mainCheck_hidden").disabled = true;
	}
	
	
	//수정 버튼
	$("#updateBtn").on("click", function(){
		$("#contents").val(CKEDITOR.instances['contents'].getData())
		
		if($.trim($("#title").val()) == ""){
			makeAlert("알림", "제목을 입력하세요.", function(){
				$("title").focus();
			});
			
			}else if($("#contents").val() == ""){
				makeAlert("알림", "내용을 입력하세요.", function(){
					$("#contents").focus();
					
				});
			
			}else{
				var form = $("#actionForm");
				
				form.ajaxForm({
					success:function(res){
						if(res.result == "SUCCESS"){
							if(res.fileName.length > 0){
								$("#attFile").val(res.fileName[0]);
							}
							
							
							var params = $("#actionForm").serialize();
							$.ajax({
								url : "adNtAction/update",
								type : "POST",
								dataType : "json",
								data : params,
								success : function(res){
									console.log(res);
									
									switch(res.msg){
									case "success" : 
										location.href = "adNtList"
										break;
									case "fail" :
										makeAlert("알림", "수정에 실패하였습니다.")
										break;
									case "error" :
										makeAlert("알림", "수정 중 문제가 발생하였습니다.")
										break;
									}
								},
								error : function(request, status, error){
									console.log(request.responseText);
								}
							});
						}else{
							makeAlert("알림", "파일 업로드에 문제가 발생하였습니다.");
						}
					}, 
					error : function(){
						makeAlert("알림", "파일 업로드에 문제가 발생하였습니다.");
					}
				});
				
			form.submit();
			}
			
	});
	
	// 목록버튼
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
					<span class="material-icons"> notifications </span> 알림 <span
						class="material-symbols-outlined" id="logoutBtn">
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
							edit_square </span>공지사항 수정
					</div>
					<!-- 파일업로드 폼 -->
					<form action="fileUploadAjax" id="actionForm" method="post"
						enctype="multipart/form-data">
						<input type="hidden" id="no" name="no" value="${param.no}"/>
						<input type="hidden" name="attFile" id="attFile" /> 
						<input type="hidden" name="memberNo" id="memberNo" value="${sMemNo}" />
				


						<!-- 메인 띄우기 -->
						<div id="Ctitle">
							<div class="CTN">메인으로 띄우기</div>
							<div class="checkbox">
								<input type="checkbox" id="mainCheck" name="mainCheck" value="0" class="commentBoxT"> 
								<input type="hidden" id="mainCheck_hidden" name="mainCheck" value="1">
							
							
							</div>
						</div>

						<!-- 제목 -->
						<div id="Ctitle" style="margin-bottom: 5px;">
							<div class="CTN">제목</div>
							<div class="CTC">
								<input type="text" name="title" id="title" class="commentBoxT"
									value="${data.TITLE}">
							</div>
						</div>


						<!-- 글 내용 -->
						<textarea rows="30" cols="60" name="contents" id="contents"
							class="textarea">${data.CONTENTS }</textarea>


						<!-- 파일 첨부 -->
						<div class="filWrap">
							<div class="filNm"></div>
							<div class="filBox">
								<c:choose>
									<c:when test="${empty data.ATT_FILE}">
										<!-- 파일 없을때 -->
										<input type="file" class="file" name="attFile" />
										
										<input type="hidden" name="imgFile" id="imgFile" />
									</c:when>
									<c:otherwise>
										<!-- 파일 있을때 -->

										<span class="attOld">
											<!-- 기존파일 --> 
											<span> 
											<!-- fn:length(대상) : 대상 문자열의 길이나 배열, 리스트의 크기를 가져온다. -->

												<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
												<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
												<c:set var="fileName"
													value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
												${fileName}
										</span> 
										<span class="fileDelBtn">파일삭제</span>
										</span>

										<span class="imgFile"> <!-- 기존파일 삭제후 새파일 용도 --> <input
											type="file" class="file" name="attFile" /> <input
											type="hidden" name="imgFile" id="imgFile"
											value="${data.ATT_FILE}" />
										
										</span>
									</c:otherwise>
								</c:choose>

							</div>

						</div>

					</form>
					<!-- 버튼 -->
					<div id="buttons">
						<input type="button" id="updateBtn" name="updateBtn" value="수정" class="myButton" /> 
						<input type="button" id="listBtn" name="listBtn" value="목록" class="myButton" />
					</div>

				</div>
			</div>
		</div>


	</div>

</body>
</html>