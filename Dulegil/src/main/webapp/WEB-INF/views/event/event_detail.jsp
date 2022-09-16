<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체일정상세</title>
<link rel="stylesheet" href="resources/css/event.css" />
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
	<jsp:include page="../common/header.jsp" flush="true"/>
  
	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">둘레길 전체 일정</div>
			<div class="col"></div>
		
			<table class="evt">
				<colgroup>
					<col style="width:840px;">
					<col style="width:150px;">
					<col style="width:130px;">
					<col style="width:80px;">
				</colgroup>
				<thead class="evtTit">
					<tr>
						<th id="evtMainTit" colspan="4">${E.TITLE}</th>
					</tr>
					<tr id="dh">
						<td></td>	
						<td>작성자:${M.NM}</td>
						<td>등록일:${E.REG_DT}</td>
						<td>조회수:${E.HIT}</td>
					</tr>
				</thead>
				
				<tbody class="evtCon">
					<tr>
						<td>${E.CONTENTS}</td>
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