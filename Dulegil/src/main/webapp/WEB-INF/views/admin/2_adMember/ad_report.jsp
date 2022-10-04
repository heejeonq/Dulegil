<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adjscss.jsp" flush="true" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고내역 관리</title>
<style type="text/css">
.sel{
	width: 130px;
}
#cateNo{
	width: 120px;
	outline: none;
	margin-left: 0;
}
/* 테이블 */
th:nth-child(12) {
	width: 70px;
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


tr{
position:relative;
}
/* 펼치기 */
#header2 #hd2_CC #CCbox #hide {
	padding: 56px 80px;
    margin: auto;
    color: #f5f5f1;
    width: 50%;
    height: 38%;
    font-size: 11px;
    position: absolute;
    background-color: rgb(231 231 231/ 26%);
    backdrop-filter: blur(30px);
    border: 0px solid rgba(255, 255, 255, 0.18);
    -webkit-box-shadow: rgb(142 142 142 / 19%) 0px 6px 15px 0px;
    -webkit-border-radius: 12px;
    z-index: 10;
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
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 목록 구분 설정
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}	
	reloadList();
	
	// 검색 버튼 클릭시
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	
	// 페이징 버튼
	$(".Cpaging").on("click", "#pBtn", function(){
		// 기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#page").val($(this).attr("page"));
		reloadList();		
	});

	
	function reloadList(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url:"adReportAjax",
			type: "POST",
			dataType: "json",
			data : params,
			success : function(res){
				drawList(res.list);
				drawPaging(res.pd);
				console.log(res);
			},
			error : function(request, status, error){
				console.log(request.responseText);
				
			}
			
		});
		
	} // reloadList end
	
function drawPaging(pd) {
	var html = "";
	
	html += "<span class=\"page_btn page_first\" id=\"pBtn\" page=\"1\"><<</span>";
	
	if($("#page").val() == "1" ) {
		html += "<span class=\"page_btn page_prev\" id=\"pBtn\" page=\"1\"><</span>";
	}else {		
	html += "<span class=\"page_btn page_prev\" id=\"pBtn\" page=\"" + ($("#page").val() *1 -1 )+ "\"><</span>";
	}
	
	for(var i = pd.startP; i<=pd.endP; i++){
		if($("#page").val() * 1 == i){
	html += "<span class=\"page_btn_on\" id=\"pBtn\" page=\"" + i + "\">" + i + "</span>";			
		}else{
	html += "<span class=\"page_btn\" id=\"pBtn\" page=\"" + i + "\">" + i + "</span>";			
		}
	}
	if($("#page").val() * 1 == pd.maxP){ 
		
	html += "<span class=\"page_btn page_next\" id=\"pBtn\" page=\"" + pd.maxP + "\">></span>";
	}else{		
	html += "<span class=\"page_btn page_next\" id=\"pBtn\" page=\"" + ($("#page").val() * 1 + 1) + "\">></span>";
	}
	
	html += "<span class=\"page_btn page_last\" id=\"pBtn\" page=\"" + pd.maxP + "\">>></span>";
	
	$(".Cpaging").html(html); 
}
	
	
	
	
	
	
	
	
	
	// 게시글 목록 함수
	function drawList(list){
		var html = "";
	
		for(var data of list){
			//"+ +"
		html += "<tr cate=\""+ data.CATE +"\" no=\""+ data.REPORT_NO +"\">";
		html += "<td>";
		if(data.CATE != "회원") {
			html += "<div><span  id=\"show\" name=\"show\" class=\"material-symbols-outlined\"> \expand_less\ </span></div>";
		}
		html += "</td>";
		html += "<td>"+ data.REPORT_NO +"</td>";
		html += "<td>"+ data.CATE +"</td>";
		html += "<td>"+ data.REPORT_TYPE_NM +"</td>";
		html += "<td>"+ data.ACCUSER +"</td>";
		html += "<td>"+ data.ACCUSED +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td>";
		html += "<select class=\"sel\" id=\"process\" name=\"process\">";
		html += "<option value=\"0\">처리 중</option>";
		html += "<option value=\"1\">승인</option>";
		html += "<option value=\"2\">반려</option>";
		html += "</select>";
		html += "</td>";
		html += "</tr>";
	
		}
	
		$(".list tbody").html(html);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
	function reloadList2(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url:"addAjax",
			type: "POST",
			dataType: "json",
			data : params,
			success : function(res){
				$("#hide tbody").empty();
				$("#hide .cmtBoxWrap").empty();
				
				// 댓글
				if($("#cateNo").val() =="댓글"){
					drawList2(res.comment);	
				// 글
				}else if($("#cateNo").val() =="글"){
					drawList3(res.post);
				}
				
				console.log(res);
			},
			error : function(request, status, error){
				console.log(request.responseText);
				
			}
			
		});
		
	} // reloadList end
	
		
	
	// 더보기 아이콘 회원일 때는 아이콘 X
	
	
	
	
	
	
	// 더보기 아이콘 클릭시
	$("tbody").on("click","tr span#show", function(){
		$("#cateNo").val($(this).parent().parent().parent().attr("cate"));

		if($(this).html() == "expand_more") {
			$("#hide").hide();
			$(this).html("expand_less");
		} else {
			// 댓글
			if($("#cateNo").val() =="댓글"){
				$("#rptNoC").val($(this).parent().parent().parent().attr("no"));
			// 글
			}else if($("#cateNo").val() =="글"){
				$("#rptNoP").val($(this).parent().parent().parent().attr("no"));
			}
			
			reloadList2();
			
			$("tbody tr span#show").each(function() {
				$(this).html("expand_less");
			});
			$(this).html("expand_more");
			$("#hide").show();
		}
		
	});
	
	
	
	
	
	
	//comment가 있을때
	function drawList2(comment){
		var html = "";
		
		var a ="";

		for(var data of comment){
			//"+ data. +"

			html += "<tr id=\"rptNo\" name=\"rptNo\"  rptNo=\""+ data.REPORT_NO+"\">";
			html += "<td>"+ data.POST_NO+"</td>";
			html += "<td>"+ data.BLTNBOARD_NM+"</td>";
			html += "<td colspan=\"2\">"+  data.TITLE +"</td>";
			html += "<td>"+ data.PNM +"</td>";
			html += "<td>"+ data.REG_DT +"</td>";
			html += "</tr>";
		

			a += "<div class=\"cmtBoxWrap\">";
			a += "<div class=\"CB\">"+ data.POST +"</div>";
			a += "<div class=\"CBC\">";
			a += "<div id=\"wrap\">";
			a += "<div class=\"comment_icon\"></div>";
			a += "<div class=\"comment_nm\">"+ data.CNM +"</div>";
			a += "</div>";
			a += "<div class=\"comment_box\">"+ data.CMT +"</div>";
			a += "</div>";
			a += "</div>";
		
		}
		

		$("#hide tbody").html(html);
		$("#hide .cmtBoxWrap").html(a);
		
		$("#rptNoM").val("");
		$("#rptNoP").val("");
		$("#rptNoC").val("");
		$("#cateNo").val("");
	}
		
	
	
	
	
	//post가 있을때
	function drawList3(post){
		var html = "";
		var a ="";

		for(var data of post){
			//"+ data. +"

			html += "<tr rptNoP=\""+ data.REPORT_NO+"\">";
			html += "<td>"+ data.POST_NO+"</td>";
			html += "<td>"+ data.BLTNBOARD_NM+"</td>";
			html += "<td colspan=\"2\">"+  data.TITLE +"</td>";
			html += "<td>"+ data.PNM +"</td>";
			html += "<td>"+ data.REG_DT +"</td>";
			html += "</tr>";		
			
			a += "<div class=\"cmtBoxWrap\">";
			a += "<div class=\"CB\">"+ data.POST +"</div>";
			a += "</div>";
		
		}
		
		$("#hide tbody").html(html);
		$("#hide .CB").html(a);
	}
		
	
});


	
</script>






</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn }" /> 
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" /> 
		<input type="hidden" id="process" name="process" value="${param.process}" />
		<div class="Cname">
			<span class="material-symbols-outlined"	style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;"> person_off </span>
			신고 내역 관리
		</div>
		<form action="#" id="actionForm" method="post">
			<div class="Csearch">
				<input type="hidden" name="no" id="no" /> 
				<input type="hidden" name="rptNoM" id="rptNoM" />  
				<input type="hidden" name="rptNoP" id="rptNoP" />  
				<input type="hidden" name="rptNoC" id="rptNoC" />  
				<input type="hidden" name="cateNo" id="cateNo" />  
				<input type="hidden" name="page" id="page" value="${page}" />
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">신고자 아이디</option>
					<option value="1">신고대상자 아이디</option>
				</select>
				<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
				<input type="button" class="btn src" id="searchBtn" value="검색" />
			</div>
		</form>
		<div class="Ccon">
			<div class="Ccate">
				<select name="cateNo" id="cateNo">
					<option value="0">전체</option>
					<c:forEach var="data" items="${cate}">
						<option value="${data.BLTNBOARD_NO}">${data.BLTNBOARD_NM}</option>
					</c:forEach>
				</select>
			</div>
			<div class="Ctable">
				<table class="list">
					<colgroup>
						<col width="40px">
						<col width="60px">
						<col width="130px">
						<col width="110px">
						<col width="140px"> 
						<col width="140px">
						<col width="110px">
						<col width="130px">
					</colgroup>
					<thead>
						<tr id="tr_1">
							<th></th>
							<th>번호</th>
							<th>신고유형</th>
							<th>신고항목</th>
							<th>신고대상자 아이디</th>
							<th>신고자 아이디</th>
							<th>신고날짜</th>
							<th>처리여부</th>
						</tr>
					</thead>
					<tbody class="table_1"></tbody>
				</table>
				<div id="hide" style="display: none" >
					<!-- 테이블2 포스트 th -->
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
								<tbody class="cPost"></tbody>
							</table>
						</div>
					</div>
					<!-- 테이블2 포스트 내용 -->
					<div class="cmtBoxWrap">
						<div class="CB"></div>
						<!-- 댓글박스 -->
						<div class="CBC">
							<div id="wrap">
								<div class="comment_icon"></div>
								<div class="comment_nm"></div>
							</div>
							<div class="comment_box"></div>
						</div>
					</div>
				</div> <!-- 더보기 박스 end -->
				<!--  페이징  -->
				<div class="Cpaging"></div>
			</div>
		</div>		
	</div>
</body>