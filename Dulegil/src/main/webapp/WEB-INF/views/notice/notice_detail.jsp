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
<link rel="stylesheet" href="resources/css/noticDetail.css" />

<title>공지사항상세</title>
<!-- 제이쿼리 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#listBtn").on("click",function(list){	
		history.go(-1);
		$("#actionForm").attr();
		$("#actionForm").submit();
		
	}); 
	
	
	
});


</script>
</head>
<body>
	<!-- Header -->
		<c:import url="/header"></c:import>


	<!-- Container -->

<div class="container-main">		
	<div class="mainWrap">
		<div class="tit">공지사항</div>
		<div class="col"></div>		
		<div class="midBox">
			<form action="#" id= "actionForm" method="post">
			<input type="hidden" name="no" value="${data.POST_NO}" />
			<!-- <input type="hidden" name="gbn" value="d" /> 이게뭐지-->
			<input type="hidden" name="page" value= "${param.page}" />
			<input type="hidden" name="cnt" id="cnt" value= "${param.cnt}" />
			<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}"/>
			<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
			</form>
			<div class="emptyBox"></div>
			<div class="tit_tt">${data.TITLE}</div>
			<div class="ti_ttt">
				<div class="tit_writer">서울둘레길 </div>
				<div class="tit_date">작성일 ${data.DT}</div>
				<div class="file">첨부파일</div>			
			</div>
			<hr/>
			<div class="contentBox">
				<div class="emptyBox"></div>
				<div class= "content">
					<div class="te"> ${data.CONTENTS}</div>
				</div>
			</div>
				<div class="emptyBox">
						<c:if test="${!empty data.ATT_FILE}">
							<c:set var="fileLength" value="${fn:length(data.ATT_FILE)}"></c:set>
							<c:set var="fileName" value="${fn:substring(data.ATT_FILE, 20, fileLength)}"></c:set>
							<span class="material-symbols-outlined" style="margin-right: 10px;">file_present</span>
							<a class="aL" href = "resources/upload/${data.ATT_FILE}" download="${fileName}">${fileName}</a>							
						</c:if>
				</div>
				<div class="col"></div>	
				<div class="emptyBox"></div>
				<div class="btnBox">		
					<input type="button" class="btn" id="listBtn" value="목록"/>
				</div>
			
		</div>
	</div>
</div>
		
		





	<!-- footer -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>