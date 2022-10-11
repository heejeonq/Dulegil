<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../adjscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹 사이트 활동 집계</title>
<style type="text/css">
#box1 {
	width: 100%;
	height: 6%;
	font-size: small;
	margin: 8px 0px;
	text-align: -webkit-center;
	font-size: small;
	margin: 8px 0px;
}

#box2 {
	width: 100%;
	height: 11%;
	font-size: medium;
	margin: 10px 0px;
	text-align: -webkit-center;
	font-size: medium;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 50px;
	color: #404040;
	box-shadow: 3px 3px 3px 0px #ebebeb;
	border-radius: 4px;
}

td, th {
	border-collapse: collapse;
	text-align: center;
	padding: 4px;
	color: #404040;
	font-weight: 500;
}

th {
	width: 153px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}

td {
	font-size: small;
	padding: 8px;
}

#cal {
	width: 599px;
	height: 249px;
	margin-top: 70px;
	display: inline-block;
	background-image:
	url('http://localhost:8090/Dulegil/resources/images/mintable.png');
	background-size: cover;
}
</style>
<script type="text/javascript">


</script>
</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">leaderboard</span> 
			웹사이트활동 집계
		</div>
					
		<!-- 통계 표 -->
		<div id="cal"></div>

		<div id="box1">
			<table>
				<thead>
					<tr>
						<th>총 회원 수</th>
						<th>게시글 수</th>
						<th>댓글 수</th>
						<th>동행 신청 수</th>
						<th>동행 성사 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${data.MEMCNT}</td>
						<td>${data.POSTCNT}</td>
						<td>${data.CMTCNT}</td>
						<td>${data.ACPCNT}</td>
						<td>${data.CNT}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="box2">
			<table>
				<thead>
					<tr>
						<th>기간</th>
						<th>게시글</th>
						<th>댓글 수</th>
						<th>회원가입 수</th>
						<th>동행 신청 수</th>
						<th>동행 성사 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2022.03.01 ~<br /> 2022.03.15
						</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
					</tr>
				
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>