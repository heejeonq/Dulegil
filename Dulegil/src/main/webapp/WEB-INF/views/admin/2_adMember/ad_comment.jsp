<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>댓글 관리</title>
<style type="text/css">
#cateNo{
	width: 120px;
	outline: none;
	margin-left: 0;
}
.Ctable td:nth-child(2) {
    text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	reloadList();
	
	$("#searchBtn").on("click", function(){
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	$(".Cpaging").on("click", "#pBtn", function(){
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		$("#page").val($(this).attr("page"));
		
		reloadList();
	});
	
	if("${param.cateNo}" != ""){
		$("#cateNo").val("${param.cateNo}");
	}
	
	$("#cateNo").on("change", function(){
		$("#page").val("1");
		
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		
		reloadList();
	});
	
	// thead 체크박스
	$("thead").on("click", "#allCheck", function(){
		if($(this).is(":checked")){
			$("tbody #Check").prop("checked", true);
		}else{
			$("tbody #Check").prop("checked", false);			
		}
		
		var arr = [];
		$("tbody #Check:checked").each(function(){
			arr.push($(this).val());
		});
		
		$("#no").val(arr);
	});	
	
	
	// tbody 체크박스 선택시 값 보내기
	$("tbody").on("click", "#Check", function(){
		var arr = [];
		
		$("tbody #Check:checked").each(function(){
			arr.push($(this).val());
		});
		
		if(arr.length == $("tbody #Check").length){
			$("thead #allCheck").prop("checked", true);
		}else{
			$("thead #allCheck").prop("checked", false);
		}
			// arr에 체크된 곳에 no 값을 넣어줌
			$("#no").val(arr);		
	});
	
	// 개별 삭제
	$("tbody").on("click", "#delBtn", function() {
		var commentNo= $(this).parent().parent().attr("no");
		$("#no").val(commentNo);	
		
		makePopup({
			title : "알림",
			contents : "삭제하시겠습니까?",
			buttons : [ {
				name : "삭제",
				func : function() {
					var params = $("#actionForm").serialize();
					$.ajax({
						url : "adCmtAction/del", //경로 주소 새로생기면 컨트롤러 가
						type : "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
						dataType : "json", //
						data : params, //json 으로 보낼데이터
						success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행
							console.log(res);

							switch (res.msg) {
							case "success":
								makeAlert("알림", "삭제되었습니다.", function(){
									reloadList();
								});
								break;
							case "fail":
								makeAlert("알림", "삭제에 실패하였습니다.")
								break;
							case "error":
								makeAlert("알림", "삭제중 문제가 발생하였습니다.")
								break;
							}
						},
						error : function(request, status, error) { //실패했을 때 함수 실행
							console.log(request. responseText); //실패 상세내역
						}
					});
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	// check 삭제
	$("#deleteBtn").on("click", function(){
		var arr = [];
		
		$("tbody #Check:checked").each(function(){
			arr.push($(this).val());
		});
		
		console.log(arr);
		
		if(arr.length == ""){
			makeAlert("알림", "삭제할 댓글을 선택해주세요.");
		}else{
			makePopup({
				title : "알림",
				contents : "삭제 하시겠습니까?",
				buttons	: [{
					name : "삭제",
					func : function(){
						// serialize() : 해당 내용물들 중 값 전달이 가능한 것들을 전송 가능한 문자 형태로 전환.
						var params = $("#actionForm").serialize();
						console.log(params);
						$.ajax({
							url : "adCmtAction/checkDel",
							type :"POST",
							dataType :"json",
							data : params,
							success : function(res){
								// 성공했을 때 결과를 res에 받고 함수 실행
								switch(res.msg){
								case "success" :
									makeAlert("알림", "삭제되었습니다.", function(){
										reloadList();
									});
									break;
								case "fail" :
									makeAlert("알림", "삭제에 실패했습니다.")
									break;
								case "exception" :
									makeAlert("알림", "삭제 중 문제가 발생했습니다.")
									break;
								}
							},
							error : function(request, status, error){
								console.log(request.responseText);
							}
						});
						closePopup();
					}
				},{
					name : "취소"
				}]	
			}); // makePop
		}
	});
}); // document ready end

function reloadList(){
	$("#cate").val($("#cateNo").val());
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adCmtAjax",
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
}; // reloadList end

// 게시글 목록 함수
function drawList(list){
	var html = "";
	
	for(var data of list){
		
		html += "<tr no=\"" +data.COMMENT_NO +"\">";
		html += "<td><span id=\"delBtn\" name=\"delBtn\" class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span></td>";
		html += "<td>"+ data.COMMENT_NO +"</td>";
		html += "<td cate=\""+ data.BLTNBOARD_NO +"\">"+ data.BLTNBOARD_NM +"</td>";
		html += "<td style=\"text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">"+ data.TITLE +"</td>";
		html += "<td style=\"text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">"+ data.CONTENTS +"</td>";
		html += "<td>"+ data.NM +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td><input type=\"checkbox\"id=\"Check\" name=\"Check\" value=\""+data.COMMENT_NO+"\" /></td>";
		html += "</tr>";
		
		}
		$("tbody").html(html);
};

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
</script>
</head>
<body>
	<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
	<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
	
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; vertical-align: bottom;">comment</span> 
			
			댓글 관리
		</div>
		<form action="#" id="actionForm" method="post">
			<div class="Csearch">
				<input type="hidden" name="no" id="no" value="${data.CONTENT_NO}" /> 
				<input type="hidden" name="delNo" id="delNo" />
				<input type="hidden" name="cate" id="cate" value="${param.cateNo}" /> 
				<input type="hidden" name="page" id="page" value="${page}" />
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">댓글 내용</option>
					<option value="1">작성자</option>
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
				<table>
					<colgroup>
						<col width="40px">
						<col width="60px">
						<col width="130px">
						<col width="200px">
						<col width="325px">
						<col width="130px"> 
						<col width="110px">
						<col width="40px">
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th>번호</th>
							<th>게시판</th>
							<th>제목</th>
							<th>댓글</th>
							<th>작성자</th>
							<th>등록일</th>
							<th><input type="checkbox" id="allCheck" name="allCheck"/></th>
						</tr>
					</thead>
					<tbody></tbody>
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