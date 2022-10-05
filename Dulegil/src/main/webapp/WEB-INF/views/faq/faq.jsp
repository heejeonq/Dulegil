<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/faq.css">
<title>FAQ</title>
<style type="text/css">
#goNtc:hover{
	text-decoration: underline;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	$(".faqAns").css("display", "none");
});

function faqQst(num){
	$(".faqAns").css("display", "none");
	$("#faqAns"+num).css("display", "block");
}
</script>
</head>
<body>
	
	<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">FAQ</div>
			<p>FAQ를 통해서 원하는 답변을 쉽고 빠르게 찾아보세요.</p>
			<div class="col"></div>
			<div class="faq">
				<ul class="faqQst" onClick="faqQst('1');">
					<li class="qstTit" id="faqQst1">Q</li>
					<li class="qstCon" id="faqQst1">서울 둘레길이란 무엇인가요?</li>
				</ul>
				<ul class="faqAns" id="faqAns1">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							서울을 한 바퀴 휘감는 8개 코스로 서울의 역사, 문화, 자연생태 등을 스토리로 엮어 국내외 탐방객들이 느끼고, 배우고, 체험할 수 있도록 조성한 도보길입니다.
							<br/>
							서울둘레길은 ‘숲길’, ‘하천길’, ‘마을길’로 구성되어 있습니다.
							<br/>
							둘레길 곳곳에 휴게시설과 북카페, 쉼터를 만들어 시민들이 자연스럽게 휴식을 취할 수 있게 했고, 
							<br/>
							전통 깊은 사찰과 유적지을 연결해 서울의 역사와 문화, 자연생태를 곳곳에서 체험할 수 있도록 조성하였습니다.
							<br/>
							대중교통으로도 접근하기 쉬우며 주로 경사가 심하지 않은 흙길로 되어 있어 누구나 안전하고 편안하게 이용할 수 있습니다. 
						</div>
					</li>
				</ul>	
				<ul class="faqQst" onClick="faqQst('2');">
					<li class="qstTit">Q</li>
					<li class="qstCon">서울 둘레길은 어떤 테마로 구성되어 있나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns2">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon">  
							서울 둘레길의 테마는 사람을 위한 길, 자연을 위한 길, 산책하는 길, 이야기가 있는 길 총 4가지입니다. <br/>
							<br/>
							사람을 위한 길<br/>
							- 경사가 심하지 않은 길<br/>
							- 안전하고 편안하고 쾌적한 길(노면정비, 안전난간 등)<br/>
							- 건강과 휴양을 도모하는 길(양호한 숲, 산림욕장 등 경유)<br/>
							- 주택가로부터 200m 이상 떨어진 길(주변주민 생활불편 예방)<br/>
							<br/>
							자연을 위한 길(숲으로 숲을 치유)<br/>
							- 가능한 기존 등산로만 연결하여 흙길로 조성<br/>
							- 사용하지 않는 샛길은 적극적인 폐쇄, 훼손된 등산로 복원<br/>
							- 수목 식재 필요할 경우 해당지역 자생 산림수종 선정<br/>
							- 콘크리트·철제·방부목재·로프 사용 지양, 현장소재 활용(쓰러진 아까시나무 활용)<br/>
							<br/>
							산책하는 길<br/>
							- 가능한 수평, 옆으로 걷는 자락길, 산책길<br/>
							- 불필요한 계단설치 최대한 배제<br/>
							- 만나고, 산책하고, 소통하고, 휴식하는 길(숲속 북카페, 숲이 좋은 곳에 휴게시설, 전망 좋은 곳에 쉼터)<br/>
							<br/>
							이야기가 있는 길<br/>
							- 자연과 역사와 문화를 배우고 느낄 수 있는 길(전통 깊은 사찰, 유적지, 문화유산, 역사유물 등 경유)<br/>
							- 둘레길에 숨겨져 있는 전설, 이야기 등 발굴
						</div>
					</li>
				</ul>
				<ul class="faqQst" onClick="faqQst('3');">
					<li class="qstTit">Q</li>
					<li class="qstCon">서울 둘레길이란 걸 어떻게 확인하나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns3">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							서울 둘레길은 기존에 있던 길을 활용한 걷기 길로 방문객분들의 안전과 혼선방지를 위해 다양한 안내표시를 설치했습니다. <br/>
							각각의 안내표시는 [둘레길 도우미] - [공지사항] 에서 관련 게시글을 참고해주세요. <br/>
							<br/>
							<a id="goNtc" style="font-weight: 500; color: #444;" onClick="document.location.href='notice'">►공지사항 바로가기</a>
						</div>
					</li>
				</ul>	
				<ul class="faqQst" onClick="faqQst('4');">
					<li class="qstTit">Q</li>
					<li class="qstCon">서울 둘레길을 걸을 때 지켜야 할 안전 수칙은 무엇이 있나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns4">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							서울 둘레길을 처음 걸으신다면 꼭 지켜야 할 안전 수칙을 안내 드립니다.<br/>
							<br/>
							- 걷기 종료시간은 하절기 오후 6시, 동절기 오후 5시. 이 시간 이후 걷기 자제하기<br/>
							- 태풍,호우,폭설 시에는 걷기 자제하기<br/>
							- 혼자 걸을 때에는 수시로 현재위치와 안전여부를 가족이나 지인에게 알려주기<br/>
							- 코스를 벗어난 가파른 계곡이나 절벽으로 가는 모험은 절대 피하기<br/>
							- 거리표지에 있는 지나온 거리 및 주변 위치정보(건물명 등)를 숙지하며 걷기<br/>
							- 길에서 만나는 개, 고양이, 벌집 등에게 다가가는 등 자극하는 행위를 삼가하기.<br/>				
						</div>
					</li>
				</ul>
				<ul class="faqQst" onClick="faqQst('5');">
					<li class="qstTit">Q</li>
					<li class="qstCon">서울 둘레길에서 동물을 만나면 어떻게 해야 하나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns5">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							우선 묶여있지 않은 개를 만났을 때는 아래와 같이 행동하셔서 조심히 현장에서 벗어나시기 바랍니다.<br/>
							<br/>
							- 자극하지 말 것<br/>
							- 뒤로 너무 빨리 움직이지 말 것<br/>
							- 개와 눈을 마주치지 말 것<br/>
							- 공격을 당하면 웅크려서 목과 얼굴을 보호할 것<br/>  
							<br/>
							고양이의 경우, 위협적인 행동을 삼가고 멀찍이 지나가시기 바랍니다.<br/>
							<br/>
							뱀은, 진동을 느낄 시 도망간다고 합니다. <br/>
							수풀을 지날 때는 발이나 지팡이로 땅을 수시로 울려서 뱀에게 도망갈 기회를 주는 게 좋습니다.
						</div>
					</li>
				</ul>
				<ul class="faqQst" onClick="faqQst('6');">
					<li class="qstTit">Q</li>
					<li class="qstCon">서울 둘레길 지도는 어디서 구할 수 있나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns6">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							공지사항 페이지에서 인쇄가 가능한 전체지도와 각 코스의 세부지도를 무료로 다운로드 받으실 수 있습니다.<br/>
							코스와 관련되어 지도와 함께 보다 상세한 설명이 필요하다면 가이드북을 다운받으시는 것을 권장 드립니다.<br/>
							<br/>
							<a id="goNtc" style="font-weight: 500; color: #444;" onClick="document.location.href='notice'">►공지사항 바로가기</a>
						</div>
					</li>
				</ul>	
				<ul class="faqQst" onClick="faqQst('7');">
					<li class="qstTit" id="faqQst1">Q</li>
					<li class="qstCon">혼자 걷기 걱정되는 사람에게는 어떤 코스가 좋을까요?</li>
				</ul>
				<ul class="faqAns" id="faqAns7">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							5코스와 6코스를 추천합니다. <br/>
							다른 코스와 비교해서 길지 않은 거리로 오소록한 숲길이 포함되어 있습니다.
						</div>
					</li>
				</ul>	
				<ul class="faqQst" onClick="faqQst('8');">
					<li class="qstTit">Q</li>
					<li class="qstCon">
						각 코스의 시작점과 종점까지는 어떻게 이동해야 하나요?
					</li>
				</ul>
				<ul class="faqAns" id="faqAns8">
					<li class="faqDtl">
						<span id="ansTit">A</span>
						<div class="ansCon"> 
							각 코스의 시작점과 종점으로 향하는 대중교통 정보는 둘레길 홈페이지의 코스 별 주변 정보 안내 페이지에서 확인하실 수 있습니다.<br/>
							<br/>
							또한 코스의 시작/도착점에는 주차장이 따로 마련되어 있지 않다는 점 참고 바라며, <br/>
							제주올레 길을 걸을 때만큼은 자연을 사랑하는 마음가짐으로 가급적 대중교통을 이용하시는 것을 권장 드립니다.<br/>
							카카오맵/네이버 맵 등 모바일 어플리케이션을 활용하여 목적지를 입력하면 실시간으로 대중교통 정보를 확인할 수 있습니다.
						</div>
					</li>
				</ul>	
				<ul class="faqQst" onClick="faqQst('9');">
					<li class="qstTit">Q</li>
					<li class="qstCon">완주증명서는 어떻게 해야 받을 수 있나요?</li>
				</ul>
				<ul class="faqAns" id="faqAns9">
						<li class="faqDtl">
							<span id="ansTit">A</span>
							<div class="ansCon"> 
							서울 둘레길의 8개 코스를 돌면서 28개의 완주인증 스탬프를 모두 받아오시면 완주 증명서를 발급 해 드립니다.<br/>
							<br/>
							발급 장소 및 시간<br/>
							1. 서울둘레길 안내센터 (창포원)<br/>
							주소 : 서울시 도봉구 마들로 916 (도봉동 4-2) 1층 서울둘레길 안내센터<br/>
							찾아오시는 길 : 지하철 7호선 도봉산역 2번 출구 30m (창포원 공원 내)<br/>
							발급가능시간 : 화,수,목,금,토,일 *주말가능* 9시~18시<br/>
							(점심시간 11시 30분 ~ 13시 ,월요일 정기휴무 및 법정공휴일 휴무)<br/>
							안내문의 ☞ 02-779-7902~4<br/>
							<br/>
							2. 서울둘레길 안내센터 (양재)<br/>
							주소 : 서울시 서초구 매헌로99 양재시민의숲 서울둘레길안내센터<br/>
							찾아오시는 길 : 지하철 신분당선 양재시민의숲역 5번출구<br/>
							발급가능시간 : 화,수,목,금,토 *9시 ~ 18시<br/>
							(점심시간 11시30분 ~ 13시, 일·월요일 정기휴무 및 법정공휴일 휴무)<br/>
							안내문의 ☞ 070-4465-7905<br/>
							</div>
						</li>
					</ul>
			</div>	
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>