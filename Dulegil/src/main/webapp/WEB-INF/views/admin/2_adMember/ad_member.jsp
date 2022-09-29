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
.Ccate{
	display: flex;
}
.Ctable td:nth-child(2) {
    text-align: center;
}
.Ccon.right{
	padding: 20px;
    margin-left: 40px;
    width: 485px;
	height: 500px;
	border: 1px solid #ddd;
}
img {
	width: 150px;
	height: 150px;
	border-radius: 3px;
	margin: 22px;
}
.Mtable th{
	font-size: 11pt;
	padding: 12px 0;
}
.Mtable td{
	font-size: 10pt;
}
tr{
	border: none;
}
.Mtable #aut, .Mtable input, .Mtable #gen {
    width: 200px;
    height: 25px;
    text-align: left;
    margin-left: 15px;
    padding-left: 5px;
    border: 1px solid #ddd;
    border-radius: 3px;
}
.Mtable #aut, #zcd, .Mtable #gen, #cateNo{
	width: 120px;
	outline: none;
}

.Mtable #aut:hover, .Mtable #gen:hover{
	outline: none;
}

#adrBtn{
	width: 73px;
    background-color: #f0c41994;
    border-radius: 4px;
    border: none;
    cursor: pointer;
    margin-left: 2px;
    font-size: 10pt;
    font-weight: 600;
    text-align: center;
}
.Cbtncenter{
	margin: 0;
}
#nmTit:hover{
	cursor: pointer;
	text-decoration: underline;
}
#email, #rel, #rptCnt{
	border: none;
	background-color: white;
}
</style>
<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		
		reloadDetail();
	});
	
	$(".Cpaging").on("click", "#pBtn", function(){
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		$("#page").val($(this).attr("page"));
		
		reloadList();
		
		reloadDetail();
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
		
		reloadDetail();
	});
	
	$("tbody").on("click", "#nmTit", function(){
		$("#no").val($(this).parent().attr("no"));
		$("#updNo").val($(this).parent().attr("no"));

		var params = $("#actionForm").serialize();
		
		$.ajax({
			url:"adMemDetailAjax", 
			type: "POST",
			dataType: "json",
			data : params,
			success : function(res){
				drawDetail(res.data);
				console.log(res);
			},
			error : function(request, status, error){
				console.log(request.responseText);
			}
		});
	});
	
	$("#updateBtn").on("click", function(){
		if($("#updNo").val() == null || $("#updNo").val() == ""){
			makeAlert("알림", "수정 할 회원정보를 선택하세요.")
		}else if($.trim($("#nm").val()) == "") {
			makeAlert("알림", "이름을 입력하세요.", function() {
				$("#nm").focus();
			});
		}else if ($("#phn").val() == "") {
			makeAlert("알림", "휴대전화번호을 입력하세요.", function() {
				$("#phn").focus();
			});
		}else{
			var params = $("#updateForm").serialize();
			console.log(params);
			$.ajax({
				url:"adMemAction/update", 
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
							makeAlert("알림", "회원정보가 수정되었습니다.", function() {
								location.href="adMemList";
							});
						break;
						case "fail" :
                				makeAlert("알림", "수정에 실패하였습니다.")
                			break;
						case "error" :                     
							makeAlert("알림", "수정 중 문제가 발생하였습니다.")
						break;
					}
				},
				error :function(request, status, error) { 
            			console.log(request.responseText); 
				}
			});
		}
	});
	
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } else {
            	
            }

            document.getElementById('zcd').value = data.zonecode;
            document.getElementById('adr').value = addr;
            $("#adrDtl").val(''); 
            document.getElementById('adrDtl').focus();
        }
    }).open();
}

function reloadList(){
	$("#cate").val($("#cateNo").val());
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adMemAjax",
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

function reloadDetail(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url:"adMemDetailAjax",
		type: "POST",
		dataType: "json",
		data : params,
		success : function(res){
			$("#aut").val("2");
			$("#nm").val("");
			$("#email").val("");
			$("#pwd").val("");
			$("#phn").val("");
			$("#dtBrt").val(""); 
			$("#gen").val("0");
			$("#zcd").val("");
			$("#adr").val("");
			$("#adrDtl").val("");
			$("#rel").val("");
			$("#rptCnt").val("");
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
}; 

function drawList(list){
	var html = "";
	
	for(var data of list){

		html += "<tr no=\""+ data.MEMBER_NO +"\">";
		html += "<td>"+ data.MEMBER_NO +"</td>";
		html += "<td cate=\""+ data.AUTHORITY_NO +"\">"+ data.AUTHORITY_NM + "</td>";
		html += "<td id=\"nmTit\">" + data.NM + "</td>";
		html += "<td>"+ data.EMAIL +"</td>";
		html += "</tr>";
	}
	$(".Ctable tbody").html(html);
};
function drawDetail(list){
	$("#aut").val(list.AUTHORITY_NO);
	$("#nm").val(list.NM);
	$("#email").val(list.EMAIL);
	$("#pwd").val(list.PWD);
	$("#phn").val(list.PHONE_NO);
	$("#dtBrt").val(list.DATE_BIRTH); 
	$("#gen").val(list.SMALL_CATEGORY);
	$("#zcd").val(list.ZIP_CODE);
	$("#adr").val(list.ADDRESS);
	$("#adrDtl").val(list.DETAIL_ADDRESS);
	$("#rel").val(list.RELIABILITY);
	$("#rptCnt").val(list.CNT);
}

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
	<!-- 기존 검색 내용 유지용 -->
	<input type="hidden" id="oldGbn" value="${param.searchGbn}" /> 
	<input type="hidden" id="oldTxt" value="${param.searchTxt}" />

	<jsp:include page="../adHeader.jsp" flush="true"/>

	<div class="container">
		<div class="Cname">
			<span class="material-icons" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">manage_accounts </span> 
			회원 관리
		</div>
		<form action="#" id="actionForm" method="post">
			<div class="Csearch">
				<input type="hidden" name="no" id="no" value="${data.MEMBER_NO}" /> 
				<input type="hidden" name="cate" id="cate" value="${param.cateNo}"/>
				<input type="hidden" name="page" id="page" value="${page}" />
				<select class="sel" name="searchGbn" id="searchGbn">
					<option value="0">회원번호</option>
					<option value="1">이름</option>
					<option value="2">이메일</option>
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
					<option value="${data.AUTHORITY_NO}">${data.AUTHORITY_NM}</option>
				</c:forEach>
			</select>
			</div>
			<div class="Ccon left">
				<table class="Ctable">
					<colgroup>
						<col width="50px">
						<col width="70px">
						<col width="150px">
						<col width="200px">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>등급</th>
							<th>이름</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div class="Cpaging"></div>
			</div>
			<div class="Ccon right">
				<form action="#" id="updateForm" method="post">
					<input type="hidden" name="updNo" id="updNo" value="${data.MEMBER_NO}" /> 
					<table class="Mtable">
						<tr>
							<th rowspan="12" style="margin-right: 10px;"><img alt="" src="resources/upload/${data.IMG_FILE}"></th>
							<th>등급</th>
							<td>
								<select name="aut" id="aut">
									<c:forEach var="data" items="${cate}">
										<option value="${data.AUTHORITY_NO}">${data.AUTHORITY_NM}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="nm" id="nm"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="email" disabled></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><input type="text" name="phn" id="phn"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="date" name="dtBrt" id="dtBrt"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<select name="gen" id="gen">
									<c:forEach var="data" items="${cmCate}">
										<option value="${data.SMALL_CATEGORY}">${data.CODE_NM}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th rowspan="3">주소</th>
							<td>
								<input type="text" name="zcd" id="zcd">
								<input type="button" name="adrBtn" id="adrBtn" value="검색" onclick="sample6_execDaumPostcode()" />
							</td>
						</tr>
						<tr>
							<td><input type="text" name="adr" id="adr"></td>
						</tr>
						<tr>
							<td><input type="text" name="adrDtl" id="adrDtl"></td>
						</tr>
						<tr>
							<th>신뢰도</th>
							<td><input type="text" name="rel" id="rel" disabled></td>
						</tr>
						<tr>
							<th>신고 횟수</th>
							<td><input type="text" name="rptCnt" id="rptCnt" disabled></td>
						</tr>
					</table>
				</form>	
				<div class="Cbtncenter">
					<input type="button" id="updateBtn" name="updateBtn" value="수정" class="btn" /> 
				</div>
			</div>	
		</div>
	</div>
</body>
</html>