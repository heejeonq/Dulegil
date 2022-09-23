<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/event.css" />
<title>전체일정</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function(){
		location.href='event';
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
			<div class="tit">둘레길 전체 일정</div>
			<p>둘레길에서 진행되는 행사 및 프로그램 일정을 확인 할 수 있습니다.</p>
			<div class="col"></div>
			<%-- <form action="#" id= "actionForm" method="post">
				<input type="hidden" name="no" value="${data.POST_NO}" />
			</form> --%>
			<table class="evt">
				<colgroup>
					<col style="width:910px;">
					<col style="width:100px;">
					<col style="width:120px;">
					<col style="width:70px;">
				</colgroup>
				<thead class="evtTit">
					<tr>
						<th id="evtMainTit" colspan="4">${data.TITLE}</th>
					</tr>
					<tr id="dh">
						<td></td>	
						<td>작성자&nbsp;:&nbsp;${data.NM}</td>
						<td>등록일&nbsp;:&nbsp;${data.REG_DT}</td>
						<td>조회수&nbsp;:&nbsp;${data.HIT}</td>
					</tr>
				</thead>
				
				<tbody class="evtCon">
					<tr>
						<td colspan="4">${data.CONTENTS}</td>
					</tr>
				</tbody>
			</table>
			<div class="col"></div>
			
			<div class="btn">
				<input type="button" id="listBtn" value="목록">
			</div>
		</div>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>