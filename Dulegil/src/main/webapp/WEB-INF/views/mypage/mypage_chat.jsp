<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<link rel="stylesheet" href="resources/css/chat.css" />
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chatting{
			font-size: 20px;
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chatting .me{
			color: #F6F6F6;
			text-align: right;
		}
		.chatting .others{
			color: #FFE400;
			text-align: left;
		}
		.chatting p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			
		}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	var ws;
	wsOpen();
	
});
function wsOpen(){
	ws = new WebSocket("ws://" + location.host + "/Dulegil/chatting/"+$("#postNo").val());
	wsEvt();
}
	
function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 초기화 세팅하기
		console.log("웹소켓열림");
		
	}
	
	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			var d = JSON.parse(msg);
			if(d.type == "getId"){
				var si = d.sessionId != null ? d.sessionId : "";
				if(si != ''){
					$("#sessionId").val(si); 
				}
			}else if(d.type == "message"){
				if(d.sessionId == $("#sessionId").val()){
					$("#chatting").append("<p class='me'>나 :" + d.msg + "</p>");	
				}else{
					$("#chatting").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
				}
					
			}else{
				console.warn("unknown type!")
			}
		}
	}

	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
}

function send() {
	var option ={
			type: "message",
			postNo: $("#postNo").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#msg").val(),
			memNo : $("#memNo").val()
		}
		ws.send(JSON.stringify(option));
		$('#msg').val("");
}
</script>
</head>
<body>
	<!-- Header -->
	<c:import url="/header"></c:import>


	<!-- Container -->
	<div class="container-mypage">

	

		<div class="contents">
			
			<div class="mypage_contents">
				<div class="area_tit">
					<span>둘레길</span>
				</div>
				<div class="mypage_contents">
	
  <div id="container" class="container">
		<h1>채팅</h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="postNo" value="${postNo}">
		<input type="hidden" id="memNo" value="${sMemNo}">
		<input type="hidden" name="userName" id="userName" value="${sMemNm}">
		<div id="chatting" class="chatting">
		</div>
	
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input type="text" name="msg" id="msg" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
				</div>

			</div>
		</div>
</div>
		<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	 
  </body>
  </html>