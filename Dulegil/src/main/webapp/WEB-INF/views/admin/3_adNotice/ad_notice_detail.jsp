<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 상세</title>
<style type="text/css">
.btn.list{
	float: right;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	// 목록 버튼
	$("#backListBtn").on("click", function(){
		$("#detailForm").attr("action", "adNtList");
		$("#detailForm").submit();
	})
	
	
	// 수정 버튼
	$("#updateBtn").on("click", function(){
		//$("#no").val($(this).attr("no"));
		$("#detailForm").attr("action", "adNtUpdate");
		$("#detailForm").submit();
		
	})
	
	// 삭제 버튼
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
	
	// 디테일 그리기 function
	function drawDetail(detail){
		var html = "";
		
		for(var data of detail){
			// "+ +"
			html += "<tr no=\""+ data.POST_NO +"\">                ";
			html += "	<td colspan=\"1\">"+ data.POST_NO +"</td>  ";
			html += "	<td colspan=\"6\">"+ data.TITLE +"</td>  ";
			html += "	<td colspan=\"1\">"+ data.NM +"</td>  ";
			html += "	<td colspan=\"1\">"+ data.REG_DT +"</td>  ";
			html += "	<td colspan=\"1\">"+ data.HIT +"</td>  ";
			html += "</tr>                            ";
			
			html += "<div no=\""+ data.POST_NO +"\" id=\"gongzi\"> ";
			html += "	<a>"+ data.CONTENTS +"</a>                 ";
			html += "</div>                                        ";
		}
		$("tbody").html(html);
		$("#gongzi").html(html);
		
	}
	
	
	
	
});
</script>
</head>
<body>
	<form id="detailForm" action="#" method="post">
		<input type="hidden" id="no" name="no" value="${data.POST_NO}"/>
		<input type="hidden" name="page" id="page" value= "${param.page}" />
		<input type="hidden" id="oldGbn" value="${param.searchGbn}"/>
		<input type="hidden" id="oldTxt" value="${param.searchTxt}"/>
	</form>
	
	<jsp:include page="../adHeader.jsp" flush="true"/>

		<div class="container">
			<div class="Cname">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note </span>
				공지사항
			</div>
			<div class="Cbtn">
				<input type="button" id="backListBtn" class="btn list" value="목록" />
			</div>
			<div class="Ccon">
				<div class="Cdeailtable">
					<table>
						<thead>
							<tr no="${data.POST_NO}">
								<th colspan="7" style="font-size: 13pt; text-align: left;">${data.TITLE}</th>
							</tr>
							<tr>	
								<th></th>
								<th>작성자 : </th>
								<td>${data.NM}</td>
								<th>작성일 : </th>
								<td>${data.REG_DT}</td>
								<th>조회수 : </th>
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