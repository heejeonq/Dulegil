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
<link rel="stylesheet" href="../css/chat.css" />
<title>채팅</title>
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
						   <li><button class="btnbox" onclick="change_btn(event)">내 정보</button></li>
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
						   <li><button class="btnbox active" onclick="change_btn(event)">동행</button></li>
						</a>      
						</ul>
					</div>
		<!-- Contents -->

		<div class="contents">
			
			<div class="mypage_contents">
				<div class="area_tit">
					<span>둘레길</span>
				</div>
				<div class="mypage_contents">
						
		<form method="post" id="readForm">
			<input type="hidden" id="lastChatNo" name="lastChatNo" value="${maxNo}"/>
		</form>
		<div class="wrap">
			<div class="settingArea">
				<div class="btn green" id="outBtn">나가기</div>
				<span class="scroll_check_wrap">
				<input type="checkbox" id="autoScroll" checked="checked" />자동스크롤
				</span>
			</div><br/>
			<div class="chatContents">
			</div><br/>
			<div class="settingArea">
				<form method="post" id="insertForm">
					<input type="hidden" name="nick" value="${userNick}"/>
					<input type="hidden" id="contents" name="contents" value="${userNick}"/>
				</form>
				<span>${userNick} 아이디</span>
				<input type="text" id="message" size="50" onkeydown="enterCheck();"/>
				<div class="btn green" id="insertBtn">입력</div>
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