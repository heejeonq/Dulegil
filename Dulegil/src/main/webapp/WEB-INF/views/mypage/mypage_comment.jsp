<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>댓글 관리</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#cateNo").on("change", function() {
		$("#page").val("1");
		
		//신규 상태 적용
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		
		reloadList();
	});
	
	$("tbody").on("click",".boardcontents",function(){
		$("#no").val($(this).attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action","freeBoardDetail");
		$("#actionForm").submit();
		
	});
	
	$("tbody").on("click","#deleteCheck",function(){
		var arr = [];
		console.log("클릭됨")
		$("#deleteCheck:checked").each(function(){
			arr.push($(this).val());
		})
		$("#delete").val(arr);
	});
	
	reloadList();
		
	$("#delBtn").on("click",function(){
		reloadList();
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
		
	});
});

function reloadList(){
	
	$("#cate").val($("#cateNo").val());
	
	   var params = $("#actionForm").serialize();
	                                                            
	   $.ajax({                                                 
	      url:"mypageCommentAjax",                                     
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
	      html += "<tr>";
	      html += "<td class=\"boardcontents\" no=\"" + data.POST_NO + "\">" + data.POST_NO + "</td>";
	      html += "<td class=\"boardcontents\" no=\"" + data.POST_NO + "\">" + data.TITLE + "</td>";
	      html += "<td class=\"boardcontents\" no=\"" + data.POST_NO + "\">" + data.CONTENTS + "</td>";
	      html += "<td>" + data.REG_DT + "</td>";
	      html += "<td> <input type=\"checkbox\" id=\"deleteCheck\" name=\"deleteCheck\" value=\""+data.POST_NO+"\"></td>";
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
	   if($("#page").val() * 1 ==i){//현재 페이지라면
		  html += "<span class=\"page_btn_on\" page=\"" + i + "\">" + i + "</span>"   
	   }else{
		  html += "<span class=\"page_btn\" page=\"" + i + "\">" + i + "</span>";	   
	   }	   
   }
   if($("#page").val() * 1 == pd.maxP){ //현재 페이지가 마지막 페이지면
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
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>댓글 관리</span>
					<select class="sel sel_right" id="cateNo">
						<option value="0">전체</option>
   					  	<c:forEach var="data" items="${cate}">
   	  					<option value="${data.BLTNBOARD_NO}">${data.BLTNBOARD_NM}</option>
   	  				</c:forEach>
   	 				</select>
					<div class = intro>
						<table class="table">
							<colgroup>
							<!-- 번호 -->
							<col width="100" /> 
							<!-- 글제목 -->
							<col width="200" />
							<!-- 댓글내용 -->
							<col width="300" />
							<!-- 작성일 -->
							<col width="100" />
							<!-- 삭제버튼 -->
							<col width="100" />
							</colgroup>
							<thead>
							<tr>
								<th>번호</th>
								<th>글제목</th>
								<th>댓글내용</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
							</thead>
							<tbody>
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
								<form action="#" class="searchform" id="actionForm" method="post">
									<input type="hidden" name="no" id="no"/>
									<input type="hidden" name="sMemNo" id="sMemNo" value="${sMemNo}"/>
									<input type="hidden" name="cate" id="cate"/>
									<input type="hidden" name="delete" id="delete"/>
									<input type="hidden" name="page" id="page" value="${page}" />
									<select class="sel" name="searchGbn" id="searchGbn">
										<option value="0">글제목</option>
										<option value="1">댓글내용</option>
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