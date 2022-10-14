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
			    width: 70%;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			font-size: 20px;
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chatting{
			font-size: 20px;
			border: 1px solid #7d7d7d7d;
			height: 500px;
			overflow: auto;
			border-radius: 5px;
		}
		.sendMsg input{
			height: 35px;
    		width: 90%;
    		border: 1px solid #7d7d7d7d;
    		padding: 10px;
    		border-radius: 5px;
  			margin-top: 10px;

		}
		.sendMsg button {
			height: 38px;
    		top: 2px;
    		width: 9%;
    		margin-left: 1%;
    		border-radius: 5px;
		}
		.chat_box.me {
    		margin-right: 10px;
		}
		.chat_box.others {
    		margin-left: 10px;
		}
		.me .from {
			color: #4A4A4A;
		    font-size: 13px;
		    display: block;
		    width: 100%;
		    float: left;
		    text-align: right;
			margin-top: 5px;
		}
		.me .message {
			font-size: 15px;
		    float: right;
		    background: #efc318;
		    color: #FFF;
		    border-radius: 10px;
		    padding: 10px;
		    margin-top: 5px;

		}
		.others .from {
			color: #4A4A4A;
		    font-size: 13px;
		    display: block;
		    width: 100%;
		    float: left;
		    text-align: left;
		    margin-top: 5px;
		}
		.others .message {
			font-size: 15px;
		    float: left;
		    background: #fffce1;
		    color: #000;
		    border-radius: 5px;
		    margin-top: 5px;
		    padding: 10px;
		}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
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

		//스크롤 자동으로 하단
		let chatScroll = document.querySelector('#chatting');
		chatScroll.scrollTop = chatScroll.scrollHeight;
		console.log(chatScroll.scrollTop);

		console.log(ws);
		console.log(data);
		

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
				let today = new Date();//현재 시간받아옴
				let min = today.getMinutes(); // 분 받아옴
				min = min.toString(); //문자열로 변환
				min = min.padStart(2, '0'); //'01'분 형식으로 변환
				let time = today.getHours() + ":" + min; //hh:mm
				if(d.sessionId == $("#sessionId").val()){
					var myMessage ="";
					
					myMessage += "<div class='chat_box me'>";
					myMessage += 	"<div class='message'>"+ d.msg + "</div>";	
					myMessage += 	"<div class='from'>"+ time+" ${sMemNm}</div>";
					myMessage += "</div>";
					$("#chatting").append(myMessage);	
				}else{
					var othersMessage ="";
					othersMessage += "<div class='chat_box others'>";
					othersMessage += 	"<div class='message'>"+ d.msg + "</div>";	
					othersMessage += 	"<div class='from'>" + d.userName + " "+ time+"</div>";
					othersMessage += "</div>";
					
					$("#chatting").append(othersMessage);
				}
					
			}else{
				console.warn("unknown type!")
			}
			
			//스르롤 자동으로 하단
			let chatScroll = document.querySelector('#chatting');
			chatScroll.scrollTop = chatScroll.scrollHeight;
	
	 
		}
	}

	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
}

function send() {
	let msg = $("#msg").val();
	if(msg != "" && msg != null){
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
}

function reloadList() {
	var params = $("#chatForm").serialize();
	
	console.log(params);
	$.ajax({
		url : "chatMsgList", //경로
		type : "POST", //전송방식
		dataType : "json", //데이터 형태
		data : params, //보낼 데이터
		success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
			drawList(res.list);
		},
		error : function(request, status, error) {
			console.log(request.responseText); //실패 상세 내역
		}
	});
		
		
}
function drawList(list){
	var html = "";
	
	for(var data of list){
		if(data.MEMBER_NO == ${sMemNo}){
			html += "<div class='chat_box me'>";
			html += 	"<div class='message'>"+ data.CONTENTS + "</div>";	
			html += 	"<div class='from'>"+data.REG_DT+ " "+ data.NM +"</div>";
			html += "</div>";
		}
		else{
			html += "<div class='chat_box others'>";
			html += 	"<div class='message'>"+ data.CONTENTS + "</div>";	
			html += 	"<div class='from'>"+ data.NM +" "+data.REG_DT+ "</div>";
			html += "</div>";
		}
	}
	$("#chatting").html(html);
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
					<span>채팅방</span>
				</div>
				<div class="mypage_contents">
	
  <div id="container" class="container">
		<h1>'${title}' 채팅방</h1>
		<form action="#" id="chatForm">
			<input type="hidden" id="sessionId" value="">
			<input type="hidden" name="postNo" id="postNo" value="${postNo}">
			<input type="hidden" name="memNo" id="memNo" value="${sMemNo}">
			<input type="hidden" name="userName" id="userName" value="${sMemNm}">
			<input type="hidden" name="postMemNo" id="postMemNo" value="${postMemNo}">
		
		</form>
		<div id="chatting" class="chatting">
		</div>
		<div class="sendMsg">
			<input type="text" name="msg" id="msg" placeholder="보내실 메시지를 입력하세요.">
			<button onclick="send()" id="sendBtn" class="btn green">보내기</button>
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