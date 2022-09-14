<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>내 정보</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	


	});
});


function change_btn(e) {
   var btns = document.querySelectorAll(".btnbox");
   btns.forEach(function(btn, i) {
      if(e.currentTarget == btn) {
         btn.classList.add("active");
      }
      else {
         btn.classList.remove("active");
      }
   });
   console.log( e.currentTarget );
}
</script>
</head>
<body>
<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-mypage">

		<!-- Sidebar -->
		<div class="mypageBtn">
			<ul class="btnsBox">
				<a href="#">
				   <li><button class="btnbox active" onclick="change_btn(event)">내 정보</button></li>
				</a>
				<a href="mypagePasswordCheck">
				   <li><button class="btnbox" onclick="change_btn(event)">개인 정보 수정</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">게시글 관리</button></li>
				</a>
				<a href="#">
				  <li><button class="btnbox" onclick="change_btn(event)">댓글 관리</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">동행</button></li>
				</a>      
			</ul>
		</div>
		
		<!-- Contents -->
		<div class="contents">

			<input type="hidden" name="memNo" value="${sMemNo}">

			<div class="mypage_contents">
				<div class="area_tit">
					<span>내 정보</span>
				</div>
				<div class="mem_box">
					<div class="mem_profile">
						<img alt="" src="resources/images/sample3.png">
					</div>
					<div class="mem_info">
						<dl>
							
							<div>
								<dt>이름</dt>
								<dd>${data.NM}</dd>
							</div>
							<div>
								<dt>생년월일</dt>
								<dd>${data.DATE_BIRTH}</dd>
							</div>
							<div>
								<dt>성별</dt>
							<c:choose>
							<c:when test="${data.GENDER == 0}">
								<dd>남성</dd>
							</c:when>
							<c:otherwise>
								<dd>여성</dd>
							</c:otherwise>
							</c:choose>
							</div>
							<div>
								<dt>휴대전화</dt>
								<dd>${data.PHONE_NO}</dd>
							</div>
							<div>
								<dt>E-mail</dt>
								<dd>${data.EMAIL}</dd>
							</div>
							<div>
								<dt>주소</dt>
								<dd>${data.ADDRESS} ${data.DETAIL_ADDRESS}</dd>
							</div>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>