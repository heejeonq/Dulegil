<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 목록</title>
<style type="text/css">
#ntcTit:hover{
	text-decoration: underline;
	cursor: pointer;
}

#file_present{
	margin-left: 10px;
	font-size: 14pt;
}

#campaign {
    margin-right: 10px;
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
	
	$("#insertBtn").on("click", function(){
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtWrite");
		$("#actionForm").submit();
	});
	
	$("tbody").on("click", "#ntcTit", function(){
		$("#no").val($(this).parent().attr("no"));
		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtDetail"); 
		$("#actionForm").submit();
	});	
	
	// th 전체 선택 박스 클릭시 -> td 전체 선택 
	// $('input:checkbox[name="allCheck"]').change(function(){
    //    $('input:checkbox[name="Check"]').each(function(){
    //        $(this).prop("checked",$('input:checkbox[name="allCheck"]').prop("checked"));
    //    });
   // });

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
						// serialize() : 해당 내용물들 중 값 전달이 가능한 것들을 전송 가능한 문자 형태로 전환.
						var params = $("#actionForm").serialize();
						console.log(params);
						$.ajax({
							url : "adNtAction/delete",
							type :"POST",
							dataType :"json",
							data : params,
							success : function(res){
								switch(res.msg){
								case "success" :
									makeAlert("알림", "삭제가 완료되었습니다.", function(){
										location.href = "adNtList";
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
					}
				},{
					name : "취소"
				}]	
			})
		}
	});
	
}); 

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "adNtAjax",
		type: "POST",
		dataType: "json",
		data : params,
		success : function(res){
			drawList(res.list);
			drawPaging(res.pd);
			console.log(res);
		},
		error : function(request, status, error) { //실패했을 때 함수 실행
			console.log(request.responseText); //실패 상세내역
		}
	});
};

function drawList(list){
	var html = "";
	
	for(var data of list){        
		if(data.MUST_READ_YN == "0"){
			html += "<tr no=\"" + data.POST_NO + "\">";
			html += "<td>"+ data.POST_NO +"</td>";
			html += "<td id=\"ntcTit\">"
			html += "<span id=\"campaign\" class=\"material-symbols-outlined\">campaign</span>";
			html +=  data.TITLE;
			if(typeof(data.ATT_FILE) !="undefined"){
				html += "<span id=\"file_present\" class=\"material-symbols-outlined\">attach_file</span>";
			}
			html += "</td>";
			html += "<td>"+ data.NM +"</td>";
			html += "<td>"+ data.REG_DT +"</td>";
			html += "<td><input type=\"checkbox\" id=\"Check\" name=\"Check\" value=\"" + data.POST_NO + "\" /></td>";
			html += "</tr>";      
		}else{
			html += "<tr no=\"" + data.POST_NO + "\">";
			html += "<td>"+ data.POST_NO +"</td>";
			html += "<td id=\"ntcTit\">"
			html +=  data.TITLE;
			if(typeof(data.ATT_FILE) !="undefined"){
				html += "<span id=\"file_present\" class=\"material-symbols-outlined\">attach_file</span>";
			}
			html += "</td>";
			html += "<td>"+ data.NM +"</td>";
			html += "<td>"+ data.REG_DT +"</td>";
			html += "<td><input type=\"checkbox\" id=\"Check\" name=\"Check\" value=\"" + data.POST_NO + "\" /></td>";
			html += "</tr>";    
		}
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
	<!-- 검색어 유지용 -->
	<input type="hidden" id="oldGbn" value="${param.searchGbn}"/>
	<input type="hidden" id="oldTxt" value="${param.searchTxt}"/>

	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">edit_document</span>
			공지사항 목록
		</div>
		<form action="#" id="actionForm" method="post">
			<input type="hidden" id="no" name="no"/><!-- 상세보기 -->
			<input type="hidden" id="delNo" name="delNo"/><!-- 목록 체크박스 삭제 -->
			<input type="hidden" name="page" id="page" value="${page}" />	
			<div class="Csearch">
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">제목</option>
					<option value="1">내용</option>
				</select>
				<input type="text" class="commentBoxT" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
				<input type="button" class="btn src" id="searchBtn" value="검색" />
			</div>
	
			<div class="Ccon">
				<div class="Ctable">
					<table>
						<colgroup>
							<col width="100px">
							<col width="800px">
							<col width="150px">
							<col width="200px">
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th><input type="checkbox" id="allCheck" name="allCheck"/></th>
							</tr>
						</thead>
						<tbody id="Ctbody"></tbody>
					</table>
				</div>
				
				<div class="Cbtnright">
					<input type="button" value="등록" class="btn" id="insertBtn" />	
					<input type="button" value="삭제" class="btn" id="deleteBtn" />
				</div>
				
				<div class="Cpaging" ></div>
			</div>
		</form>
	</div>
</body>
</html>

