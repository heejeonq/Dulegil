<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>member manage</title>
<style type="text/css">
/* 테이블 */
/* table  {
	border-collapse: collapse;
	margin-top: 30px;
	margin-bottom: 70px;
	color: #404040;
	box-shadow: 3px 3px 3px 0px #ebebeb;
	border-radius: 4px;
}

th, td {
	border-collapse: collapse;
	text-align: center;
	padding: 4px;
	color: #404040;
	font-weight: 500;
}

th:nth-child(12) {
	width: 70px;
}

th {
	width: 114px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}

td {
	font-size: small;
	border-bottom: solid 0.5px #ebebeb;
	padding: 8px;
}

td:nth-child(9) {
	position: relative;
	width: 10%;
}

.tr_td:hover {
	background-color: #ebebeb;
	font-weight: 700px !important;
}


#header2 #hd2_CC #CCbox #hide {
	padding: 56px 80px;
	margin: auto;
	width: 50%;
	height: 38%;
	font-size: 11px;
	position: absolute;
	background-color: rgb(254, 250, 239);
	background-color: rgb(231 231 231/ 26%);
	backdrop-filter: blur(30px);
	-webkit-backdrop-filter: blur(30px);
	border: 0px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	border-radius: 12px;
	-webkit-border-radius: 12px;
	color: #f5f5f1;
	width: 50%;
	height: 38%;
	font-size: 11px;
	position: absolute;
	background-color: rgb(254, 250, 239);
	background-color: rgb(231 231 231/ 26%);
	backdrop-filter: blur(30px);
	-webkit-backdrop-filter: blur(30px);
	border: 0px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-box-shadow: rgb(142 142 142/ 19%) 0px 6px 15px 0px;
	-webkit-border-radius: 12px;
	z-index: 10;

}

#show {
	font-size: 11px;
}

#hidebox {
	text-ailgn: center;
	text-align: -webkit-center;
}

.hb_left, .CB, .CBC {
	width: 100%;
	display: inline-block;
	font-size: 11px;
}

#tr_1 {
	font-size: 14px;
}

.CB {
	height: 40%;
	margin-top: 2%;
	color: #444;
}

.CBC {
	height: 20%;
	margin-top: 4%;
	border-top: solid 1px #dcdcdc;
}


.delBtn {
	background-color: #ededed;
	border-radius: 4px;
	border: 1px solid #f4f5ee;
	display: inline-block;
	cursor: pointer;
	color: #5e5e5e;
	font-weight: 600;
	font-size: 13px;
	padding: 7px 13px;
	text-decoration: none;
	margin-top: 4px;
}

.delBtn:hover {
	background-color: #ECECEC;
}

input:focus {
	outline: none;
}

.sel {
	border: none;
	outline: none;
	position: inherit;
	margin: auto;
	width: 100%;
	height: 100%;
	text-align: center;
}

#wrap .comment_icon {
	display: inline-block;
	width: 34px;
	height: 34px;
	border-radius: 100px;
	text-align: left;
	background: #f3cdd4;
}

#wrap .comment_nm {
	display: inline-block;
	width: 44px;
	height: 17px;
	color: #444;
	vertical-align: top;
	font-family: "Gothic A1";
	font-weight: 700;
}

.comment_box {
	display: inline-block;
	width: 70%;
	height: 68%;
	color: #444;
	margin: 10px 12px 0px 0px;
	text-align: left;
	font-family: "Gothic A1";
	font-weight: 500;
}

#wrap {
	display: inline-block;
	margin: 10px 12px 0px 0px;
	vertical-align: top;
}

.hide_table th {
	background: none;
	border-bottom: 1px solid #ccb;
} */ 
.sel{
	width: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
	});
	
	$(".Cpaging").on("click", "#pBtn", function(){
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		$("#page").val($(this).attr("page"));
	});
});
</script>
</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<!-- 기존 검색 내용 유지용 -->
		<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
		<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">person_off </span>
			신고 내역 관리
		</div>
		
		<form action="#" id="actionForm" method="post">
			<div class="Csearch">
				<input type="hidden" name="no" id="no" /> 
				<input type="hidden" name="page" id="page" value="${page}" />
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">카테고리</option>
					<option value="1">신고자 아이디</option>
					<option value="2">신고대상 아이디</option>
					<option value="3">신고 카테고리</option>
				</select>
				<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
				<input type="button" class="btn src" id="searchBtn" value="검색" />
			</div>	
		</form>
		<div class="Ccon">
			<div class="Ctable">			
				<table>
					<thead>
						<tr>
							<th></th>
							<th>번호</th>
							<th>신고 카테고리</th>
							<th>아이디</th>
							<th>신고자<br />아이디</th>
							<th>신고날짜</th>
							<th>게시글 카테고리</th>
							<th>항목</th>
							<th>처리여부</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>
								<div>
									<a href=#none id="show"
										onclick="if(hide.style.display=='none') {
											hide.style.display='';
											show.innerText='▲'
											
											} else {
												hide.style.display='none';
												show.innerText='▼'
												
											}">
											
											<span class="material-symbols-outlined"> arrow_drop_down </span></a>
									<div id="hide" style="display: none">
										<div id="hidebox">
											<div class="hb_left">
												<table class="hide_table">
													<thead>
														<tr>
															<th>번호</th>
															<th>게시판 카테고리</th>
															<th colspan='2'>글 제목</th>
															<th>작성자</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>POST_NO</td>
															<td>POST.BLTNBOARD_NM</td>
															<td colspan='2'>POST.TITLE</td>
															<td>POST.NM</td>
															<td>POST.REG_DT</td>
														</tr>
													</tbody>
												</table>
											</div>


										</div>
										<div class="CB">POST.CONTENTS</div>
										<div class="CBC"> 내용 박스
											<div id="wrap">
												<div class="comment_icon"></div>
												<div class="comment_nm">코멘트멤버NM</div>
											</div>
											<div class="comment_box">코멘트CONTENTS</div>
										</div>

									</div>
								</div>
							</td>
							<td colspan="1">REPORT_NO</td>
							<td colspan="1">REPORT_TYPE_NM</td>
							<td colspan="1">R.NM AS 신고자</td>
							<td colspan="1">T.NM AS 신고당한자</td>
							<td colspan="1">R.REG_DT</td>
							<td colspan="1">T.BLTNBOARD_NM</td>
							<td colspan="1">T.POST_NO, T.COMMENT_NO</td>
							<td colspan="2">
							<select class="sel" id="process" name="process">
									<option>활동 중지</option>
									<option>반려</option>
									<option>강제 탈퇴</option>
							</select></td>
						</tr>-->
					</tbody>
				</table>
			</div>
			<div class="Cbtnright">
				<input type="button" value="삭제" class="btn" id="deleteBtn" />
			</div>
			<div class="Cpaging"></div>
		</div>
	</div>
</body>
</html>