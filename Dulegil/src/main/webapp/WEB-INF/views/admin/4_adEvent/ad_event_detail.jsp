<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../common/jscss.jsp" flush="true"/>
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

#header2 #hd2_CC #hd2_paging #pBtn {
	width: 15px;
	height: 15px;
	display: inline-block;
	margin-right: 11px;
	font-family: "Gothic A1";
	font-weight: 500;
}

#header2 #hd2_CC #hd2_paging #pBtn_GD {
	width: 15px;
	height: 15px;
	margin-right: 30px;
	margin-top: 1%;
	display: inline-block;
	font-family: "Gothic A1";
	font-weight: 500;
}

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

#update {
	width: 100%;
	text-align: right;
	margin-top: 10px;
}

/* 작성 & 수정 & 삭제 버튼 */
#write {
	width: 100%;
	text-align: right;
}

table {
	border-collapse: collapse;
	margin-bottom: 0px;
}

th {
	width: 310px;
	height: 10%;
	font-size: 13px;
	padding: 14px;
	border-bottom: solid 1px #ededed;
	color: #a1a1a1;
}

td {
	font-size: small;
	font-weight: 500;
	padding: 10px;
	border-bottom: solid 1px #ededed;
}

th:nth-child(2), td:nth-child(2) {
	width: 67%;
	text-align: left;
}

#tr_1 {
	font-size: 14px;
}

#gongzi {
	height: 74%;
	border-bottom: solid 1px #ededed;
	background-color: white;
	color: #444;
	padding: 20px;
	font-size: 13px;
	font-weight: 400;
}
</style>
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
					<thead>
						<tr>
							<th colspan="1">번호</th>
							<th colspan="6">글 제목</th>
							<th colspan="1">작성자</th>
							<th colspan="1">기간</th>
							<th colspan="1">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="1">01</td>
							<td colspan="6">여름맞이 둘레길 이벤트</td>
							<td colspan="1">관리자</td>
							<td colspan="1">22.06.30 ~ 22.07.30</td>
							<td colspan="1">1000</td>
						</tr>
					</tbody>
				</table>

				<div id="gongzi">
					<a> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br />
						여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는
						이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트
						입니다. <br /> 여기는 이벤트 입니다. <br /> 여기는 이벤트 입니다. <br />

					</a>
				</div>
				<div id="update">
					<input type="button" value="수정" class="delBtn" />
				</div>
			</div>
			<div id="search">
				<div class="Sbar3">
					<input type="button" class="delBtn" value="목록" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>