<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 등록</title>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("contents", {
		resize_enabled : false, 
        language : "ko", 
        enterMode : "2", 
        width : "800px", 
        height : 450
	});
	
	$("#cancelBtn").on("click", function() {
		location.href = "adEvt";
	});
	
	$("#insertBtn").on("click", function() { 
		$("#contents").val(CKEDITOR.instances['contents'].getData());
		var startDate = $('#startDt').val();    // 시작일
		var endDate = $('#endDt').val();        // 종료일  
		
		if($.trim($("#title").val()) == "") {
			makeAlert("알림", "제목을 입력하세요.", function() {
				$("#title").focus();
			});

		}else if ($("#startDt").val() == "") {
			makeAlert("알림", "시작일을 입력하세요.", function() {
				$("#startDt").focus();
			});

		}else if ($("#endDt").val() == "") {
			makeAlert("알림", "종료일을 입력하세요.", function() {
				$("#endDt").focus();
			});
			
		}else if (startDate > endDate) {
			makeAlert("알림", "시작일이 종료일보다 이후 일 수 없습니다.", function() {
				$("#endDt").focus();
			});
		}else if ($("#contents").val() == "") {
			makeAlert("알림", "내용을 입력하세요.", function() {
				$("#contents").focus();
			});

		}else {
			var params = $("#actionForm").serialize();  
			
			$.ajax({
				url:"adEvtAction/insert", 
				type: "POST", 
      			dataType: "json",
				data: params,
				success : function(res){ 
				console.log(res);
					switch(res.msg){
					case "success" :
						$("#page").val("1");
   	                    $("#searchgbn").val("0");
   	                    $("#searchTxt").val("");
						makeAlert("알림", "이벤트가 등록되었습니다.", function() {
							location.href="adEvt";
						}) ;
					break;
					case "fail" :
  						makeAlert("알림", "이벤트 등록에 실패하였습니다.")
					break;
  					case "error" :                     
   	                     makeAlert("알림", "이벤트 등록 중 문제가 발생하였습니다.")
					break;
					}
				},
   	            error : function(request, status, error) { 
   	                     console.log(request,responseText); 
   	            }
			});
		}
	});
});
</script>
</head>
<body>
	<form action="adEvt" id="backForm" method="post">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
	</form>
	
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_square </span>
			이벤트 등록
		</div>
		<div class="Ccon">
			<form action="#" id="actionForm" method="post">
				<table class="Cinput">
					<tr>
						<th>제목</th>
						<td><input type="text" id="title" name="title" /></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="date" id="startDt" name="startDt" /></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td><input type="date" id="endDt" name="endDt" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="contents" name="contents" class="textarea"></textarea></td>
					</tr>
				</table>
				<div class="Cbtncenter">
					<input type="button" value="취소" class="btn" id="cancelBtn" />
					<input type="button" value="등록" class="btn" id="insertBtn" /> 
				</div>
			</form>
		</div>
	</div>
</body>
</html>