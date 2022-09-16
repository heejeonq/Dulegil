<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체일정상세</title>
<link rel="stylesheet" href="resources/css/calendar.css" />
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function(){
		location.href='event';
	});
});
</script>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>
  
	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">둘레길 전체 일정</div>
			<div class="col"></div>
		
			<table class="evt">
				<colgroup>
					<col style="width:840px;">
					<col style="width:150px;">
					<col style="width:130px;">
					<col style="width:80px;">
				</colgroup>
				<thead class="evtTit">
					<tr>
						<th id="evtMainTit" colspan="4">2022년 서울둘레길 걷기 후기 이벤트 안내</th>
					</tr>
					<tr id="dh">
						<td></td>	
						<td>작성자:둘레길 관리자</td>
						<td>등록일:2022.08.30</td>
						<td>조회수:123</td>
					</tr>
				</thead>
				
				<tbody class="evtCon">
					<tr>
						<td>
							서울둘레길에서 "2022년 서울둘레길 걷기 후기" 이벤트를 진행합니다.<br/>
							나만의 서울둘레길 추억을 만들어 모두에게 공유해주세요.<br/>
							소중한 추억에 감사하며 소정의 상품을 증정합니다.<br/>
							많은 관심과 참여 부탁드립니다.<br/>
							<br/>
							안내<br/>
							기간: 6월 2일 ~ 11월 30일<br/>
							대상: 서울둘레길을 사랑하는 누구나<br/>
							장소: 서울둘레길 8코스 전 구간<br/>
							주관: 한국등산트게킹지원센터, 서울둘레길 안내센터<br/>
							<br/>
							참여 방법<br/>
							서울둘레길 8코스 중 희망 코스 선택하여 걷기<br/>
							서울둘레길 후기 올리기(후기 인증 방법 택 1)<br/>
							- SNS, 블로그, 유튜브, 서울둘레길 홈페이지<체험후기>등 후기 업로드<br/>
							- 해시태그: #서울둘레길 #서울시 #한국등산트레킹지원센터 등<br/>
							<br/>
							혜택<br/>
							커피(스타벅스) 기프티콘 발송 (300명 선착순)<br/>
						    <br/>
						    유의사항<br/>
							본 서울둘레길 걷기 후기 이벤트는 비대면 후기 인증 이벤트로써, 
							안전 여행수칙 및 생활 방역을 준수하여야 하며 일정 및 안전은 
							개인 책임하에 진행해야 합니다.
							<br/>
							SNS 포스팅 된 콘텐츠는 한국등산드레킹지원센터에서 향후 홍보물 및 자료 등으로 
							일반에 공개·활용될 수 있습니다.
							<br/>
							사진, 영상 등 배포하는 자료의 초상권, 지적 재산권 등은 법적인 문제가 전혀 없는 것이어야 합니다.
							<br/>
							후기 인증에 서울둘레길 관련 게시물인지 확인이 불가할 경우(서울둘레길 관련 이정표가 없는 경우or 
							다른 숲길에서 인증을 한 경우 등등) 기프티콘 지급대상에서 제외됩니다.<br/>
							<br/>
							• 후기인증 예시: (https://www.instagram.com/komount_seoui_trail/)<br/>
							• 서울둘레길 인스타그램 링크: (https://www.instagram.com/komount_seoui_trail/)<br/>
							• 걷기 후기 이벤트 참가 신청 구글폼 URL : (https://forms.gle/Fcqbg1eZoPAQqUVP6)<br/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="col"></div>
			
			<div class="btn">
				<input type="button" id="listBtn" value="목록">
			</div>
		</div>		
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
	
</body>
</html>