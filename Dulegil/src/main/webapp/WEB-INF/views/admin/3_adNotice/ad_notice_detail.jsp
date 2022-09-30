<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세보기</title>
<style type="text/css">
.btn.list{
	float: right;
}
#file_present{
	display: flex;
	align-items: center;
    flex-direction: row;
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	$("#backListBtn").on("click", function(){
		$("#detailForm").attr("action", "adNtList");
		$("#detailForm").submit();
	});
	
	$("#updateBtn").on("click", function(){
		//$("#no").val($(this).attr("no"));
		$("#detailForm").attr("action", "adNtUpdate");
		$("#detailForm").submit();
	});
	
	$("#deleteBtn").on("click", function(){
		makePopup({
			title : "알림",
			contents : "삭제 하시겠습니까?",
			buttons : [{
				name : "삭제",
				func :  function(){
					var params = $("#detailForm").serialize();
					
					$.ajax({
						url : "adNtAction/detailDelete",
						type : "POST",
						dataType : "json",
						data : params,
						success : function(res){
							switch(res.msg){
							case "success" :
								location.href = "adNtList"
								break;
							
							case "fail" :
								makeAlert("알림", "삭제에 실패했습니다.")
								break;
							
							case "exception" :
								makeAlert("알림", "삭제 중 문제가 발생했습니다.")
							}
						},
						error : function(request, status, error){
							console.log(request.responseText);
						}
					});
					closePopup();
				}
			},{
				name : "취소"
			}]
		})
	});
	
});
</script>
</head>
<body>
	
	<jsp:include page="../adHeader.jsp" flush="true"/>

		<div class="container">
			<form id="detailForm" action="#" method="post">
				<input type="hidden" id="no" name="no" value="${data.POST_NO}" />
				<input type="hidden" name="page" id="page" value= "${param.page}" />
				<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
				<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
			</form>
			<div class="Cname">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note </span>
				공지사항 상세보기
			</div>
			<div class="Cbtn">
				<input type="button" id="backListBtn" class="btn list" value="목록" />
			</div>
			<div class="Ccon">
				<div class="Cdeailtable">
					<table>
						<colgroup>
							<col width="590">
							<col width="80">
							<col width="70">
							<col width="80">
							<col width="100">
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
								<th>작성일</th>
								<td>${data.REG_DT}</td>
								<th>조회수</th>
								<td>${data.HIT}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="7" id="Cdetail" style="text-align: left">${data.CONTENTS}</td>
							</tr>
							<c:if test="${!empty data.ATT_FILE}">
								<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
								<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
									<tr>
										<th id="file_present" colspan="7">
											<span class="material-symbols-outlined" style="margin-right: 10px;">file_present</span>
											<a href = "resources/upload/${data.ATT_FILE}" download="${fileName}">${fileName}</a>
										</th>
									</tr>
							</c:if>
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