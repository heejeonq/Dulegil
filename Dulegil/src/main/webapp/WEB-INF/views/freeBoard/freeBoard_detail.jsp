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
<link rel="stylesheet" href="resources/css/freeBorDet.css" />
<title>자유게시판상세</title>
<!-- 제이쿼리 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action","freeBoard")
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
								console.log(request, responseText); //실패 상세내영
							}

						});

					}
				}, {
					name : "취소"
				} ]
			});
		});

		$("#updateBtn").on("click", function() {
			$("#actionForm").attr("action", "freeBoardUpdate");
			$("#actionForm").submit();
		});
	});

	//document






var msg = {
		"insert" : "등록",
		"update" : "수정",
		"delete" : "삭제",
}

function action(flag){
	//con의 <들을 웹문자로 변환
	$("#con").val($("#con").val().replace(/</gi, "&lt;"));
	
	$("#con").val($("#con").val().replace(/>/gi, "&gt;"));
	console.log(msg[flag]);
	//Javascript Object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수 있다.
	//							 Java의 Map에서의 get,put 역할

	 var params = $("#actionForm").serialize();   
      $.ajax({
         url:"freeCAction/" + flag, //경로 주소 새로생기면 컨트롤러 가
         type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
         dataType: "json", //
         data: params, //json 으로 보낼데이터
         success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
         
         switch(res.msg){         
         case "success" :
        	 //내용 초기화
        	 $("#con").val("");
        	 
        		reloadList();
            //목록 재조회
            switch(flag) {
            	case "insert" :  
            	case "delete":
            		//조회 데이터 초기화
            		$("#page").val("1");
            		$("#searchGbn").val("0");
            		$("#searchText").val("");
            		$("#oldGbn").val("0");
            		$("#oldText").val("");
            		break;
            	case "update":
            		//기존값 유지
            		$("#searchGbn").val($("#oldGbn").val());
					$("#searchText").val($("#oldText").val()); 
					
					//입력내용 초기화
					$("#no").val("");		
					$("#con").val("");		
					//등록버튼 나타나기 + 수정,취소 버튼 감추기
					$(".insert").show();
					$(".update").hide();
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
            console.log(request,responseText); //실패 상세내역
         }
         
      });	//Ajax end
}//action Function End

</script>
</head>
<body>
	<!-- Header -->
		<jsp:include page="../common/header.jsp" flush="true"/>


	<!-- Container -->

	<div class="container-main">
		
		<form action="#" id= "actionForm" method="post">
			<input type="hidden" name="no" value="${data.POST_NO}" />
			<input type="hidden" name="gbn" value="d" />
			<input type="hidden" name="page" value= "${param.page}" />
			<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}"/>
			<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
		</form>
		
		<div class="mainWrap">
		<div class="tit">둘레길 이야기</div>
		<div class="col"></div>
		
		<div class="midBox">
		<div class="emptyBox"></div>
		<div class="tit_tt"> ${data.TITLE} </div>
	
		<div class="ti_ttt">
			<div class="tit_writer">
			<c:if test="${!empty data.M_IMG}">
			<img src="resources/upload/${data.M_IMG}" />
			</c:if>
			 ${data.NM}</div><span>&nbsp;&nbsp;</span>
			<div class="tit_date">
			작성일 ${data.DT}</div>
		</div>
		<hr/>
		<div class="contentBox">
		<div class="emptyBox"></div>
		<div class= "imgg">
		<c:if test="${!empty data.B_IMG}">
		<img src="resources/upload/${data.B_IMG}" /><br/>
		</c:if>
		<div class="te"> ${data.CONTENTS}</div>
		</div>
	
			</div>
		<div class="emptyBox">
		
		<c:if test="${!empty data.B_IMG}">
		<!-- fn:length(대상) : 대상 문자열의 길이나 배열, 리스트의 크기를 가져온다. -->
		<c:set var="fileLength" value="${fn:length(data.B_IMG)}"></c:set>
		<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
		<c:set var="fileName" value="${fn:substring(data.B_IMG, 20, fileLength)}"></c:set>
		<span>첨부파일 : 
		<a href = "resources/upload/${data.B_IMG}" download="${fileName}">${fileName}</a></span>
		</div>
		</c:if>
		
		<div class="box2">
		
			<div class="reporBtn">
				<span class="report">
					<img src="resources/images/report1.png" />
				</span>
				<span class="reporTit">신고하기</span>			
			</div>
			<c:if test="${sMemNo eq data.MEMBER_NO}" >
			<input type="button" class="btn" id="deleteBtn" value="삭제"/>		
			<input type="button" class="btn" id="updateBtn" value="수정"/>
			</c:if>
			<input type="button" class="btn" id="listBtn" value="목록"/>
		</div>

		
	

			</div>
		<div class="emptyBox"></div>
		<div class="emptyBox"></div>
			
			
		<hr/>
			<div class= mainview3>
				<div class="box3">
					<div class="comment">comment</div>
					
					<div class="commentBox">
					<input type="text" class=commentBoxT id="con" name="con" placeholder="댓글을 입력하세요" />
					</div>
					
					<input type="button" class="regBtn" id="insertBtn" value="등록"/>
				</div>
				<div class="coll"></div>
			</div>
			
			
			
			<div class="mainview4">
			<div class="iconBox">
			<img src="resources/upload/${data.C_IMG}" /><br/>
			</div>
			<div class="idBox">
			<img src="resources/images/sample2.jpg" class="bbo"/> ${data.CNM}
		    </div>			
		    <div class="commentDe">${data.CCONTENTS}

		    </div>
		    <div class="date">${data.CDT}</div>
		   <div class="more">
				<input type="button" class="moreBtn" value="더보기+" />
			</div>
			</div>
			
			
				
		

	
		</div>
		
		





	<!-- footer -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>