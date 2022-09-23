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
#ccboxCon td{
	padding: 10px;
}

#header2 #hd2_CC #hd2_paging #pBtn_GD {
	width: 15px;
	height: 15px;
	margin-right: 11px;
	display: inline-block;
	border: none;
	font-size: 12px;
}
.pBtn_GD {
	border: none;
	font-size: 12px;
	background-color: #ECECEC;
	display: inline-box;
}

/* 검색창 */
#header2 #search {
	width: 100%;
	height: 10%;
	text-align: center;
	font-size: 20px;
	background-color: white;
}

/* vertical-align 은 여기 버튼 css에서 설정해준다. div아님*/
#header2 #search .Sbar1, .Sbar11, .Sbar2, .Sbar3 {
	margin-top: 20px;
	display: -webkit-inline-box;
}

.Sbar3 {
width: 6%;
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	position: relative;
	border: 1px solid #ddd;
}

.Sbar2 {
	width: 25%;
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.Sbar1 {
	width: 6%;
	height: 46%;
	display: inline-block;
	text-align: left;
	vertical-align: top;
	border: 1px solid #ddd;
	position: relative;
}

.commentBoxT {
	border: none;
	width: 100%;
    height: 100%;
	position: absolute;
}

#searchBtn {
background-color: #ededed;
    border-radius: 0px;
    border: #ededed;
    display: inline-block;
    cursor: pointer;
    color: #5e5e5e;
    font-family: Arial;
    font-weight: 700;
    width: 100%;
    height: 100%;
    position: inherit;
}

input:focus {
	outline: none;
}

#hdSearch:hover {
	background-color: #ECECEC;
}

.sel {
	border: none;
	outline: none;
	position:absolute;
	width: 100%;
    height: 100%;
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
	})
	
	
	// 페이징 버튼
	$("#hd2_paging").on("click", ".pBtn", function(){
		//기존 검색 상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#page").val($(this).attr("page"));
		reloadList();
		
	});
	
	
	// 글 목록 클릭시 상세보기 // 체크 박스 선택시 x 
	$("tbody").on("click", "td:nth-child(1)", function(){
		$("#no").val($(this).attr("no"));
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtDetail");
		$("#actionForm").submit();
	});
	
	
	
	
	// 공지 등록 버튼
	$("#insertBtn").on("click", function(){
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "adNtWrite");
		$("#actionForm").submit();
	});
	
	
	// th 전체 선택 박스 클릭시 -> td 전체 선택 
	// $('input:checkbox[name="allCheck"]').change(function(){
    //    $('input:checkbox[name="Check"]').each(function(){
    //        $(this).prop("checked",$('input:checkbox[name="allCheck"]').prop("checked"));
    //    });
   // });

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
	
	
	
	// 삭제
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
	

	
}); // document.ready end


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
		html += "<tr no=\"" + data.POST_NO + "\">";
		html += "<td>"+ data.POST_NO +"</td>";
		html += "<td>"+ data.TITLE +"</td>";
		html += "<td>"+ data.NM +"</td>";
		html += "<td>"+ data.REG_DT +"</td>";
		html += "<td><input type=\"checkbox\" id=\"Check\" name=\"Check\" value=\""+data.POST_NO+"\" /></td>";
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
	
	$("#hd2_paging").html(html);
}
</script>
</head>
<body>
	<!-- 기존 검색 내용 유지용 -->
	<input type="hidden" id="oldGbn" value="${param.searchGbn}"/>
	<input type="hidden" id="oldTxt" value="${param.searchTxt}"/>

	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note</span>
				공지사항 목록
			</div>
		</div>

		<div id="hd2_CC">
			<div id="CCbox">
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
					<tbody id="ccboxCon"></tbody>
				</table>
			</div>
			<div id="write">
				<input type="button" value="삭제" class="btn right" id="deleteBtn" />
				<input type="button" value="글쓰기" class="btn right" id="insertBtn" />	
			</div>
			<div id="hd2_paging" ></div>
			<div id="search">
				<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
				<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
				<form action="#" id="actionForm" method="post">
					<input type="hidden" id="no" name="no"/><!-- 상세보기 -->
					<input type="hidden" id="delNo" name="delNo"/><!-- 목록 체크박스 삭제 -->
					<input type="hidden" name="page" id="page" value="${page}" />
					<div class="Sbar1">
						<select class="sel" name="searchGbn" id="searchGbn">
							<option value="0">제목</option>
							<option value="1">내용</option>
						</select>
					</div>
					<div class="Sbar2">
						<input type="text" class="commentBoxT" name="searchTxt"
							id="searchTxt" value="${param.searchTxt }" />
					</div>
					<div class="Sbar3">
						<input type="button" id="searchBtn" value="검색" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

