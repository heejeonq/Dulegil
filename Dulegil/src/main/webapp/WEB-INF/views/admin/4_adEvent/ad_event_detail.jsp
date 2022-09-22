<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 상세</title>
<style type="text/css">
#hd2_CC{
	padding: 20px 45px 0;
}

#dtlbtn {
	margin-top: 20px; 
}

table {
	border-collapse: collapse;
	margin-bottom: 0px;
}
th {
	font-size: 13px;
	border-bottom: solid 1px #ededed;
	color: #a1a1a1;
	text-align: center;
}
td {
	font-size: small;
	font-weight: 500;
	padding: 10px;
	border-bottom: solid 1px #ededed;
}
#gongzi {
	height: 74%;
	border-bottom: solid 1px #ededed;
	background-color: white;
	color: #444;
	font-weight: 400;
	padding: 10px 30px;
}

#listBtn, #updBtn{
	background-color: #ededed;
    border-radius: 4px;
    border: 1px solid #f4f5ee;
    cursor: pointer;
    color: #5e5e5e;
    font-weight: 600;
    padding: 10px;
    margin-right: 10px;
    font-family: "Gothic A1";
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function() {
		location.href = "adEvt";
	});
	
	$("#updBtn").on("click", function() {
		location.href = "adEvtUpd";
	});
});
</script>
</head>
<body>
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">event_note</span> 
				이벤트
			</div>
		</div>
		<div id="hd2_CC">
			<div id="CCbox">
				<table>
					<colgroup>
						<col width="100px">
						<col width="500px">
						<col width="100px">
						<col width="200px">
						<col width="100px">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>기간</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>01</td>
							<td>여름맞이 둘레길 이벤트</td>
							<td>관리자</td>
							<td>22.06.30 ~ 22.07.30</td>
							<td>1000</td>
						</tr>
						<tr>
							<td colspan="5" id="gongzi" style="text-align: left">이벤트 내용</td>
						</tr>
					</tbody>
				</table>
				<div id="dtlbtn">
					<input type="button" id="listBtn" value="목록" />
					<input type="button" id="updBtn" value="수정" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>