<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/calendar.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>전체일정</title>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
  
	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">둘레길 전체 일정</div>
			<div class="col"></div>
			
			<div class="calendarWrap">
				<div class="monthPrev">←</div>
				<div class="month">2022.08</div>
				<div class="monthNext">→</div>
				<p>둘레길에서 진행되는 행사 및 프로그램 일정을 확인 할 수 있습니다.</p>
				
				<div class="calendar"></div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>