<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>댓글 관리</title>
<script type="text/javascript">
function change_btn(e) {
   var btns = document.querySelectorAll(".btnbox");
   btns.forEach(function(btn, i) {
      if(e.currentTarget == btn) {
         btn.classList.add("active");
      }
      else {
         btn.classList.remove("active");
      }
   });
   console.log( e.currentTarget );
}
</script>
</head>
<body>
<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-mypage">

		<!-- Sidebar -->
		<div class="mypageBtn">
			<ul class="btnsBox">
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">내 정보</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">개인 정보 수정</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox active" onclick="change_btn(event)">게시글 관리</button></li>
				</a>
				<a href="#">
				  <li><button class="btnbox" onclick="change_btn(event)">댓글 관리</button></li>
				</a>
				<a href="#">
				   <li><button class="btnbox" onclick="change_btn(event)">동행</button></li>
				</a>      
			</ul>
		</div>
		
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>댓글 관리</span>
					<select class="sel sel_right">
							<option>자유게시판</option>
							<option>코스별후기</option>
							<option>동행구하기</option>
					</select>
					<div class = intro>
						<table class="table">
							<thead>
							<tr>
								<th>번호</th>
								<th>게시판이름</th>
								<th>글제목</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
							</thead>
							<tbody>
							</tbody>
							<tr>
								<td>1</td>
								<td>2코스 15일..</td>
								<td>저요!! 제가 갈래요!!!</td>
								<td>22.07.08</td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>2</td>
								<td>오늘 날씨가...</td>
								<td>전 너무 덥지만 좋았어요^^</td>
								<td>22.06.02</td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>3</td>
								<td>오늘 날씨가...</td>
								<td>너무 더웠어요...</td>
								<td>22.06.01</td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>4</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>6</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>7</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>8</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>9</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>10</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>11</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>12</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>13</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>14</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>15</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>16</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>17</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>18</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>19</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>20</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							</tbody>
						</table>
		
		
						<!-- DeleteBtn -->
						<input type="button" name="delBtn" id="delBtn" class="btn green" value="삭제">
						
						
						<!-- Paging -->			
						<div class="pagination">
					    <span class="first_arw"><<</span>
					    <span class="prev_arw"><</span>
					    <span >1</span>
					    <span >2</span>
					    <span >3</span>
					    <span >4</span>
					    <span >5</span>
					    <span >6</span>
					    <span class="next_arw" >></span>
					    <span class="end_arw" >>></span>
					    </div>
					         
					    <!-- Searching -->  
						<div>
							<div>  
								<div class="midbox">
										<select class="sel">
											<option selected="selected">select</option>
											<option>제목</option>
											<option>내용</option>
										</select>
									<div class="searcBox">
										<input type="text" class="serchTxt" placeholder="검색하기" />
										<div class="search_ico" onclick="chk_search();">
										<img src="resources/images/dod.png" id="searIcon" />
										</div>
									</div>
								
								
								</div>
							</div>
						</div>
					</div> <!-- intro end -->
				</div>
			</div>
		</div>
	</div>


<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
  </body>
  </html>