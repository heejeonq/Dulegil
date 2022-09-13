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
<title>게시글 관리</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	
	if("${param.searchGbn}" !=""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");
	}
	

	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		
		//신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
	
	reloadList();
	
})

$("#wriBtn").on("click",function(){
	//기존 검색상태 유지
	$("#searchGbn").val($("#oldGbn").val());
	$("#searchTxt").val($("#oldTxt").val());
	
	$("#actionForm").attr("action","ATInsert");
	$("#actionForm").submit();
	
	
});
$(".pagination").on("click","span",function(){
	
	//기존검색유지		
	if($("#oldGbn").val() != "") {
	$("#searchGbn").val($("#oldGbn").val());
	$("#searchTxt").val($("#oldTxt").val());
	//전에 입력한 구분과 텍스트를 현재로 데려옴
	}
	
	$("#page").val($(this).attr("page"));
	
	reloadList();
});

$("tbody").on("click","tr",function(){
	$("#no").val($(this).attr("no"));
	
	//기존 검색상태 유지
	$("#searchGbn").val($("#oldGbn").val());
	$("#searchTxt").val($("#oldTxt").val());
	
	$("#actionForm").attr("action","freeBoardDetail");
	$("#actionForm").submit();
	
});

});;//document.ready end

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



function reloadList(){
	   
	   var params = $("#actionForm").serialize();
	                                                            
	   $.ajax({                                                 
	      url:"mypage_boardAjax",                                     
	      type:"POST",                                          
	      dataType:"json",                                      
	      data : params,                                        
	      success: function(res) {                              
	    	  drawList(res.list);
	    	  drawPaging(res.pd);
	      },                                                    
	      error: function(request, status, error) {             
	         console.log(request.responseText);                 
	      }                                                     
	   });                                                      
	}  

function drawList(list){
	   var html = "";
	   
	   for(var data of list) { 
	      html += "<tr no=\"" + data.POST_NO + "\">";
	      html += "<td>" + data.POST_NO + "</td>";
	      html += "<td>" + data.BLTNBOARD_NM + "</td>";
	      html += "<td>" + data.TITLE + "</td>";
	      html += "<td>" + data.REG_DT + "</td>";
	      html += "<td> <input type=\"checkbox\" name=\"delete\"> </td>";
	      html += "</tr>";
	   }
	   
	   $("tbody").html(html);
	}  
	
function drawPaging(pd){
	var html="";
	
   html += "<span class=\"first_arw\"page=\"1\"><<</span> ";
   if($("#page").val() == "1" ) {
   html += "<span class=\"prev_arw\" page=\"1\" ><</span>   ";
   }else{
	   html += "<span class=\"prev_arw\" page=\"" + ($("#page").val() *1 -1 )+ "\" ><</span>   ";
   }
   for(var i = pd.startP; i<=pd.endP; i++){
	   if($("#page").val() * 1 ==i){//현재페이지라면
		  html += "<span class=\"page_btn_on\" page=\"" + i + "\">" + i + "</span>"   
	   }else{
		  html += "<span class=\"page_btn\" page=\"" + i + "\">" + i + "</span>";	   
	   }	   
   }
   if($("#page").val() * 1 == pd.maxP){ //현재 페이지가 마지막 페이지면...
	   html += "<span class=\"next_arw\" page=\"" + pd.maxP + "\">></span>  ";
   }else{
	   html += "<span class=\"next_arw\"  page=\"" + ($("#page").val() * 1 + 1) + "\">></span>  ";
   }
   
   //마지막 페이지는 마지막 페이지
     html += "<span class=\"end_arw\" page=\"" + pd.maxP + "\">>></span>  ";
     
     $(".pagination").html(html);
   
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
					<span>게시글 관리</span>
			
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
	<!-- 						<tr>
								<td>1</td>
								<td>자유게시판</td>
								<td>오늘 날씨가 정말 덥네요;</td>
								<td>22.06.30</td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>2</td>
								<td></td>
								<td></td>
								<td></td>
								<td><input type="checkbox" name="delete"></td>
							</tr>
							<tr>
								<td>3</td>
								<td></td>
								<td></td>
								<td></td>
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
							</tr> -->
							</tbody>
						</table>
						
						<!-- DeleteBtn -->
					 	<input type="button" name="delBtn" id="delBtn" class="btn green" value="삭제">
						
						<!-- Paging -->			
						<div class="pagination">
					    </div>
					          
					    <!-- Searching -->  
						<div>
							<div>  
								<div class="midbox">
								<input type="hidden" id="oldGbn"  value="${param.searchGbn}"/>
								<input type="hidden" id="oldTxt"  value="${param.searchTxt}"/>	
									
								<form action="#" id="actionForm" method="post">
									<input type="hidden" name="no" id="no"/>
									<input type="hidden" name="page" id="page" value="${page}" />
									
										<select class="sel" name="searchGbn" id="searchGbn">
											<option selected="selected">select</option>
											<option value="0">제목</option>
											<option value="1">내용</option>
										</select>
									<div class="searchBox">
										<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt }" placeholder="검색하기" />				
										<div class="search_ico" > <!-- 검색버튼 -->
										<img src="resources/images/search_icon.png" id="searchBtn"  />
										</div>
									</div>
								</form>
								
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