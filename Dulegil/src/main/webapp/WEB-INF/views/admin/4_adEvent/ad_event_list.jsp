<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 달력 -->
<link href='resources/css/fullcalendar/main.css' rel='stylesheet' />
<title>이벤트 목록</title>
<style type="text/css">
#CCbox td{
	padding-top: 15px;
}
#evtTit:hover, #pBtn:hover{
	text-decoration: underline;
	cursor: pointer;
}
</style>
<!-- 달력 -->
<script src='resources/css/fullcalendar/main.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	$("#hdSearch").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	$("#paging").on("click", "span", function(){
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	$("tbody").on("click", "#evtTit", function(){
		$("#no").val($(this).parent().attr("no"));
		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","adEvtDtl");
		$("#actionForm").submit();
	});
	
	$("tbody").on("click", "#delChck", function(){
	      var arr = [];
	      $("#delChck:checked").each(function(){
			arr.push($(this).parent().parent().attr("no"));
	      });
	      $("#delNo").val(arr);
	});
	
	$("#evtDelBtn").on("click", function(){
		makePopup({
			title : "알림",
			contents : "삭제하시겠습니까?",
			buttons : [{
				name : "삭제",
				func:function() {
					var params = $("#actionForm").serialize();
					
					$.ajax({
						url:"adEvtAction/delete", 
						type:"POST", 
						dataType:"json", 
						data : params,
						success: function(res) { 
							switch (res.msg) {
							case "success":
								makeAlert("알림", "삭제가 완료되었습니다.", function(){
									location.href = "adEvt";
								});
								break;
							case "fail":
								makeAlert("알림", "삭제에 실패하였습니다.");
								break;
							case "error": 
								makeAlert("알림", "삭제 중 문제가 발행하였습니다.");
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
		});	
	});
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		contentHeight:"500px",
		events : {
		    url: 'evtListAjax',
		    method: 'POST',
		    failure: function(res) {
		        console.log(res.xhr.responseText);
		    }
		},
		
		headerToolbar : {
			left : 'title',
			center : '',
			right : 'evtreg_btn today prev,next'
		},
		
		customButtons : {
			evtreg_btn : {
				text : 'new event',
				id : 'evtReg',
				click : function() {
					location.href = "adEvtReg";
				}
			}
		}
	});
	calendar.render();
});

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adEvtListAjax", 
		type:"POST", 
		dataType:"json", 
		data : params,
		success: function(res) { 
			drawList(res.list);
			drawPaging(res.pd);
		}, 
		error: function(request, status, error) { 
			console.log(request.responseText); 
		}
	});
}	

function drawList(list) {
	var html = "";
	
	for(var data of list){ 
		html += "<tr no=\"" + data.POST_NO + "\">";
		html += "<td>" + data.POST_NO + "</td>";
		html += "<td id=\"evtTit\" style=\"width:50%;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">" + data.TITLE + "</td>";
		html += "<td>" + data.REG_DT + "</td>";
		html += "<td><input type=\"checkbox\" id=\"delChck\" value=\"" + data.POST_NO + "\" /></td>";
		html += "</tr>";
	}
	$("#ccboxCon").html(html); 
}

function drawPaging(pd) {
	var html = "";
	
	if($("#page").val() == "1" ) {
		html += "<span class=\"page_btn page_prev\" id=\"pBtn\" page=\"1\">이전</span>";
	}else {		
	html += "<span class=\"page_btn page_prev\" id=\"pBtn\" page=\"" + ($("#page").val() *1 -1 )+ "\">이전</span>";
	}
	
	for(var i = pd.startP; i<=pd.endP; i++){
		if($("#page").val() * 1 == i){
	html += "<span class=\"page_btn_on\" id=\"pBtn\" page=\"" + i + "\">" + i + "</span>";			
		}else{
	html += "<span class=\"page_btn\" id=\"pBtn\" page=\"" + i + "\">" + i + "</span>";			
		}
	}
	if($("#page").val() * 1 == pd.maxP){ 
		
	html += "<span class=\"page_btn page_next\" id=\"pBtn\" page=\"" + pd.maxP + "\">다음</span>";
	}else{		
	html += "<span class=\"page_btn page_next\" id=\"pBtn\" page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
	}
	
	$("#paging").html(html); 
}
</script>
</head>
<body>
	<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
	<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>
	
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note</span>
				이벤트 목록
			</div>
		</div>
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="no" name="no" />
			<input type="hidden" name="delNo" id="delNo" />
			<input type="hidden" name="page" id="page" value="${page}" />
			<div id="hd2_CC_left">
				<div id="calendar"></div>
			</div>	
			<div id="hd2_CC_right">
				<div id="search">
					<div class="Sbar1">
						<select class="sel" id="searchGbn" name="searchGbn">
							<option value="0">제목</option>
							<option value="1">내용</option>
						</select>
					</div>
					<div class="Sbar2">
						<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
					</div>
					<div class="Sbar3">
						<input type="button" id="hdSearch" value="검색" />
					</div>
				</div>
				<div id="CCbox">
					<table style="table-layout: fixed; width:500px;">
						<colgroup>
							<col width="50px">
							<col width="300px">
							<col width="100px">
							<col width="50px">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody id="ccboxCon"></tbody>
					</table>
				</div> 
				<div id="write">
					<input type="button" value="삭제" id="evtDelBtn" />
				</div>
				<div id="paging"></div>
			</div>
		</form>
	</div>
</body>
</html>