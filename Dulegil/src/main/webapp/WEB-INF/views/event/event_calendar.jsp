<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/calendar.css" />
<link href='resources/css/fullcalendar/main.css' rel='stylesheet' />
<title>전체일정</title>
<script src='fullcalendar/main.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth'
	});
	calendar.render();
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
			<div class="evt">
				<div class="mth">
					<input type="button" id="prevBtn" value="이전" />
					<p id="mthTit">2022.08</p>
					<input type="button" id="nxtBtn" value="다음" /><br/>
				</div>
				<p>둘레길에서 진행되는 행사 및 프로그램 일정을 확인 할 수 있습니다.</p>
				
				<div id='calendar'></div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>