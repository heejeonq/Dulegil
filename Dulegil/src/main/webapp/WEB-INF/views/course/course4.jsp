<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 안내</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/course.css" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
	$("ul.infoBtn li").click(function(){
		var tab_id = $(this).attr("data-tab");

		$("ul.infoBtn li").removeClass("on");
		$(".infoArd").removeClass("on");

		$(this).addClass("on");
		$("#"+tab_id).addClass("on");
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
			<div class="tit">코스 별 상세 안내</div>
			<div class="col"></div>
			
			<ul class="crsBtn">
				<li onclick="document.location.href='course1'">1코스</li>
				<li onclick="document.location.href='course2'">2코스</li>
				<li onclick="document.location.href='course3'">3코스</li>
				<li class="on">4코스</li>
				<li onclick="document.location.href='course5'">5코스</li>
				<li onclick="document.location.href='course6'">6코스</li>
				<li onclick="document.location.href='course7'">7코스</li>
				<li onclick="document.location.href='course8'">8코스</li>
			</ul>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>4코스 - 대모·우면산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 강남구, 서초구 &nbsp;&nbsp;
					<span>총길이</span> : 18.3㎞ &nbsp;&nbsp;
					<span>소요시간</span> : 8시간 10분 &nbsp;&nbsp;
					<span>난이도</span> : 중급
				</div>	
			</div>
			
			<div class="crsMap">지도</div>
			
			<div class="crsMapDtl">
				<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="crsDtl">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 3호선, 분당선 수서역 6번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로</dt>
						<dd>지하철 신분당선 양재시민의숲역 5번 출입구</dd>
					</dl>

					<dl>				
						<dt>도착지</dt>
						<dd>지하철 2호선, 4호선 사당역 4번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">서울 둘레길의 4코스로 수서역에서 출발하여 대모산, 구룡산, 우면산을 거쳐 사당역에 도착하는 코스이다. 
							    본 코스는 대부분 산행코스지만 높지 않은 고도로 수월한 트레킹이 가능하며 산림자연자원이 풍부하고 서울시 조망이 매우 좋다. 
							    또한 구룡산과 우면산 사이의 여의천, 양재시민의 숲, 양재천을 경유하는 길은 주변 경관이 좋으며, 평탄하고 아늑한 산책로로 간편한 트레킹이 가능하다. 
							    출발지인 수서역과 도착지인 사당역은 대중교통의 접근성이 아주 편리하다.</span>
					<br />
					<table>
						<thead>
							<tr>
								<th colspan = "2">코스명</th>
								<th>거리</th>
								<th>소요시간</th>
								<th>코스설명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan = "5">4코스 대모·우면산코스</td>
							</tr>
							<tr>
								<td>4-1</td>
								<td>10.7㎞</td>
								<td>4시간 50분</td>
								<td>수서역 ~ 양재시민의숲(양재시민의숲역)</td>
							</tr>
							<tr>
								<td>4-2</td>
								<td>7.6㎞</td>
								<td>3시간20분</td>
								<td>양재시민의숲(양재시민의숲역) ~ 사당역 갈림길</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">수서역~대모산~구룡산~여의천~양재천~우면산~사당역</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5083586431333736.jpg" alt="대모산 초입" width="375px;" height="280px">
							<p>대모산 초입</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491521813631993000.jpg" alt="양재시민의숲 안내소 옆" width="375px;" height="280px">
							<p>양재시민의숲 안내소 옆</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491522049337045000.png" alt="우면산 끝부분" width="375px;" height="280px">
							<p>우면산 끝부분</p>
						</div>
					</div>
				</div>

				<img src="resources/images/mark.png">
				<span>안내지도 및 스탬프북 배부처</span>
				<div class="crsDtl">
					<table>
						<thead>
							<tr>
								<th>배부처</th>
								<th>연락처</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>서울둘레길 안내센터(창포원)</td>
								<td>779-7901∼4</td>
							</tr>
							<tr>
								<td>서울시청 1층 열린민원실</td>
								<td>2133-7904∼5</td>
							</tr>
							<tr>
								<td>서울둘레길 안내센터(양재)</td>
								<td>070-4465-7905</td>
							</tr>
							<tr>
								<td>아차산관리사무소</td>
								<td>450-1655</td>
							</tr>
							<tr>
								<td>관악산관리사무소</td>
								<td>879-6561</td>
							</tr>
						</tbody>	
					</table>
					<span>※ 유의사항<br />
					- 안내지도, 스탬프북 물량이 없을 수 있으니 문의전화 후 방문하세요.<br />
					- 스탬프 투어시 인주(스탬프 찍는 인주)를 함께 가지고 다니면 좋습니다.
					(스탬프가 야외에 설치되는 관계로 기후 등에 따라 인주가 마르는 경우가 있을 수 있습니다.)
					</span>
				</div>
				
				<div class="crsDtl">
					<ul class="infoBtn">
					    <li class="infoArdTit on" data-tab="tab_1">주변 관광지 안내</li>
					    <li class="infoArdTit" data-tab="tab_2">주변 축제 안내</li>
					    <li class="infoArdTit" data-tab="tab_3">주변 숙박 안내</li>
					    <li class="infoArdTit" data-tab="tab_4">주변 식당 안내</li>
					</ul>
					
					<div class="infoArdCon">
						<div class="infoArd on" id="tab_1">
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374281778942000.jpg" alt="매헌윤봉길의사기념관" width="275px;" height="188px;">
								<p id="infoArdTit">매헌윤봉길의사기념관</p>
								<p>서울시 서초구 양재동 시민의 숲에 있는 매헌(梅軒) 윤봉길(1908~1932)의 유물과 독립운동 관련자료를 전시해 놓은 박물관이다. 
								      윤봉길의사의 업적과 살신성인(殺身成仁) 정신의 높은 뜻을 기리고, 계승 발전시키며, 선양하기 위하여 매헌 윤봉길의사 기념사업회가 주관하여 
								      국민들의 성금으로 서울 양재 시민의숲 안에 매헌 윤봉길의사 기념관을 설립하게 되었다. 1988년 12월 1일에 준공된 매헌 윤봉길의사 기념관은 대지 1,996평에 건평 743평, 
								      지하 1층 지상 3층으로서 윤의사의 유품과 생애사진, 훈장 그리고 항일독립운동 관련사진 등이 전시되고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/9397510540265.jpg" alt="양재시민의숲" width="275px;" height="188px;">
								<p id="infoArdTit">양재시민의숲</p>
								<p>서초구 양재동에 위치한 공원으로 숲이 좋아 연인들의 만남의 장소로 이용된다. 현재 도심에서는 매우 보기 드문 울창한 수림대를 형성하고 있고 특히 가을에는 감, 
								      모과 등 과일이 열려 풍성한 자연을 만끽할 수 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/09/03/14918169955368.jpg" alt="서울특별시 인재개발원" width="275px;" height="188px;">
								<p id="infoArdTit">서울특별시 인재개발원</p>
								<p>1962년 1월 1일 서울특별시 공무원교육원(1부 2과)으로 출범했으며, 1979년 8월 31일 현재의 장소로 청사를 신축ㆍ이전했다. 
								      서울시 공무원들을 경쟁력 있는 핵심인재로 양성하기 위해 다양한 맞춤형 교육프로그램을 제공한다. 
								      이론교육 외에 현장실습과 체험학습, 참여와 토론, 문제해결능력 향상, 나눔과 봉사 등 다양한 프로그램을 운용하고 있다. 
								      또한 서울시 공무원시험의 출제와 관리, 면접과 선발, 합격생들에 대한 교육훈련을 직접 주관한다. 
								      공무원 채용 및 자격시험 안내(응시자격 시험과목 등), 시험공고, 합격자 안내(경쟁률 및 합격선), 인터넷 시험 접수 등을 관할하며, 
								      해외 공무원들의 위탁 교육 등 국제연수원으로서의 기능도 수행하고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/14891218394277.jpg" alt="우면산 자연생태공원" width="275px;" height="188px;">
								<p id="infoArdTit">우면산 자연생태공원</p>
								<p>도심 속에서 자연학습이 가능하고 생태보전의 중요성을 알리는 공간을 마련하기 위하여 2000년 4월 우면산 자연생태공원 추진계획을 수립한 뒤 같은 해 11월 25일 착공하여 
								   2003년 12월 20일 준공하였으며, 2004년 7월 23일 개원하였다. 총 면적은 31만 8644㎡이다. 주요 시설은 숲생태계 관찰림과 습지생태계 관찰원, 
								      나비 관찰원, 야생조류 관찰원, 수서동물 관찰원, 도시림 및 곤충 관찰원, 풀꽃 관찰원, 참나무류 층위구조 관찰원, 양지성 식물 관찰원, 참나무 문화 관찰원, 
								      식이식물 관찰원, 염료식물 관찰원, 계곡경관, 관찰소, 경관 관찰소 등의 관찰원과 자연해설판 14개, 1320m의 자연탐방로, 명상의 숲, 야외강의장, 목교, 
								   2000㎡의 저수지 등으로 이루어져 있다.</p>	
							</div>
						</div>
					
						<div class="infoArd" id="tab_2">
						  	<div class="infoDtl">
								<p>탭 메뉴 2 내용입니다.</p>
						  	</div>
						</div>
							
						<div class="infoArd" id="tab_3" >
							<div class="infoDtl">
								<p> 탭 메뉴 3 내용입니다.</p>
							</div>
						</div>
							
						<div class="infoArd" id="tab_4">
							<div class="infoDtl">
							<p>  탭 메뉴 4 내용입니다.</p>
							</div>
						</div>			
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>		

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>