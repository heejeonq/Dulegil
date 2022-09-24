<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
<style type="text/css">
.Cinput{
	margin: 40px 10px 0;
    font-size: 11pt;
}

.Cinput tr{
	border: none;
}

.Cinput th {
	width: 60px;
    padding: 8px;
}

.Cinput input[type='text'], .Cinput input[type='date']{
	width: 100%;
    height: 35px;
    padding: 5px;
    border: none;
	border-bottom: 1px solid #ddd;
}

.Cinput input[type='date']{
	width: 40%;
}

input:focus {
	outline: none;
}

.filbox{
	text-align: left;
    margin-top: 10px;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace("contents", {
		resize_enabled : false, 
        language : "ko", 
        enterMode : "2", 
        width : "800px", 
        height : 450
	});
	
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
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined " style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;">edit_square</span>
			공지사항 수정
		</div>
		<div class="Ccon">
			<form action="fileUploadAjax" id="actionForm" method="post"
				enctype="multipart/form-data">
				<input type="hidden" id="no" name="no" value="${param.no}"/>
				<input type="hidden" name="attFile" id="attFile" /> 
				<input type="hidden" name="memberNo" id="memberNo" value="${sMemNo}" />
				<table class="Cinput">
					<tr>
						<th>필독여부</th>
						<td>
							<input type="checkbox" id="mainCheck" name="mainCheck" value="0" />
							<input type="hidden" id="mainCheck_hidden" name="mainCheck" value="1">
						</td> 
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title" value="${data.TITLE}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents" id="contents" class="textarea">${data.CONTENTS}</textarea></td>
					</tr>
					<tr>
						<th>파일첨부</th>
						<%-- <c:choose>
							<!-- 파일 없을 때 -->
							<c:when test="${empty data.ATT_FILE}">
								<td class="filBox">	
									<input type="file" name="attFile" id="attFile" />
									<input type="hidden" name="imgFile" id="imgFile" />
								</td>
							</c:when>
							<!-- 파일 있을때 -->
							<c:otherwise>
								<td class="filBox">
									<!-- 기존파일 --> 
									<span class="attOld">
										<!-- fn:length(대상) : 대상 문자열의 길이나 배열, 리스트의 크기를 가져온다. -->
										<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
										<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
										<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
											${fileName}
										<div class="fileDelBtn">파일삭제</div>
									</span>
									<span class="imgFile"> <!-- 기존파일 삭제후 새파일 용도 --> 
										<input type="file" name="attFile" id="attFile" /> 
										<input type="hidden" name="imgFile" id="imgFile" value="${data.ATT_FILE}" />
									</span>
								</td>
							</c:otherwise>
						</c:choose> --%>
					</tr>
				</table>
			</form>
		</div>
		<div class="Cbtncenter">
			<input type="button" id="listBtn" name="listBtn" value="취소" class="btn" />
			<input type="button" id="updateBtn" name="updateBtn" value="수정" class="btn" /> 
		</div>
	</div>
</body>
</html>