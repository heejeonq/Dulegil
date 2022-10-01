<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 관리</title>
<style type="text/css">
#searchGbn{
	width: 100px;
}
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
		$("#oldGbn2").val($("#searchGbn2").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	$(".Cpaging").on("click", "#pBtn", function(){
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldGbn2").val($("#searchGbn2").val());
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
		$("#searchGbn2").val("0");
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
	
	// tbody 체크박스
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
	
	// 체크박스 삭제
	$("#deleteBtn").on("click", function(){
		var arr = [];
		
		// 내가 체크박스에 값 1 넣어놔서 tr의 no 취득하기
		$("tbody #Check:checked").each(function(){
			arr.push($(this).parent().parent().attr("no"));
		});
		console.log(arr);
		$("#delNo").val(arr);
		
		if(arr.length == ""){
			makeAlert("알림", "삭제할 공지사항을 선택해주세요.");
		}else{
			makePopup({
				title : "알림",
				contents : "삭제 하시겠습니까?",
				buttons	: [{
					name : "삭제",
					func : function(){
						var params = $("#actionForm").serialize();
						console.log(params);
						$.ajax({
							url : "adPostAction/delete",
							type :"POST",
							dataType :"json",
							data : params,
							success : function(res){
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
			})
		}
	});
	
	$("tbody").on("click","#delBtn", function(){
		var del = $(this).parent().parent().attr("no");
		$("#no").val(del);
		console.log(del);
		
		makePopup({
			title : "알림",
			contents : "삭제 하시겠습니까?",
			buttons	: [{
				name : "삭제",
				func : function(){
					var params = $("#actionForm").serialize();
					console.log(params);
					$.ajax({
						url : "adPostAction/del",
						type :"POST",
						dataType :"json",
						data : params,
						success : function(res){
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
		})
	});
}); 

function reloadList(){
	$("#cate").val($("#cateNo").val());
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adPostAjax",
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

// 게시글 그리기
function drawList(list){
	var html ="";
	
	for(var data of list){
		
		html += "<tr no=\"" +data.POST_NO +"\">";
		html += "<td><span id=\"delBtn\" name=\"delBtn\" class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span></td>";
		html += "<td>"+ data.POST_NO +"</td>";
		html += "<td cate=\""+ data.BLTNBOARD_NO +"\">"+ data.BLTNBOARD_NM +"</td>";
		html += "<td style=\"text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">"+ data.TITLE +"</td>";
		html += "<td>"+ data.NM +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td><input type=\"checkbox\" id=\"Check\" name=\"Check\"/></td>";
		html += "</tr>                                                                                                           ";
	}
	
	$("tbody").html(html);
};// drawList end

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
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<!-- 기존 검색 내용 유지용 -->
		<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
		<input type="hidden" id="oldGbn2" value="${param.searchGbn2}" /> 
		<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
		
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">edit_note</span>
			게시글 관리
		</div>
		
		<form action="#" id="actionForm" method="post">
			<div class="Csearch">
				<input type="hidden" name="no" id="no" value="${data.CONTENT_NO}" /> 
				<input type="hidden" name="delNo" id="delNo" />
				<input type="hidden" name="cate" id="cate" value="${param.cateNo}" /> 
				<input type="hidden" name="page" id="page" value="${page}" />
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">코스 별 후기</option>
					<option value="1">동행 구하기</option>
					<option value="2">둘레길 이야기</option>
				</select>
				<select class="sel" name="searchGbn2" id="searchGbn2">
					<option value="0">번호</option>
					<option value="1">제목</option>
					<option value="2">작성자</option>
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
						<col width="525px">
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
							<th>작성자</th>
							<th>등록일</th>
							<th><input type="checkbox" id="allCheck" name="allCheck"/></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div class="Cbtnright">
					<input type="button" value="삭제" class="btn" id="deleteBtn" />
				</div>
				<div class="Cpaging"></div>
			</div>	
		</div>
	</div>
</body>
</html>