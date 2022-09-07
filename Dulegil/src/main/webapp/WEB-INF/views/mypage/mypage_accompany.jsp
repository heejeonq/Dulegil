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
<title>동행</title>
<script type="text/javascript"
      src="../jquery/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	$(".singo span").on("click", function(){
		if($(this).parent().children(".singo_contents").css("display") == "none"){
			$(this).parent().children(".singo_contents").css("display", "flex");
			//$(".singo_contents").show();		
		}
		else {
			$(this).parent().children(".singo_contents").hide();
		}
		
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
				<div class="mypage_area1">
					<div class="area_tit"><span>신청자 목록</span></div>
					<div class="join_user_list">
					<table class="standard">
						<tr>
							<th colspan="2">1코스</th>
							<th colspan="5">같이 둘레길</th>
						</tr>
							<tr>
							<td id=user_img><img src="../css/images/sample1.jpg"></td>
							<td id=user_id>신청자id</td>
							<td id=user_lvl>신뢰도</td>
							<td id=user_age>나이</td>
							<td>성별</td>
							<td><input type="button" value="수락" class="btn green">
								<input type="button" value="거절" class="btn green"></td>
						</tr>
					</table>
					<table class="standard">
						<tr>
							<th colspan="2">1코스</th>
							<th colspan="5">같이 둘레길</th>
						</tr>
							<tr>
							<td id=user_img><img src="../css/images/sample2.jpg"></td>
							<td id=user_id>신청자id</td>
							<td id=user_lvl>신뢰도</td>
							<td id=user_age>나이</td>
							<td>성별</td>
							<td><input type="button" value="수락" class="btn green">
								<input type="button" value="거절" class="btn green"></td>
						</tr>
					</table>
					</div>
				</div>
					<div class="mypage_area1">
					<div class="area_tit"><span>채팅 목록</span></div>
				<div class="chat_list">
					<ul class="standard">
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
						<li>동행게시판 글제목1
						</li>
							<input type="button" value="x"> 
					</ul>
				</div>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>내가 신청한 동행</span></div>
					<table class="standard">
						<tbody>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>ID</th>
								<th>상태</th>
								<th>신청 일자</th>
							</tr>
							<tr>
								<td>1</td>
								<td>1코스</td>
								<td>수락산 둘레길 동행해요</td>
								<td>gmlwjd123</td>
								<td>신청중</td>
								<td>2022.07.01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 history</span></div>
					<table class="standard">
						<tbody>
							<tr>
								<th>No</th>
								<th>코스</th>
								<th>글 제목</th>
								<th>동행자들</th>
								<th>동행 일자</th>
							</tr>
							<tr>
								<td>1</td>
								<td>4코스</td>
								<td>동행 해요</td>
								<td>tmfdk123, tndud123, tldnjs123, auddn123</td>
								<td>2022.03.01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mypage_area">
					<div class="area_tit"><span>동행 상대 평가</span></div>
					<table class="user_rate">
						<tr>
							<th colspan="6"  id=join_title>같이 둘레길1</th>
						</tr>
						<tr>
							<td rowspan="2" id="user_img"><img src="../css/images/sample1.jpg"></td>
							<td id="user_id" class="item">에디님</td>
							<td></td>
							<td></td>
							<td></td>
							<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱" name="singo">성희롱</label>
										<label><input type="radio" value="욕설" name="singo">욕설</label>
										<label><input type="radio" value="악의적 비방" name="singo">악의적</label>
										<label><input type="radio" value="스팸(광고)" name="singo">스팸(광고)</label>
										<label><input type="radio" value="기타" name="singo">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="startRadio">
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 1개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 2개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 3개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 4개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 5개</span></span>
									</label>
									<label class="startRadio__box">
										<input type="radio" name="star" id="">
										<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
									</label>
								</div>
							</td>
							<td><input type="button" value="완료" class="btn green"></td>
							<td></td>
							<td></td>
						</tr>
				</table>
					<table class="user_rate">
							<tr>
								<th colspan="6"  id=join_title>같이 둘레길2</th>
							</tr>
							<tr>
								<td rowspan="2" id="user_img"><img src="../css/images/sample2.jpg"></td>
								<td id="user_id" class="item">뽀로로님</td>
								<td></td>
								<td></td>
								<td></td>
								<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱">성희롱</label>
										<label><input type="radio" value="욕설">욕설</label>
										<label><input type="radio" value="악의적 비방">악의적</label>
										<label><input type="radio" value="스팸(광고)">스팸(광고)</label>
										<label><input type="radio" value="기타">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="startRadio">
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
										</label>
									</div>
								</td>
								<td><input type="button" value="완료" class="btn green"></td>
								<td></td>
								<td></td>
							</tr>	
							<tr>
								<td rowspan="2" id="user_img"><img src="../css/images/sample3.png"></td>
								<td id="user_id" class="item">루피님</td>
								<td></td>
								<td></td>
								<td></td>
								<td class="singo"><span>...</span>
									<div class="singo_contents">
										<label><input type="radio" value="성희롱">성희롱</label>
										<label><input type="radio" value="욕설">욕설</label>
										<label><input type="radio" value="악의적 비방">악의적</label>
										<label><input type="radio" value="스팸(광고)">스팸(광고)</label>
										<label><input type="radio" value="기타">기타</label>
										<input type="button" value="신고">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="startRadio">
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5개</span></span>
										</label>
										<label class="startRadio__box">
											<input type="radio" name="star" id="">
											<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
										</label>
									</div>
								</td>
								<td><input type="button" value="완료" class="btn green"></td>
								<td></td>
								<td></td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>