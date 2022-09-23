<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/withDulDet.css" />
<title>동행상세</title>
<style>
.update{
	display:none;
}
.commentBox span{
	font-size:13px;
    line-height: 50px;
    color: #808080;
    float:left;
}
</style>
<!-- 제이쿼리 -->
<script>
$(document).ready(function(){
	reloadList();
	$(".moreBtn").on("click",function(){
		$(".moreBtn").show();
	})
	
	//게시글 버튼
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","accompany")
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click",function(){

		makePopup({
					title : "알림",
					contents : "삭제하시겠습니까?",
					buttons : [ {
						name : "삭제",
						func : function() {
							var params = $("#actionForm").serialize();
							$.ajax({
								url : "FREEAction/delete", //경로
								type : "POST", //전송방식(GET : 주소형태,POST: 주소 헤더)
								dataType : "json",
								data : params,
								success : function(res) {
									switch (res.msg) {// 성공했을 때 결과를 res에 받고 함수 실행
									 case "success" :
			        	                    $("#page").val("1");
			        	                    $("#searchgbn").val("0");
			        	                    $("#searchTxt").val("");
			        	                    
			        	                    
			        	                    $("#actionForm").attr("action","freeBoard");									
			        	                    $("#actionForm").submit();									
										
										break;
									case "failed":
										makeAlert("알림", "삭제에 실패했습니다");
										break;
									case "error":
										makeAlert("알림", "삭제중 문제가 발생했습니다");
										break;
									}

								},
								error : function(request, status, error) { //실패했을 때 함수 실행
									console.log(request.responseText); //실패 상세내영
								}

							});

						}
					}, {
						name : "취소"
					} ]
				});
			});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "accompanyUpdate");
		$("#actionForm").submit();
	});
	
	//댓글버튼
	
	$(".box3 #loginBtn").on("click",function(){
		location.href="login"
	});
	
	$(".box3 #insertCBtn").on("click",function(){
	
		 if ($.trim($("#ccon").val()) == "") {
	            makeAlert("알림", "내용을 입력하세요.", function() {
	               $("#ccon").focus();
	            });

	         }else{
				action("insert");	 			
	         }
			$("#commentsForm").attr("action","accompanyDetail")
			$("#commentsForm").submit();
	
	});
	
	
	
	
	//댓글 삭제버튼 클릭시
	$(".mainview4").on("click",".delB",function(){
		
		var commentNo= $(this).parent().attr("commentNo");
		
		makePopup({
			title:"알림",
			contents : "삭제하시겠습니까?",
			buttons : [{
				name:"삭제",
				func:function() {
					$("#commentNo").val(commentNo);
					action("delete");
					closePopup()//제일위의 팝업닫기
		$("#commentsForm").attr("action","accompanyDetail")
		$("#commentsForm").submit();
				}			
			
			},{
				name : "취소"
			}]
		});
	});
	
	
	
		//댓글의 수정버튼 클릭시
	$(".mainview4").on("click",".upB",function(){
		
	var commentNo= $(this).parent().attr("commentNo");
	$("#commentNo").val(commentNo);
	
	var ccon = $(this).parent().children().eq(2).html();
	$("#ccon").val(ccon);
	
	$(".insert").hide();
	$(".update").css("display","inline-block");
	
	});
	
	//수정영역의 취소버튼
	$(".box3 #cancelCBtn").on("click",function(){
		//입력내용 초기화
		$("#commentNo").val("");		
		$("#ccon").val("");		
		//등록버튼 나타나기 + 수정,취소 버튼 감추기
		$(".insert").show();
		$(".update").hide();
	});
	
	//수정영역의 수정버튼
	$(".box3 #updateCBtn").on("click",function(){
		action("update");
		$("#commentsForm").attr("action","accompanyDetail")
		$("#commentsForm").submit();
		
	});
	
	$("#moreBtn").on("click",function(){ //더보기 버튼 누르면
		//more버튼을 누르면 페이지가 더보이게
		$("#cpage").val($("#cpage").val() * 1 + 1);
		reloadList(); 	
	});
	
	//동행신청 버튼 누르면 
	$("#withMBtn").on("click",function(){ 
		action("apply");

			
	});

});
var msg = {
		"insert" : "등록",
		"update" : "수정",
		"delete" : "삭제",
		"apply" : "동행신청",
}

function action(flag){
	//con의 <들을 웹문자로 변환
	$("#ccon").val($("#ccon").val().replace(/</gi, "&lt;"));
	
	$("#ccon").val($("#ccon").val().replace(/>/gi, "&gt;"));
	console.log(msg[flag]);
	//Javascript Object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수 있다.
	//							 Java의 Map에서의 get,put 역할

	 var params = $("#commentsForm").serialize();   
      $.ajax({
         url:"accompanyCAction/" + flag, //경로 주소 새로생기면 컨트롤러 가
         type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
         dataType: "json", //
         data: params, //json 으로 보낼데이터
         success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
         
         switch(res.msg){         
         case "success" :
        	 $("#ccon").val("");       	 
        		reloadList();
            //목록 재조회
            switch(flag) {
            	case "insert" :  
            	case "delete":
            		//조회 데이터 초기화
            		//$("#page").val("1");
            		//$("#searchGbn").val("0");
            		//$("#searchText").val("");
            		//$("#oldGbn").val("0");
                 	//	$("#oldText").val("");
            		break;
            	case "update":
            		//기존값 유지
            	//	$("#searchGbn").val($("#oldGbn").val());
				//	$("#searchText").val($("#oldText").val()); 
					
					//입력내용 초기화
					$("#cno").val("");		
					$("#ccon").val("");		
					//등록버튼 나타나기 + 수정,취소 버튼 감추기
					$(".insert").show();
					$(".update").hide();
            		break;
            	case "apply":
            		
            		break;
            }            
            reloadList();
            
            break;
         case "fail" :
            makeAlert("알림", msg[flag]+"에 실패하였습니다.")
            break;
         case "error" :                     
            makeAlert("알림", msg[flag]+"중 문제가 발생하였습니다.")
            break;
         }
               
         },
         error :function(request, status, error) { //실패했을 때 함수 실행 isfp
            console.log(request.responseText); //실패 상세내역
         }
         
      });	//Ajax end
}//action Function End

//댓글 reloadlist
function reloadList(){	
	var params = $("#commentsForm").serialize();
	
	$.ajax({
		url : "accompanyCommentAjax", //경로
		type : "POST", //전송방식(GET : 주소형태,POST: 주소 헤더)
		dataType : "json",
		data : params,
		success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행			
			drawList(res.list, res.list2, res.applyCnt);		
		},
		error : function(request, status, error) { //실패했을 때 함수 실행
			console.log(request.responseText); //실패 상세내용
		}

	});
};

 function drawList(list, list2, applyCnt) {
//만약 다섯개 미만이면 버튼을 삭제하고	
	if(list.length<5){
		$("#moreBtn").remove();		
	}
	console.log(list);
	
	var html = ""; //변수선언
	var html2 = ""; //동행 신청자 목록
	var html3 ="";
	
	for(var data of list){ // " +  + " 1(내용) 대신 넣자
              
		html += " <div class=\"comBox\" commentNo= \"" + data.COMMENT_NO + "\"> ";
		html += " <div class=\"iconBox\">";
		html += " 	<img src=\"resources/images/detailViewIcon.png\" />";
		html += " </div>";
		html += " <div class=\"idBox\">";
		html += " 	 <img src=\"resources/upload/" + data.P_IMG + "\" class=\"pimg\"/>  " + data.CNM + "";
	    html += " </div>";
	    html += " <div class=\"commentDe\">" + data.CCONTENTS + "</div>";
  	    html += " <span class=\"date\">" + data.CREG_DT + "</span>";
 		
 		if("${sMemNo}" == data.CMEMBER_NO){//작성자이면
 			html += "<span class=\"upB\">수정</span> ";
 			html += "<span class=\"delB\">삭제</span>";
 		}
 			html += " </div>";		
	}//여기까지 for
	
	//동행 신청자 목록
	for(let data of list2){
		html2 += "<td><div class=\"withM\">" + data.NM + "</div> </td>"
	}
	
	html3 += applyCnt.CNT;
	
	$(".mainView4").append(html);
	$(".withMemList").html(html2);
	$(".applyCnt").html(html3);

	
} 


</script>
</head>
<body>
	<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->

	<div class="container-main">
      
      <form action="#" id= "actionForm" method="post">
			<input type="hidden" name="no" value="${data.POST_NO}" />
			<input type="hidden" name="gbn" value="d" />
			<input type="hidden" name="page" value= "${param.page}" />
			<input type="hidden" name="cnt" id="cnt" value= "${param.cnt}" />
			
			<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}"/>
			<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
	  </form>
      
      
      <div class="mainWrap">
      <div class="tit">동행구하기</div>
      <div class="col"></div>
      
      <div class="midBox">
      <div class="emptyBox"></div>
      <div class="tit_tt">${data.TITLE}</div>
      <div class="tit_tt">
         <div class="tit_cos">
         <img src="resources/images/gitIcon.png" />
         ${data.COURSE_NO}코스-${data.COURSE_NM}
         </div>
   
         <div class="tit_Ddate">| ${data.ACCOMPANY_DT}
         <img src="resources/images/gitIcon.png" /></div>
         
         
      </div>
      <div class="midBox">
         <div class="intro">
            <div class="tit_writer">
            <img src="resources/images/sample1.jpg" />${data.NM}  </div><span>&nbsp;&nbsp;</span>
            <c:choose>
            	<c:when test="${data.PUBLIC_AGE eq 1}">
            		<div class="age"> 나이 비공개 </div>
            	</c:when>
            	<c:otherwise>
		            <div class="age"> 만 ${data.AGE} 세 </div>         
            	</c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${data.PUBLIC_GENDER eq 1}">
            		<div class="age"> 성별 비공개 </div>
            	</c:when>
            	<c:otherwise>
            		<c:choose>
	            		<c:when test="${data.GENDER} eq 0">
				            <div class="gender"> 남 </div>                     		
	            		</c:when>
	            		<c:otherwise>
	            			<div class="gender"> 여 </div>
	            		</c:otherwise>
            		</c:choose>
            	</c:otherwise>
            </c:choose>
            <div class="trust">
               <img src="resources/images/Mstar.png"  />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar2.png" />
            </div>
         </div>
         
         
         <div class="tit_date">
         작성일  
         ${data.DT}</div>
         
      </div>
      
      <hr/>
      <div class="conBox">
      <div class="emptyBox"></div>
      <div class= "imgg">
      <img src="resources/upload/${data.B_FILE}" /><br/>
      <div class="te"> ${data.CONTENTS}</div>
      </div>
      
      <div class="btnBox">
      
         <div class="withMBtn" id="withMBtn">
	         <span class="withMB">
	         <img src="resources/images/manico.png" />
	         </span>
	         <div class="withMTitW">
	         <span class="withMTit">동행신청</span>   
	         </div>               
         </div>
         
         <div class="reporBtn">
         <span class="report">
         <img src="resources/images/report1.png" />
         </span>
         <span class="reporTit">신고하기</span>         
         </div>
         
      </div>
         
   <div class="emptyBox"></div>      
      <div class="box2">
      
         
         
        <c:if test="${sMemNo eq data.MEMBER_NO}" >
			<input type="button" class="btn" id="deleteBtn" value="삭제"/>		
			<input type="button" class="btn" id="updateBtn" value="수정"/>
		</c:if>    
         <input type="button" class="btn" id="listBtn" value="목록"/>
      </div>
            
      </div>
   
      

      </div>
      
      
      <div class="emptyBox"></div>
      <div class="emptyBox"></div>
         
         
      <hr/>
      <div class="DulList">
      <table>
      <colgroup>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      </colgroup>
         <thead>
            <tr>
               <th colspan="5">
               <img src="resources/images/manico.png" />
               동행신청자 / <span class="applyCnt"></span> 명</th>

            </tr>
         </thead>
         <tbody>
            <tr class="withMemList">
          
            </tr>
            
         
         </tbody>
      
      </table>
      
      
      </div>
     
         
         
      <hr/>
         <div class= mainview3>
         	<form action="#" id="commentsForm" method="post">
			<input type="hidden" name="commentNo" id="commentNo" value="${data.COMMENT_NO}">
			<input type="hidden" name="cmemberNo" id="cmemberNo" value="${sMemNo}">
			<input type="hidden" name="no" id="no" value="${param.no}">	
			<input type="hidden" name="cpage" id="cpage" value="1" />
			
            <div class="box3">
               <div class="comment">comment</div>
               
               <c:choose>
					<c:when test="${empty sMemNo}"><!-- 비로그인시 -->	
					<div class="commentBox">
						<span class="commentBoxT">로그인이 필요한 서비스 입니다.</span>
					</div>
						 <input type="button" class="regBtn" id="loginBtn" value="로그인"/>
					</c:when>
					
					<c:otherwise><!-- 로그인시 -->	
					<div class="commentBox">
					
               			<textarea rows="19" cols="100" class=commentBoxT id="ccon" name="ccon" placeholder="댓글을 입력하세요" ></textarea>
               		</div>
               </form>
             
               
               <span class="insert">									
				   <input type="button" class="regBtn" id="insertCBtn" value="등록"/>
				</span>
           	  <div class="update"  >
					<div class="updateCBtn" id="updateCBtn">수정</div>
					<div class="cancelCBtn" id="cancelCBtn">취소</div>
			  </div>
			
				   </c:otherwise>
			</c:choose>
           
          </div>
            
            <div class="coll"></div>
        
         
         <div class="mainview4">
         
          
         </div>
         <div class="more">
			<input type="button" class="moreBtn" id="moreBtn" name="moreBtn" value="더보기+"/>							 
		</div>


         </div>
         </div>
   
      



	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>