<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성</title>
<style type="text/css">
.filbox{
	text-align: left;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace("contents", {
		resize_enabled : false, 
        language : "ko", 
        enterMode : "2", 
        width : "800px", 
        height : 450
	});
	
	$("#insertBtn").on("click", function() {
	    $("#contents").val(CKEDITOR.instances['contents'].getData())

			if($.trim($("#title").val()) == "") {
				makeAlert("알림", "제목을 입력하세요.", function() {
					$("#title").focus();
				});
			}else if ($("#contents").val() == "") {
				makeAlert("알림", "내용을 입력하세요.", function() {
					$("#contents").focus();
				});
			}else {
	   	 		//1.파일 업로드 ->  2.업로드 파일명 취득->  3. 글 저장
				var form = $("#actionForm");
	   	 		// ajaxForm 적용
	   	 		form.ajaxForm({
	   	 			success:function(res){ // 데이터 주고받기 성공 시
	   	 				if(res.result =="SUCCESS"){//파일전송 성공
	   	 					//올라간 파일이 존재한다면
	   	 					if(res.fileName.length > 0){//배열의 갯수가 0보다 크다면
	   	 						$("#attFile").val(res.fileName[0]);//올라간 파일명 보관
	   	 					}
	   	 					/* 글 저장 */
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
												makeAlert("알림", "이벤트가 등록되었습니다.", function() {
													location.href = "adNtList"
												});
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
	
	$("#cancelBtn").on("click", function() {
	    history.back();
	 });
});
</script>
</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined " style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;">edit_square </span>
			공지사항 등록
		</div>
		<div class="Ccon">
			<form action="fileUploadAjax" id="actionForm" method="post" enctype="multipart/form-data">
				<!-- 실 저장된 파일명 보관용 -->
				<input type="hidden" name="attFile" id="attFile" />
				<input type="hidden" name="memberNo" id="memberNo" value="${sMemNo}" />
				
				<table class="Cinput">
					<tr>
						<th>필독여부</th>
						<td><input type="checkbox" id="mainCheck" name="mainCheck" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="contents" name="contents" class="textarea"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td class="filBox">
							<input type="file" name="attFile" id="attFile" />	
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="Cbtncenter">
			<input type="button" id="cancelBtn" value="취소" class="btn" />
			<input type="button" id="insertBtn" value="등록" class="btn" />
		</div>
	</div>
</body>
</html>