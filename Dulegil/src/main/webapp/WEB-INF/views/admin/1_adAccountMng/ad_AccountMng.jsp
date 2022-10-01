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
	margin-top: 20px;
	margin-left: 63px;
}
</style>
<script type="text/javascript">
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
		html += "<td><span id=\"delBtn\" name=\"delBtn\" class=\"material-icons\" style=\"font-size: 14px; cursor: pointer;\"> \close\ </span></td>";
		html += "<td>"+ data.MEMBER_NO +"</td>";
		html += "<td>"+ data.AUTHORITY_NM +"</td>";
		html += "<td>"+ data.NM +"</td>";
		html += "<td>"+ data.EMAIL +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td><input type=\"checkbox\" id=\"Check\" name=\"Check\"/></td>";
		html += "</tr>                                                                                                           ";
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
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;"> account_circle </span>
			관리자 계정 관리
		</div>
		<div class="Ccon">
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="no" id="no" value="${data.MEMBER_NO}" /> 
				<input type="hidden" name="delNo" id="delNo" />
				<input type="hidden" name="page" id="page" value="${page}" />
			</form>
			<div class="Csearch">
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">관리자명</option>
					<option value="1">아이디</option>
				</select>
				<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
				<input type="button" class="btn src" id="searchBtn" value="검색" />
			</div>
			<div class="Ccon left">
				<div class="adInform">
					<div>
						<span class="material-symbols-outlined"> supervisor_account </span> 
						로그인 관리자 정보
					</div>
					<div class="adIcon">
						<span class="material-symbols-outlined" id="adNmSpan"> person_4 </span>  
						<p id="adNm">이름</p>
					</div>
					<div class="loginInform">
						<span class="material-symbols-outlined" id="key"> face </span> 
						<span style="padding: 5px;">${adMemNm}</span> 
						<br/>
						<span class="material-symbols-outlined" id="key"> key </span> 
						<span style="padding: 5px;">${adMemPw}</span>
					</div>
				</div> 
			</div>
			<div class="Ccon right">
				<div class="adList">
					<div>
						<span class="material-symbols-outlined" > manage_accounts </span>
						관리자 목록
					</div>
					<div class="Cdeailtable">
						<table style="table-layout: fixed;">
							<colgroup>
								<col width="50px">
								<col width="70px">
								<col width="100px">
								<col width="140px">
								<col width="140px">
								<col width="110px">
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>번호</th>
									<th>등급</th>
									<th>관리자명</th>
									<th>아이디</th>
									<th>등록일</th>
									<th><input type="checkbox" id="allChck" name="allChck" /></th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div> 
				</div>
				<div class="Cbtnright">
					<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" class="btn" /> 
				</div>
				<div class="Cpaging"></div>
			</div>	
		</div>
	</div> 
</body>
</html>