<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min"></script>
 <script type="text/javascript">
$(document).ready(function (){
	
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
				<li><a href="#"> 로그인 </a></li>
				<li>
				<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
				<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
				</svg>
				</li>
				<li><a href="#"> 마이페이지 </a></li>
				<li>
				<svg width="4" height="7" fill="none" xmlns="http://www.w3.org/2000/svg" class="bBA0gi7mU5KrAmvhUBC_">
				<circle r="2" transform="matrix(1 0 0 -1 2 2)" fill="#1b1b1b"></circle>
				</svg>
				</li>
				<li class="alarm"><img src="resources/images/notification.png" class="alarm_img"><span class="alarm_num">1</span>
					<div class="alarm_contents">
						<ul>
							<li>abc123님이 동행을 신청하였습니다</li>
						</ul>
					</div>
				</li>
					
			</ul>
		</div>
		<!-- Nav -->
		<div class="nav">
			<div class="logo">
				<a href="#"> <img alt="서울둘레길 로고" src="resources/images/direction.png">
					<span>서울둘레길</span>
				</a>
			</div>
			<div class="gnb">
				<ul>
					<li><a href="#"> 둘레길 도우미</a>

						<ul class="gnb_dropdown">
							<li><a href="#"> 공지사항 </a></li>
							<li><a href="#"> FAQ </a></li>
						</ul></li>
					<li><a href="#"> 둘레길 코스안내</a>

					<li><a href="#"> 전체일정</a>

					<li><a href="#"> 명예의 전당</a></li>
					<li><a href="#"> 커뮤니티</a>

						<ul class="gnb_dropdown">
							<li><a href="#"> 코스별 후기 </a></li>
							<li><a href="#"> 동행구하기 </a></li>
							<li><a href="#"> 자유게시판 </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
