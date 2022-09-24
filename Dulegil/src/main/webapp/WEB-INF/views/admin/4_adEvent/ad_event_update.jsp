<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 수정</title>
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
</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("contents", {
		resize_enabled : false, 
        language : "ko", 
        enterMode : "2", 
        width : "800px", 
        height : 450
	});
	
	$("#updBtn").on("click", function() {
		$("#ct").val(CKEDITOR.instances['ct'].getData());
		var startDate = $('#startDt').val();    // 시작일
		var endDate = $('#endDt').val();        // 종료일  
		
		if($.trim($("#tit").val()) == "") {
			makeAlert("알림", "제목을 입력하세요.", function() {
				$("#tit").focus();
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
				url:"adEvtAction/update", 
				type: "POST", 
      			dataType: "json",
				data: params,
				success : function(res){ 
				console.log(res);
					switch(res.msg){
					case "success" :
						makeAlert("알림", "수정이 완료 되었습니다.", function() {
							$("#BackForm").submit();
						});
					break;
					case "fail" :
  						makeAlert("알림", "수정에 실패하였습니다.")
					break;
  					case "error" :                     
   	                     makeAlert("알림", "수정 중 문제가 발생하였습니다.")
					break;
					}
				},
   	            error : function(request, status, error) { 
   	                     console.log(request,responseText); 
   	            }
			});
		}
	});
	
	$("#canBtn").on("click", function() {
		location.href = "adEvt";
	});
});
</script>
</head>
<body>
	<form action="adEvtDtl" id="BackForm" method="post">
		<input type="hidden" name="no" value="${data.POST_NO}" />
		<input type="hidden" name="page" id="page" value= "${param.page}" />
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
	</form>
	
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_calendar</span>
			이벤트 수정
		</div>	
		<div class="Ccon">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" id="no" name="no" value="${data.POST_NO}" />
				<table class="Cinput">
					<tr>
						<th>제목</th>
						<td><input type="text" id="tit" name="tit" value="${data.TITLE}" /></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="date" id="startDt" name="startDt" value="${data.EVENT_START_DT}" /></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td><input type="date" id="endDt" name="endDt" value="${data.EVENT_END_DT}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="contents" name="contents" class="textarea">${data.CONTENTS}</textarea></td>
					</tr>
				</table>
			</form>	
			<div class="Cbtncenter">
				<input type="button" value="취소" class="btn" id="canBtn" />
				<input type="button" value="수정" class="btn" id="updBtn" /> 
			</div>
		</div>
	</div>
</body>
</html>