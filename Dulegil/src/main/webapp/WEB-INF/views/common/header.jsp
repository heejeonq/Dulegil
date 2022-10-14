<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<script type="text/javascript">
$(document).ready(function(){
	
	$("#login").on("click", function(){
		location.href = "login";
	});
	
	// 로그인/로그아웃	
	$("#logout").on("click", function(){
		location.href ="logout";
	});
	
	//알림 개수는 숨긴다.
	$(".alarm_num").hide();
	//만약 회원 이름의 값이 공백이 아니거나 널 값이 아니면(로그인 된 상태면) 
	if($("#memNo").val() != "" && $("#memNo").val() != null){
		//종모양과 알림 개수를 보여줌.
		alarm("alarm");		
	}else{
	}
	
	//알람 버튼 누르면
	$(".alarm").on("click", function(){
		//만약 알람 내용의 css가 ﻿style="display: none;"이었으면
		if($(".alarm_contents").css("display") == "none"){
			//block으로 바뀌니 내용을 보여주고, 알림 체크가 된다. 
			$(".alarm_contents").show();
			alarm("alarmCheck");	
		}
		else {//block이었으면 none으로 바뀌고 내용이 보이지 않게 숨긴다.
			$(".alarm_contents").hide();
		}
	});
});


function alarm(flag){
	var params = $("#alarmForm").serialize();   
	
	//알림 체크가 되었을때
	if(flag == "alarmCheck"){

	      $.ajax({
	         url:"alarm/" + flag,
	         type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
	         dataType: "json", //
	         data: params, //json 으로 보낼데이터
	         success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행        
	        	 drawAlarm(res.cnt, res.list);
	         },
	         error :function(request, status, error) { //실패했을 때 함수 실행 isfp
	            console.log(request.responseText); //실패 상세내역
	         }
	         });
	}
	else{
	
      $.ajax({
          url:"alarm/"+ flag,
          type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
          dataType: "json", //
          data: params, //json 으로 보낼데이터
          success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행        
       			drawAlarm(res.cnt, res.list);
          },
          error :function(request, status, error) { //실패했을 때 함수 실행 isfp
             console.log(request.responseText); //실패 상세내역
          }
          });
	}
      
}

function drawAlarm(cnt, list){
	//cnt(알림 개수)가 0이 아니면
	if(cnt != "0"){
		//알림 개수를 보여준다.
		$(".alarm_num").show();
	}
	else {//아니면 숨긴다
		$(".alarm_num").hide();
	}
	$(".alarm_num").html(cnt);
	
	let html = "";
	
	for(let data of list){
		html += "<div class = \"alarmMsg\">"; //동행 신청 게시글 번호       //신청한 사람 이름
		html += "<li id=\"nmAlarm\" postNo=\"" + data.POST_NO + "\">[" +data.NM + "]님이 동행을 신청하였습니다.</li>";
		html += "<li id=\"regDtAlarm\" postNo=\"" + data.POST_NO + "\">" +data.REG_DT + "</li>";		
		html += "</div>";
	}
	$(".alarm_contents").html(html);
}
</script> 

<!-- Header -->
	<div class="header">
	<form action="#" id="alarmForm">
		<input type="hidden" name="memNo" id="memNo" value="${sMemNo}">
	</form>
		<div class="util">
			<ul>
			<c:choose>
				<%-- el태그의 empty : 해당 값이 비어있는지 확인 sMemNm가 없으면(로그인 되어있지 않으면) --%>
				<c:when test="${empty sMemNm}">
					<%-- 로그인과 회원가입을 보여줌. --%>
					<li><a href="login" id="login"> Login </a></li>
					<li>
						<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
						<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
						</svg>
					</li>
					<li><a href="join"> join </a></li>
				</c:when>
				<%-- 그렇지 않으면 로그아웃과 마이페이지, 알림을 보여줌 --%> 
				<c:otherwise>
					<li><a href="logout" id="logout"> Logout </a></li>
					<li>
						<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
						<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
						</svg>
					</li>
				<li><a href="mypageMyinfo"> MyPage </a></li>
				<li>
				<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
				<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
				</svg>
				</li>
				<li class="alarm"><img src="resources/images/notification.png" class="alarm_img"><span class="alarm_num"></span>
					<!-- 알림창 내용 -->
					<div class="alarm_contents">
					</div>
				</li>	
				</c:otherwise>
			</c:choose>
			</ul>
			
		</div>
		<!-- Nav -->
		<div class="nav">
			<div class="logo">
				<a href="main"> <img alt="서울둘레길 로고" src="resources/images/direction.png">
					<span>같이둘레</span>
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="notice"> 둘레길 도우미</a>

						<ul class="gnb_dropdown">
							<li><a href="notice"> 공지사항 </a></li>
							<li><a href="faq"> FAQ </a></li>
						</ul></li>
					<li><a href="course1"> 둘레길 코스안내</a>

					<li><a href="event"> 전체일정</a>

					<li><a href="bestReviewGallery"> 명예의 전당</a></li>
					<li><a href="courseReview"> 커뮤니티</a>

						<ul class="gnb_dropdown">
							<li><a href="courseReview"> 코스별 후기 </a></li>
							<li><a href="accompany"> 동행구하기 </a></li>
							<li><a href="freeBoard"> 자유게시판 </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
