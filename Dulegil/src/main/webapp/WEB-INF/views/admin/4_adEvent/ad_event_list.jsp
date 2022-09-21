<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 달력 -->
<link href='resources/css/fullcalendar/main.css' rel='stylesheet' />
<title>이벤트 목록</title>
<!-- 달력 -->
<script src='resources/css/fullcalendar/main.js'></script>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".regBtn").on("click", function() {
		location.href = "adEvtReg";
	});
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		events : {
		    url: 'evtListAjax',
		    method: 'POST',
		    failure: function(res) {
		        console.log(res.xhr.responseText);
		    }
		}
	});
	calendar.render();
	
	
});
</script>
</head>
<body>
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined"
					style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">
					event_note </span>이벤트 목록
			</div>
		</div>
		<div id="hd2_CC_left">
			<div id="calendar" style="width: 500px"></div>
			<div id="write">
				<input type="button" value="이벤트 추가" class="regBtn" /> 
			</div>
		</div>	
		<div id="hd2_CC_right">
			<div id="search">
				<div class="Sbar1">
					<select class="sel">
						<option>카테고리</option>
						<option>제목</option>
						<option>내용</option>
					</select>
				</div>
				<div class="Sbar2">
					<input type="text" class="commentBoxT" />
				</div>
				<div class="Sbar3">
					<input type="button" id="hdSearch" value="검색" />
				</div>
			</div>
			<div id="CCbox">
				<table>
					<colgroup>
						<col width="50px">
						<col width="300px">
						<col width="100px">
						<col width="50px">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>글제목</th>
							<th>작성일</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>둘레길 걸어보자</td>
							<td>22.05.07</td>
							<td><input type="checkbox" /></td>
						</tr>
					</tbody>
				</table>
			</div> 
			<div id="page">
				<div id="hd2_paging">
					<div id="pBtn_GD">
						<input type="button" value="이전" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="1" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="2" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="3" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="4" class="pBtn" />
					</div>
					<div id="pBtn">
						<input type="button" value="5" class="pBtn" />
					</div>
					<div id="pBtn_GD">
						<input type="button" value="다음" class="pBtn" />
					</div>
				</div>
			</div>
			<div id="write">
				<input type="button" value="이벤트 삭제" class="delBtn" />
			</div>
		</div>
	</div>
</body>
</html>