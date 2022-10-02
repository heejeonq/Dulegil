<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 계정 관리</title>
<style type="text/css">
.Ccon.right{
	margin-top: 40px;
    margin-left: 45px;
}
.Cdeailtable th:first-child{
	padding-left: 0;
}
.Cdeailtable td{
	font-size: 10pt;
	padding: 8px 0;
	text-align: center;
}
.Mtable tr{
	border: none;
}
Mtable input {
    width: 200px;
    height: 25px;
    text-align: left;
    margin-left: 15px;
    padding-left: 5px;
    border: 1px solid #ddd;
    border-radius: 3px;
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
	
	$("tbody").on("click", "#delBtn", function() {
		var commentNo= $(this).parent().parent().attr("no");
		$("#no").val(commentNo);	
		
		makePopup({
			title : "알림",
			contents : "삭제하시겠습니까?",
			buttons : [{
				name : "삭제",
				func : function() {
					var params = $("#actionForm").serialize();
					$.ajax({
						url : "adminAction/delete",
						type : "POST", 
						dataType : "json",
						data : params, 
						success : function(res) { 
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
						error : function(request, status, error) { 
							console.log(request. responseText); 
						}
					});
					closePopup();
				}
			}, {
				name : "취소"
			}]
		});
	});
	
	$("#insertBtn").on("click", function() { 
		if($.trim($("#nm").val()) == "") {
			makeAlert("알림", "관리자명을 입력하세요.", function() {
				$("#nm").focus();
			});
		}else if ($("#email").val() == "") {
			makeAlert("알림", "아이디를 입력하세요.", function() {
				$("#email").focus();
			});
		}else if($.trim($("#pwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요.", function(){
				$("#pwd").focus();
			});
		}else if($.trim($("#cnfmPwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요.", function(){
				$("#cnfmPwd").focus();
			});
		}else if($("#pwd").val() != $("#cnfmPwd").val()){
			makeAlert("알림", "비밀번호가 일치하지 않습니다.", function(){
				$("#cnfmPwd").focus();
			});
		}else {
			var params = $("#actionForm").serialize();  
			
			$.ajax({
				url:"adminAction/insert", 
				type: "POST", 
      			dataType: "json",
				data: params,
				success : function(res){ 
				console.log(res);
					switch(res.msg){
					case "success" :
						$("#page").val("1");
   	                    $("#searchgbn").val("0");
   	                    $("#searchTxt").val("");
						makeAlert("알림", "관리자 계정이 등록되었습니다.", function() {
							location.href="adEvt";
						}) ;
					break;
					case "fail" :
  						makeAlert("알림", "관리자 계정 등록에 실패하였습니다.")
					break;
  					case "error" :                     
   	                     makeAlert("알림", "관리자 계정 등록 중 문제가 발생하였습니다.")
					break;
					}
				},
   	            error : function(request, status, error) { 
   	                     console.log(request,responseText); 
   	            }
			});
		}
	});
	
});

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adminAjax", 
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
	
};
function drawList(list){
	var html ="";
	
	for(var data of list){
		html += "<tr no=\"" +data.MEMBER_NO +"\">";
		html += "<td>"+ data.MEMBER_NO +"</td>";
		html += "<td>"+ data.AUTHORITY_NM +"</td>";
		html += "<td>"+ data.NM +"</td>";
		html += "<td>"+ data.EMAIL +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td>";
		html += "<span id=\"delBtn\" name=\"delBtn\" class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span>";
		html += "</td>";
		html += "</tr>";
	}
	
	$(".Cdeailtable tbody").html(html);
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
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;"> supervisor_account </span>
			관리자 계정 관리
		</div>
		<div class="Ccon">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="no" id="no" value="${data.MEMBER_NO}" /> 
				<input type="hidden" name="delNo" id="delNo" />
				<input type="hidden" name="page" id="page" value="${page}" />
				<div class="Csearch">
					<select class="sel" name="searchGbn" id="searchGbn">
						<option value="0">관리자명</option>
						<option value="1">아이디</option>
					</select>
					<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
					<input type="button" class="btn src" id="searchBtn" value="검색" />
				</div>
			</form>
			<div class="Ccon left">
				<div class="Cdeailtable">
					<table style="table-layout: fixed;">
						<colgroup>
							<col width="80px">
							<col width="90px">
							<col width="170px">
							<col width="170px">
							<col width="110px">
							<col width="40px">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>등급</th>
								<th>관리자명</th>
								<th>아이디</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div> 
				<div class="Cpaging"></div>
			</div>
			<div class="Ccon right">
				<form action="#" id="updateForm" method="post">
					<input type="hidden" name="updNo" id="updNo" value="${data.MEMBER_NO}" /> 
					<table class="Mtable">
						<tr>
							<th>관리자명</th>
							<td><input type="text" name="nm" id="nm"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="email" id="email"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="cnfmPwd" id="cnfmPwd" maxlength="20" /></td>
						</tr>
					</table>
					<div class="Cbtnright">
						<input type="button" id="updateBtn" value="수정" class="btn" /> 
						<input type="button" id="insertBtn" value="등록" class="btn" />
					</div>
				</form>
			</div>
		</div>
	</div> 
</body>
</html>