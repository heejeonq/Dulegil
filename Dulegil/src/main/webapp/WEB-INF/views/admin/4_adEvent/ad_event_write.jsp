<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 작성</title>
<style type="text/css">

#Cname {
	width: 100%;
	margin: 10px 0px;
	text-align: left;
	padding: 15px 0;
}

#Ctitle {
	width: 100%;
	height: 32px;
	text-align: left;
}

#Ccontents {
	width: 100%;
	height: 10%;
}

#ct {
	margin-top: 20px;
}

#buttons {
	height: 10%;
	text-align: right;
}

.CTN {
	width: 8%;
    /* text-align: right; */
    display: inline-block;
    font-size: 12px;
    padding: 4px;
    line-height: revert;
}

.CTC {
	width: 39%;
    height: 60%;
    display: inline-block;
    text-align: left;
    vertical-align: middle;
    border-bottom: 1px solid #ddd;
    position: relative;
}

.commentBox {
	display: inline-block;
	vertical-align: top;
	width: 708px;
	height: 36px;
	border: 1px solid #ddd;
}

.commentBoxT {
	border: none;
	width:100%;
	height: 86%;
	position: absolute;
	font-family: 'Gothic A1';
    font-weight: 500;
}

.checkbox {
	width: 50%;
	height: 60%;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	position: relative;
}

.textarea {
	border: 1px solid #ddd;
	outline: none;
}

input:focus {
	outline: none;
}
</style>
</head>
<body>
	<!--  header 1  -->
	<jsp:include page="../adHeader.jsp" flush="true"/>
	
		<div id="hd2_content">
			<div id="hd2_Cname"></div>

			<div id="hd2_CC">
				<div id="CCbox">
					<div id="Cname">
						<span class="material-symbols-outlined" style="font-size: 30px; font-weight: 600; color: #444; vertical-align: sub;"> edit_square </span>이벤트
						추가
					</div>
					<div id="Ctitle">
						<div class="CTN">제목</div>
						<div class="CTC">

							<input type="text" class="commentBoxT">
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN">날짜</div>
						<div class="CTC">
							<input type="date" class="commentBoxT" />
						</div>
					</div>
					<div id="Ctitle">
						<div class="CTN"> ~ </div>
						<div class="CTC">
							<input type="date" class="commentBoxT" />
						</div>
					</div>
					<textarea rows="30" cols="60" id="ct" name="ct" class="textarea"></textarea>
					<div id="buttons">
						<input type="button" value="추가" class="myButton" /> <input
							type="button" value="목록" class="myButton" />
					</div>

				</div>
			</div>
		</div>
</body>
</html>