<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 상세</title>
<style type="text/css">
.btn.list{
	float: right;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#backListBtn").on("click", function() {
		$("#actionForm").attr("action", "adEvt");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "adEvtUpd");
		$("#actionForm").submit(); 
	});
	
	$("#deleteBtn").on("click", function() {
		makePopup({
			title : "알림",
			contents : "삭제하시겠습니까?",
			buttons : [{
				name : "삭제",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url:"adEvtAction/deleteDetail", 
						type:"POST", 
						dataType:"json", 
						data : params,
						success: function(res) { 
							switch (res.msg) {
							case "success":
								makeAlert("알림", "삭제가 완료되었습니다.", function(){
									closePopup();
									location.href = "adEvt";
								});
								break;
							case "fail":
								makeAlert("알림", "삭제에 실패하였습니다.");
								closePopup();
								break;
							case "error": 
								makeAlert("알림", "삭제 중 문제가 발행하였습니다.");
								closePopup();
								break;
							}
						}, 
						error: function(request, status, error) { 
							console.log(request.responseText); 
						}
					});
				}
			}, {
				name : "취소"
			}]
		})
	});
});
</script>
</head>
<body>
	<form action="#" id= "actionForm" method="post">
		<input type="hidden" id="no" name="no" value="${data.POST_NO}" />
		<input type="hidden" name="page" id="page" value= "${param.page}" />
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
	</form>
				
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note</span> 
			이벤트 상세보기
		</div>
		<div class="Cbtn">
			<input type="button" class="btn list" id="backListBtn" value="목록" />
		</div>
		<div class="Ccon">
			<div class="Cdeailtable">
				<table>
					<colgroup>
							<col width="370">
							<col width="80">
							<col width="70">
							<col width="130">
							<col width="200">
							<col width="80">
							<col width="50">
						</colgroup>
					<thead>
						<tr no="${data.POST_NO}">
							<th colspan="7" style="font-size: 13pt; text-align: left;">${data.TITLE}</th>
						</tr>
						<tr>
							<th></th>
							<th>작성자</th>
							<td>${data.NM}</td>
							<th>이벤트 기간</th>
							<td>${data.EVENT_START_DT} ~ ${data.EVENT_END_DT}</td>
							<th>조회수</th>
							<td>${data.HIT}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="7" id="Cdetail" style="text-align: left">${data.CONTENTS}</td>
						</tr>
					</tbody>
				</table>
				<div class="Cbtnright">
					<input type="button" id="deleteBtn" value="삭제" class="btn" />
					<input type="button" id="updateBtn" value="수정" class="btn" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>