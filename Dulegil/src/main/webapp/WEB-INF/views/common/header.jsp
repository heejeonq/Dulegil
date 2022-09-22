<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/mainCon.css" />


<script type="text/javascript">
$(document).ready(function(){
	// 로그인/로그아웃	
	$("#logout").on("click", function(){
		location.href ="logout";
	});
	
	$("#login").on("click", function(){
		location.href = "login";
	});
	
	
	
	//알람 버튼
	$(".alarm").on("click", function(){
		if($(".alarm_contents").css("display") == "none"){
			$(".alarm_contents").show();
			
			
		}
		else {
			$(".alarm_contents").hide();
		}
		
		
		
	});
});
</script> 

<!-- Header -->
	<div class="header">
		<div class="util">
			<ul>
			<c:choose>
				<c:when test="${empty sMemNm}"><!-- el태그의 empty : 해당 값이 비어있는지 확인 -->
					
					<li><a href="login" id="login"> 로그인 </a></li>
					<li>
						<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
						<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
						</svg>
					</li>
					<li><a href="join"> 회원가입 </a></li>
				</c:when>
				<c:otherwise>
					<li><a href="logout" id="logout"> 로그아웃 </a></li>
					<li>
						<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
						<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
						</svg>
					</li>
				<li><a href="mypageMyinfo"> 마이페이지 </a></li>
				<li>
				<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
				<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
				</svg>
				</li>
				<li class="alarm"><img src="resources/images/notification.png" class="alarm_img"><span class="alarm_num">${cnt}</span>
					<div class="alarm_contents">
						<ul> 
							<c:forEach var="d" items="${data}">
								<li>${d.MNM}님이 동행을 신청하였습니다</li>
							</c:forEach>
						</ul>
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
					<span>서울둘레길</span>
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
