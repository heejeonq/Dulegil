<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="../css/mypage.css" />
<link rel="stylesheet" href="../css/fonts.css" />
<link rel="stylesheet" href="../css/common.css" />
<title>내 정보</title>
<script type="text/javascript">
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
				<a href="#">
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
			<div class="mypage_contents">
				<div class="area_tit">
					<span>내 정보</span>
				</div>
				<div class="user_box">
					<div class="user_profile">
						<img alt="" src="../css/images/sample3.png">
					</div>
					<div class="user_info">
						<dl>
							
							<div>
								<dt>이름</dt>
								<dd>구디아카데미</dd>
							</div>
							<div>
								<dt>생년월일</dt>
								<dd>2022.05.09</dd>
							</div>
							<div>
								<dt>성별</dt>
								<dd>여성</dd>
							</div>
							<div>
								<dt>휴대전화</dt>
								<dd>010-1234-5678</dd>
							</div>
							<div>
								<dt>E-mail</dt>
								<dd>goodee0205@gmail.com</dd>
							</div>
							<div>
								<dt>주소</dt>
								<dd>서울특별시 금천구 가산동 가산디지털2로 115 대륭테크노타운3차 1109-1호</dd>
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