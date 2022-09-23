<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 등록</title>
<style type="text/css">
body input{
	font-family: "Gothic A1";
	font-weight: 600;
}

#hd2_CC{
	padding: 20px 45px 0;
}

#Ctitle {
	width: 100%;
	text-align: left;
	margin-bottom: 10px;
}

#Ccontents {
	width: 100%;
	height: 10%;
}

#buttons {
	text-align: center;
	margin-right: 125px;
    margin-top: 10px;
}

.CTN {
	width: 8%;
    display: inline-block;
    font-size: 11pt;
    padding: 4px;
    line-height: revert;
}

.CTC {
    display: inline-block;
    text-align: left;
    vertical-align: top;
    position: relative;
}

.CTC input[type='text']{
	width: 700px;
    height: 28px;
	border: 1px solid #ddd;
}

.CTC input[type='date']{
	width: 150px;
	height: 28px
}

.commentBox {
	display: inline-block;
	vertical-align: top;
	width: 708px;
	height: 36px;
	border: 1px solid #ddd;
}

.checkbox {
	width: 50%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	position: relative;
}

input:focus {
	outline: none;
}

.myButton{
	margin-right: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("ct", {
		resize_enabled : false, 
        language : "ko", 
        enterMode : "2", 
        width : "700px", 
        height : 450
	});
	
	$("#canBtn").on("click", function() {
		location.href = "adEvt";
	});
	
	$("#regBtn").on("click", function() {
		$("#ct").val(CKEDITOR.instances['ct'].getData())
		
		if($.trim($("#tit").val()) == "") {
			makeAlert("알림", "제목을 입력하세요.", function() {
				$("#tit").focus();
			});

		}else if ($("#startDt").val() == "") {
			makeAlert("알림", "시작일을 입력하세요.", function() {
				$("#startDt").focus();
			});

		}else if ($("#endDt").val() == "") {
			makeAlert("알림", "종료일을 입력하세요.", function() {
				$("#endDt").focus();
			});
			
		}else if ($("#ct").val() == "") {
			makeAlert("알림", "내용을 입력하세요.", function() {
				$("#ct").focus();
			});

		}else {
			var params = $("#actionForm").serialize();  
			
			$.ajax({
				url:"adEvtAction/insert", 
				type: "POST", 
      			dataType: "json",
				data: params,
				success : function(res){ 
				console.log(res);
					switch(res.msg){
					case "success" :
						makeAlert("알림", "등록에 성공하였습니다.") 
					break;
					case "fail" :
  						makeAlert("알림", "등록에 실패하였습니다.")
					break;
  					case "error" :                     
   	                     makeAlert("알림", "등록 중 문제가 발생하였습니다.")
					break;
					}
				},
   	            error : function(request, status, error) { 
   	                     console.log(request,responseText); 
   	            }
			});
		}
	});
});
</script>
</head>
<body>
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<form action="adEvt" id="backForm" method="post">
		<input type="hidden" id="page" name="page" value="${param.page}" />
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" />
	</form>
	
	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_square </span>
				이벤트 등록
			</div>
		</div>
		<div id="hd2_CC">
			<form action="#" id="actionForm" method="post">
				<div>
					<div id="Ctitle">
						<div class="CTN">제목</div>
						<div class="CTC">
							<input type="text" class="commentBoxT" id="tit" name="tit" />
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN">시작일</div>
						<div class="CTC">
							<input type="date" class="commentBoxT" id="startDt" name="startDt" />
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN">종료일</div>
						<div class="CTC">
							<input type="date" class="commentBoxT" id="endDt" name="endDt" />
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN">내용</div>
						<div class="CTC">
							<textarea id="ct" name="ct" class="textarea"></textarea>
						</div>
					</div>
				</div>
				<div id="buttons">
					<input type="button" value="취소" class="myButton" id="canBtn" />
					<input type="button" value="등록" class="myButton" id="regBtn" /> 
				</div>
			</form>
		</div>
	</div>
</body>
</html>