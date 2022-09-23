<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 수정</title>
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
	
	$("#updBtn").on("click", function() {
		location.href = "";
	});
	
	$("#canBtn").on("click", function() {
		location.href = "adEvt";
	});
});
</script>
</head>
<body>
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
	<div id="hd2_content">
		<div id="hd2_Cname">
			<div id="Cname_box">
				<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_calendar</span>
				이벤트 수정
			</div>	
		</div>
		<div id="hd2_CC">
			<div>
				<div id="Ctitle">
					<div class="CTN">제목</div>
					<div class="CTC">
						<input type="text" class="commentBoxT">
					</div>
				</div>
				<div id="Ctitle">
					<div class="CTN">시작일</div>
					<div class="CTC">
						<input type="date" class="commentBoxT" />
					</div>
				</div>
				<div id="Ctitle">
					<div class="CTN">종료일</div>
					<div class="CTC">
						<input type="date" class="commentBoxT" />
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
				<input type="button" value="수정" class="myButton" id="updBtn" /> 
			</div>
		</div>
	</div>
</body>
</html>