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
<title>자유게시판상세</title>
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
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
	


	

	$("#clistBtn").on("click",function(list){	
		history.go(-1);
		$("#actionForm").attr();
		$("#actionForm").submit();
	}); 
	
	
	
	//게시글 신고하기 버튼 누르면 
	$("#reporBtn").on("click",function(){ 
		 if ($("#sMemNo").val() == "") {
	       makeAlert("알림", "로그인이 필요한 서비스입니다.", function() {	 
	       });
	     } else{
	    	 reportText2(); // reportText2(); 로 넘어가
	    	 
			 
		 }
	 });
	

	//댓글 신고하기
	$(".mainView4").on("click", ".singo img", function(){
		
		if($(this).parent().children(".singo_contents").css("display") == "none"){
			$(".singo_contents").css("display", "none");
			$(this).parent().children(".singo_contents").css("display", "flex");
			//$(".singo_contents").show();		
		}
		else {
			$(this).parent().children(".singo_contents").css("display", "none");
		}
	
	});
	
	$(".mainView4").on("click", "#reportBtn", function(){
		let commentNo = $(this).parent().parent().parent().attr("commentNo");
		let reportNo = $('input[name="report"]:checked').val();
		let reportNm = $(this).parent().parent().parent().attr("reportNm");

		$("#commentNo").val(commentNo);
		$("#reportTypeNo").val(reportNo);
		$("#reportNm").val(reportNm);
		if (reportNo == null) {
            makeAlert("알림", "신고내용을 선택하세요.", function() {
            });
		 }
		else{
			if(reportNo == "5"){
				
				reportText();
			}
			else{
				action("commentReport");
			
			}
			$(".singo_contents").css("display", "none");
			
		}
		
		
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
			$("#actionForm").attr("action", "freeBoardUpdate");
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
		});
		
		
		//댓글 삭제버튼 클릭시
		$(".mainview4").on("click",".delB",function(){
			
			var commentNo= $(this).attr("commentNo");
			
			makePopup({
				title:"알림",
				contents : "삭제하시겠습니까?",
				buttons : [{
					name:"삭제",
					func:function() {
						$("#commentNo").val(commentNo);
						action("delete");
						closePopup()//제일위의 팝업닫기
	
					}			
				
				},{
					name : "취소"
				}]
			});
		});
		
		
		
 		//댓글목록의 수정버튼 클릭시
		$(".mainview4").on("click",".upB",function(){
			
		var commentNo= $(this).attr("commentNo");
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
	});
	
	
 	$("#moreBtn").on("click",function(){ //더보기 버튼 누르면
		//more버튼을 누르면 페이지가 더보이게
		$("#cpage").val($("#cpage").val() * 1 + 1);
		$(".mainView4").empty();
		reloadList(); 	
	});
}); //document

//댓글 신고 텍스트
function reportText() {
	html = "";
	
	html += "			<table class=\"board_detail_table\">  		";
	html += "				<tbody>                                                                   			";
	html += "				<tr>                                                                  			";
	html += "					<th class=\"popup_th\">신고 내용을 입력하세요</th>                                                      			";
	html += "				</tr>                                                                  			";
	html += "				<tr>                                                                  			";
	html += "					<td>";
	html += "					<textarea rows=\"4\" cols=\"35\" name=\"descript\" id=\"descript\"></textarea>";
	html += "					</td>    ";
	html += "				</tr>                                                                  			";
	html += "				</tbody>                                                                  			";
	html += "			</table>";
	
		makePopup({
			depth : 1,
			width : 300,
			height : 200,
			bg : true,
			bgClose : false,
			title : "신고하기 기타사유",
			contents : html,
			draggable : false,
			buttons : [{
				name : "신고하기",
				func:function() {
					console.log($("#reportTypeNo").val());
					$("#reportContents").val($("#descript").val());

					
					if ($.trim($("#descript").val()) == "") {
			             makeAlert("알림", "내용을 입력하세요.", function() {
			                $("#descript").focus();
			             });
					 }
					 else{
						action("commentReport");
						$("#reportContents").val("");
						closePopup();
						 
					 }
				}
			}, {
				name : "취소"
			}]
		});
}

function reportText2() {
	html = "";
	
	html += "			<table class=\"board_detail_table\">  		";
	html += "				<tbody>                                                                   			";

	html += "				<div class=\"singo_label\">";
	html += "						<label><input type=\"radio\" value=\"1\" name=\"report\" value=\"성희롱\">성희롱</label>                         ";

	html += "						<label><input type=\"radio\" value=\"2\" name=\"report\" value=\"욕설\">욕설</label>                             ";

	html += "						<label><input type=\"radio\" value=\"3\" name=\"report\" value=\"악의적 비방\">악의적</label>                    ";

	html += "						<label><input type=\"radio\" value=\"4\" name=\"report\" value=\"스팸(광고)\">스팸(광고)</label>                 ";

	html += "						<label><input type=\"radio\" value=\"5\" name=\"report\" value=\"기타\">기타</label>                             ";
	html += "				</div>";

	html += "					<textarea rows=\"4\" cols=\"35\" name=\"descript\" id=\"descript\"></textarea>";

	html += "				</tbody>                                                                  			";
	html += "			</table>";
	
		makePopup({
			depth : 1,
			width : 300,
			height : 300,
			bg : true,
			bgClose : false,
			title : "글 신고하기",
			contents : html,
			draggable : false,
			buttons : [{
				name : "신고하기",
				func:function() {
					$("#reportTypeNo").val($('input[name="report"]:checked').val())
					$("#reportNm").val("${data.NM}");
					console.log($("#reportTypeNo").val());
					$("#reportContents").val($("#descript").val());

					if($("#reportTypeNo").val() == "5"){
						if ($.trim($("#descript").val()) == "") {
				             makeAlert("알림", "신고 사유를 입력하세요.", function() {
				                $("#descript").focus();
				             });
						 }
						else{
							action("postReport");
							$("#reportContents").val("");
							closePopup();
						}
					}
					 else{
						action("postReport");
						$("#reportContents").val("");
						closePopup();
						 
					 }
				}
			}, {
				name : "취소"
			}]
		});
}

var msg = {
		"insert" : "등록",
		"update" : "수정",
		"delete" : "삭제",
		"commentReport" : "댓글신고",
		"postReport" : "게시글신고",
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
         url:"freeCAction/" + flag, //경로 주소 새로생기면 컨트롤러 가
         type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
         dataType: "json", //
         data: params, //json 으로 보낼데이터
         success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
         
         switch(res.msg){         
         case "success" :
        	 $("#ccon").val("");
			
            //목록 재조회
            switch(flag) {
            	case "insert" : 
            		$("#cpage").val(1);
            		$(".mainView4").empty();
            		reloadList();
            	case "delete":
            		$("#cpage").val(1);
            		$(".mainView4").empty();
            		reloadList();        
            		break;
            	case "update":
            		$(".mainView4").empty();
            		reloadList();					
					//입력내용 초기화
					$("#cno").val("");		
					$("#ccon").val("");		
					//등록버튼 나타나기 + 수정,취소 버튼 감추기
					$(".insert").show();
					$(".update").hide();
            		break;
					case "commentReport":
            		
            		break;
					case "PostReport":
            		
            		break;
            }            
                        
            break;
         case "fail" :
        	 if(msg[flag] == "댓글신고"){
    			 makeAlert("알림",  "이미 신고한 댓글입니다.");
    		}
        	 else if(msg[flag] == "게시글신고"){
    			 makeAlert("알림",  "이미 신고한 글입니다.");
    		}
        	 else{
	            makeAlert("알림", msg[flag]+"에 실패하였습니다.")
	           
        	 }
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
		url : "commentAjax", //경로
		type : "POST", //전송방식(GET : 주소형태,POST: 주소 헤더)
		dataType : "json",
		data : params,
		success : function(res) { // 성공했을 때 결과를 res에 받고 함수 실행			
			drawList(res.list);		
		},
		error : function(request, status, error) { //실패했을 때 함수 실행
			console.log(request.responseText); //실패 상세내용
		}

	});
};

 function drawList(list) {
//만약 다섯개 미만이면 버튼을 삭제하고	
	if(list.length<5){
		$("#moreBtn").hide();		
	}else{
		$("#moreBtn").show();
		console.log("안나와");
	}
	console.log(list);
	
	var html = ""; //변수선언
	
	for(var data of list){ // " +  + " 1(내용) 대신 넣자
        
		html += " <div class=\"comBox\" commentNo= \"" + data.COMMENT_NO + "\" reportNm= \"" + data.CNM + "\"> ";
		if("${sMemNo}" != data.CMEMBER_NO){//작성자이면
			html += " <div class=\"singo\">";
			
			html += " 	<img src=\"resources/images/detailViewIcon.png\" />";
			html += "			<div class=\"singo_contents\">                                                         ";
			html += "				<label><input type=\"radio\" value=\"1\" name=\"report\" value=\"성희롱\">성희롱</label>                         ";
			html += "				<label><input type=\"radio\" value=\"2\" name=\"report\" value=\"욕설\">욕설</label>                             ";
			html += "				<label><input type=\"radio\" value=\"3\" name=\"report\" value=\"악의적 비방\">악의적</label>                    ";
			html += "				<label><input type=\"radio\" value=\"4\" name=\"report\" value=\"스팸(광고)\">스팸(광고)</label>                 ";
			html += "				<label><input type=\"radio\" value=\"5\" name=\"report\" value=\"기타\">기타</label>                             ";
			html += "				<input type=\"button\" value=\"신고\" id=\"reportBtn\">                                               ";
			html += "			</div>                                                                               ";
		}
		html += " </div>";
		html += " <div class=\"idBox\">";
		html += " 	 <img src=\"resources/upload/" + data.P_IMG + "\" class=\"pimg\"/>  " + data.CNM + "";
	    html += " </div>";
	    html += " <div class=\"commentDe\">" + data.CCONTENTS + "</div>";
  	    html += " <span class=\"date\">" + data.CREG_DT + "</span>";
 		
 		if("${sMemNo}" == data.CMEMBER_NO){//작성자이면
 			html += "<span class=\"upB\"commentNo= \"" + data.COMMENT_NO + "\">수정</span> ";
 			html += "<span class=\"delB\" commentNo= \"" + data.COMMENT_NO + "\">삭제</span>";
 		}
 			html += " </div>";		
	}//여기까지 for
	$(".mainView4").html(html);
	
		
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
			<input type="hidden" name="page" id="page" value= "${param.page}" />
			<input type="hidden" name="cnt" id="cnt" value= "${param.cnt}" />
			
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
				<div class="ti_ttt">
					<div class="tit_writer">
						<c:if test="${!empty data.M_IMG}">			
								<img src="resources/upload/${data.M_IMG}" />
						</c:if>
						<c:if test="${empty data.M_IMG}">			
								<img src="resources/upload/profile_img"/>
						</c:if>
						 ${data.NM}
				 	</div>
			 	</div>
			 </div>
			<span>&nbsp;&nbsp;</span>
			<div class="tit_date">작성일 ${data.DT}</div>
		</div>
		
		<!-- midBox완 ------------------------------------------>		
		<hr/>		
		<div class="conBox">
			<div class="emptyBox"></div>
			<div class= "imgg">
				<c:if test="${!empty data.B_IMG}">			
					<img src="resources/upload/${data.B_IMG}" /><br/>
				</c:if>
				<div class="te"> ${data.CONTENTS}</div>
			</div>
		
		<!-- conBox완 ------------------------------------------>
	<div class="emptyBox">
			<c:if test="${!empty data.B_IMG}">
			<!-- fn:length(대상) : 대상 문자열의 길이나 배열, 리스트의 크기를 가져온다. -->
			<c:set var="fileLength" value="${fn:length(data.B_IMG)}"></c:set>
			<!-- fn:substring(값,숫자1,숫자2) : 값을 숫자1이상 부터 숫자2미만까지 인덱스 기준으로 자른다 -->
			<c:set var="fileName" value="${fn:substring(data.B_IMG, 20, fileLength)}"></c:set>
			<span class="material-symbols-outlined" style="margin-right: 10px;">file_present</span> 
			<a class="aL" href = "resources/upload/${data.B_IMG}" download="${fileName}">${fileName}</a>
			</c:if>
		</div>
		<!-- emptyBox완 ------------------------------------------>
		
		
				
		<div class="reportBox">
			<c:if test="${sMemNo != data.MEMBER_NO}" >
				<div class="reporBtn" id="reporBtn">
					<span class="report">
						<img src="resources/images/report1.png" />
					</span>
					<span class="reporTit">신고하기</span>			
				</div>			
			</c:if>
			</div>
			<div class="box2">
			<input type="button" class="btn" id="clistBtn" value="목록"/> <!-- onClick="history.go(-1) -->
			<c:if test="${sMemNo eq data.MEMBER_NO}" >			
				<input type="button" class="btn" id="updateBtn" value="수정"/>
				<input type="button" class="btn" id="deleteBtn" value="삭제"/>		
			</c:if>
		</div>
		<div class="emptyBox"></div>
		
	
		
		<!-- 댓글 -->	
			
		<hr/>
		<div class= mainview3>
			<form action="#" id="commentsForm" method="post">
		
				<input type="hidden" name="sMemNo" id="sMemNo" value="${sMemNo}"/>
				<input type="hidden" name="commentNo" id="commentNo" value="${data.COMMENT_NO}">
				<input type="hidden" name="cmemberNo" id="cmemberNo" value="${sMemNo}">
				<input type="hidden" name="no" id="no" value="${param.no}">	
				<input type="hidden" name="memberNo" value="${data.MEMBER_NO}">
				<input type="hidden" name="reportTypeNo" id="reportTypeNo">
				<input type="hidden" name="reportContents" id="reportContents">
				<input type="hidden" name="reportNm" id="reportNm">
				<input type="hidden" name="cpage" id="cpage" value="1" />								
									
				
				<div class="box3">
					<div class="comment">comment</div>
					<c:choose>
						<c:when test="${empty sMemNo}"><!-- 비로그인시 -->	
							<div class="commentBox">
								<span class=commentBoxT>로그인이 필요한 서비스 입니다.</span>
							</div>
							<input type="button" class="regBtn" id="loginBtn" value="로그인" />
						</c:when>
						<c:otherwise><!-- 로그인시 -->	
							<div class="commentBox">
								<textarea rows="19" cols="100" class=commentBoxT id="ccon" name="ccon" placeholder="댓글을 입력하세요" ></textarea>
							</div>				   
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
			</form><!-- commentsForm -->
			</div>
		</div>
		<div class="coll"></div>
		<div class="mainview4">					
			<!-- 위로올림 -->
		
		</div>
		
		<div class="more">
			<input type="button" class="moreBtn" id="moreBtn" name="moreBtn" value="더보기+"/>							 
		</div>
	</div> <!--mainwrap  -->
</div><!-- contain-main  -->
		

	<!-- footer -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>