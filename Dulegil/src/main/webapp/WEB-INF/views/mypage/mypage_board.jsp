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
<title>게시글 관리</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#cateNo").on("change", function() {
		$("#page").val("1");
		
		//신규 상태 적용
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		
		// reloadList() DB에서 가져오는 값을 그려줌.
		reloadList();
	});
	
	$("tbody").on("click","td:nth-child(3)",function(){
		$("#no").val($(this).parent().attr("no"));
		
		//기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		console.log($(this).parent().children().eq(1).attr("cate"));
		if($(this).parent().children().eq(1).attr("cate")=="1"){
	         $("#actionForm").attr("action","courseReviewDetail");
	      }else if($(this).parent().children().eq(1).attr("cate")=="2"){
	         $("#actionForm").attr("action","accompanyDetail");
	      }else{
	    	 $("#actionForm").attr("action","freeBoardDetail");  
	      }
		$("#actionForm").submit();	
	});
	
	$("thead").on("click", "#allCheck", function(){
		if($(this).is(":checked")){
			$("tbody #deleteCheck").prop("checked", true);
		}else{
			$("tbody #deleteCheck").prop("checked", false);			
		}
	
		var arr = [];
		$("tbody #deleteCheck:checked").each(function(){
			arr.push($(this).val());
		});
		
		$("#delete").val(arr);
	});	
	
	
	$("tbody").on("click", "#deleteCheck", function(){
		var arr = [];
		
		$("tbody #deleteCheck:checked").each(function(){
			arr.push($(this).val());
		});
		
		if(arr.length == $("tbody #deleteCheck").length){
			$("thead #allCheck").prop("checked", true);
		}else{
			$("thead #allCheck").prop("checked", false);
		}

		$("#delete").val(arr);		
	});
	
	reloadList();
		
	$("#delBtn").on("click",function(){
		var arr = [];
	
	      $("tbody #deleteCheck:checked").each(function(){
	    	  arr.push($(this).val());
	      });
	      $("#delete").val(arr);
	      
	      if(arr.length == ""){
	         makeAlert("알림", "삭제할 게시물을 선택해주세요.");
	      }else{makePopup({
        	title : "알림",
            contents : "삭제 하시겠습니까?",
            buttons   : [{
            	name : "확인",
              	func : function (){
              		   deleteList();
              		   reloadList();
              		   makeAlert("알림", "삭제가 완료되었습니다.");
                 	   closePopup();
                }
            },{
               name : "취소"
           	  }]   
          })
	  }
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
	
	//param은 전 페이지에서 불러오는 데이터
	//페이지가 바뀔때 검색 유지 되게
	//목록을 조회하려면 필요한 페이지 검색 검색어, 동기화가 섞인 상태에서는 이렇게 써야한다.
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

function deleteList(){
	
	$("#cate").val($("#cateNo").val());
	
	   var params = $("#actionForm").serialize();
	                                                            
	   $.ajax({                                                 
	      url:"mypageBoardAjax/delete",                                     
	      type:"POST",                                          
	      dataType:"json",                                      
	      data : params,                                        
	      success: function(res) {     
	    	  switch (res.msg) {
				case "success":
					reloadList();
					break;
				case "fail":
					alert("실패 했습니다.");
					break;
				}
	      },                                                    
	      error: function(request, status, error) {             
	         console.log(request.responseText);                 
	      }                                                     
	   });                                                      
	} 

function reloadList(){
	
	$("#cate").val($("#cateNo").val());
	
	   var params = $("#actionForm").serialize();
	                                                            
	   $.ajax({                                                 
	      url:"mypageBoardAjax/select",                                     
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
/*     김슬아:estp 박현철 :intp
	   김슬아:27 박현철:29 
	   list.김슬아 => 누굴 부르는지 몰라서오류
	   list[0].김슬아 => estp 
	   list[1].김슬아 => 27 */
	var html = "";
	   
	   //list에서 0번째 인덱스(배열)부터 차례대로 data에 넣어줌. 그래서 data.키를 쓰는 것임.
	   
	   for(var data of list) { 
		  // data.김슬아 = > estp // 그 다음 돌때는 27
	      html += "<tr no=\""+ data.POST_NO +"\">";
	      html += "<td>" + data.POST_NO + "</td>";
	      html += "<td cate=\""+ data.BLTNBOARD_NO +"\">" + data.BLTNBOARD_NM + "</td>";
	      html += "<td>" + data.TITLE + "</td>";
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
	   if($("#page").val() * 1 ==i){//현재페이지라면
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
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-mypage">
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>게시글 관리</span>	
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
							<!-- 게시판이름 -->
							<col width="200" />
							<!-- 글제목 -->
							<col width="300" />
							<!-- 작성일 -->
							<col width="100" />
							<!-- 삭제버튼 -->
							<col width="100" />
							</colgroup>
							<thead>
							<tr>
								<th>번호</th>
								<th>게시판이름</th>
								<th>글제목</th>
								<th>작성일</th>
								<th><input type="checkbox" id="allCheck" name="allCheck"/></th>
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
										<option value="1">내용</option>
									</select>
									<div class="searchBox">
										<input type="text" class="serchTxt" name="searchTxt" id="searchTxt" value="${param.searchTxt }" placeholder="검색하기" />				
										<div class="search_ico" > <!-- 검색버튼 -->
									<img src="resources/images/search_icon.png" id="searchBtn"/>
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