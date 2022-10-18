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
<!-- Header (공용으로 사용하는 헤더 쪽 부분) -->
	<c:import url="/header"></c:import>
	
	<!-- Container -->
	<div class="container-mypage">
	    <!-- mypage 상단 메뉴 바(누르면 이동 되고, 누른 메뉴 바가 색이 바뀌는 기능) -->
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		
		<!-- Contents -->
		<div class="contents">
			<div class="mypage_contents">
				<div class="area_tit">
					<span>내 정보</span>
				</div>
				<div class="mem_box">
					<div class="mem_profile">
					    <!-- 컨트롤러에서 data 값으로
                        resources/upload에 있는 이미지 파일을 불러옴.(밑에도 같은 방식) -->
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
						    <!-- 사용하려면 꼭 헤더에 코어 태그 추가 switch문과 비슷.c:태그에는 주석 제대로 달아야 안 터짐.<%--이렇게 달면 됨--%> -->
							<c:choose>
							<c:when test="${data.GENDER == 0}"><%-- switch문 case에 해당. data.GENDER0이라면 남성 --%>
								<dd>남성</dd>
							</c:when>
							<c:otherwise><%-- switch문 default에 해당. 아니라면 여성 --%>
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