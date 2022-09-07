<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mainCon.css" />
<link rel="stylesheet" href="../css/board.css" />
<link rel="stylesheet" href="../css/list.css" />
<link rel="stylesheet" href="../css/fonts.css" />
<title>동행목록</title>

</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">

		<div class="mainWrap">
			<div class="tit">같이 돌아</div>
			<div class="col"></div>
			
			<div class="midBox">
				<!-- <div class=box1>글쓰기</div> -->
				<input type="button" class="wriBtn" value="글쓰기"/>
				
			<div class="searchWrap">
				<div class="selBox">
					<select class="sel">
						<option selected="selected">코스</option>
						<option>1코스-수락·불암산코스	노원구,도봉구	18.6km	8시간 10분</option>
						<option>2코스-용마·아차산코스	광진구,중랑구	12.3km	5시간 10분</option>
						<option>3코스-고덕·일자산코스	강동구,송파구	25.6㎞	8시간50분</option>
						<option>4코스-대모·우면산코스	강남구,서초구	18.3㎞	8시간10분</option>
						<option>5코스-관악·호암산코스	관악구,금천구	13.0㎞	6시간</option>
						<option>6코스-안양천·한강코스	강서구,구로구,금천구,영등포구	18.2km	4시간 30분</option>
						<option>7코스-봉산·앵봉산코스	마포구,은평구	16.8km	6시간 25분</option>
						<option>8코스-북한·도봉산산코스	강북구,도봉구,성북구,은평구,종로구	33.7km	16시간30분</option>
					</select>
				</div>
				<div class="selBox">
					<select class="sel">
						<option selected="selected">select</option>
						<option>제목</option>
						<option>내용</option>
						<option>ID</option>
					</select>
				</div>
				<div class="searchBox">
					<input type="text" class="serchTxt" placeholder="검색하기" />
					
					<div class="search_ico" onclick="chk_search();">
					<img src="../images/search_icon.png" id="searIcon" />
					</div>
			</div>
					
				</div>

			</div>
	<div class="content">
		<table class="table">
		<colgroup >
			<col width="12%" />
			<col width="12%" />
			<col width="52%" />
			<col width="12%" />
			<col width="12%" />
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>코스</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>		
		</thead>
		<tbody>
		<tr>
				<td>1</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>2</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>3</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>4</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>5</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>6</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>7</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>8</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>9</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr><tr>
				<td>10</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
			<tr>
				<td>11</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>	<tr>
				<td>12</td>
				<td>1코스</td>
				<td>같이가실분</td>
				<td>둘레마스터</td>
				<td>20220817</td>
			</tr>
		</tbody>	
	</table>
		
					
					
		</div>
	
	  <div class="pagination">
      <span class="first_arw"><<</span>
      <span class="prev_arw"><</span>
      <span >1</span>
      <span >2</span>
      <span >3</span>
      <span >4</span>
      <span >5</span>

      <span class="next_arw" >></span>
      <span class="end_arw" >>></span>
      </div>
		
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>