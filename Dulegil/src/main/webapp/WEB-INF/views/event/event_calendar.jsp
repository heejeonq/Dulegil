<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/event.css" />
<link href='resources/css/fullcalendar/main.css' rel='stylesheet' />
<title>전체일정</title>
<script src='resources/css/fullcalendar/main.js'></script>
<script>
$(document).ready(function(){
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		events : {
		    url: 'evtListAjax',
		    method: 'POST',
		    failure: function(res) {
		        console.log(res.xhr.responseText);
		    }
		},
		eventClick: function(info) {
		    $("#no").val(info.event.extendedProps.post_no);
		    $("#actionForm").attr("action", "eventDtl");
		    $("#actionForm").submit();
		}
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
			<p>둘레길에서 진행되는 행사 및 프로그램 일정을 확인 할 수 있습니다.</p>
			<div class="col"></div>
			
			<div class="evtCal">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="no" name="no" />
					<div id="calendar"></div>
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>

</html>