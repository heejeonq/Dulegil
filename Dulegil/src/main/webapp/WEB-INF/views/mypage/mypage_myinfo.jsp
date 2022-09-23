<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>내 정보</title>
</head>
<body>
<!-- Header -->
	<c:import url="/header"></c:import>
	
	<!-- Container -->
	<div class="container-mypage">
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		
		<!-- Contents -->
		<div class="contents">
			<!--<input type="hidden" name="memNo" value="${sMemNo}"/>-->
			<div class="mypage_contents">
				<div class="area_tit">
					<span>내 정보</span>
				</div>
				<div class="mem_box">
					<div class="mem_profile">
						<img alt="" src="resources/upload/${data.IMG_FILE}">
					</div>
					<div class="mem_info">
						<dl>
							<div>
								<dt>이름</dt>
								<dd>${data.NM}</dd>
							</div>
							<div>
								<dt>신뢰도</dt>
								<dd>${data.RELIABILITY}</dd>
							</div>
							<div>
								<dt>생년월일</dt>
								<dd>${data.DATE_BIRTH}</dd>
							</div>
							<div>
								<dt>성별</dt>
							<c:choose>
							<c:when test="${data.GENDER == 0}">
								<dd>남성</dd>
							</c:when>
							<c:otherwise>
								<dd>여성</dd>
							</c:otherwise>
							</c:choose>
							</div>
							<div>
								<dt>휴대전화</dt>
								<dd>${data.PHONE_NO}</dd>
							</div>
							<div>
								<dt>E-mail</dt>
								<dd>${data.EMAIL}</dd>
							</div>
							<div>
								<dt>주소</dt>
								<dd>${data.ADDRESS} ${data.DETAIL_ADDRESS}</dd>
							</div>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>