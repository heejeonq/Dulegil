<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 안내</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/course.css" />
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
				<li class="on">3코스</li>
				<li onclick="document.location.href='course4'">4코스</li>
				<li onclick="document.location.href='course5'">5코스</li>
				<li onclick="document.location.href='course6'">6코스</li>
				<li onclick="document.location.href='course7'">7코스</li>
				<li onclick="document.location.href='course8'">8코스</li>
			</ul>
				
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>3코스 - 고덕·일자산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 강동구, 송파구 &nbsp;&nbsp;
					<span>총길이</span> : 25.6㎞ &nbsp;&nbsp;
					<span>소요시간</span> : 8시간50분 &nbsp;&nbsp;
					<span>난이도</span> : 초급
				</div>	
			</div>
				
			<div class="crsMap">지도</div>
			
			<div class="crsMapDtl">
				<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="crsDtl">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 5호선 광나루역 2번 출입구</dd>
					</dl>
					<dl>				
						<dt>진입로</dt>
						<dd>지하철 5호선 고덕역 4번 출입구</dd>
					</dl>
					<dl>				
						<dt>도착지</dt>
						<dd>지하철 3호선, 분당선 수서역 5번 출입구</dd>
					</dl>
				</div>
			</div>
				
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">고덕·일자산코스는 광나루역에서 출발해 한강, 고덕산, 일자산, 성내천, 문정근린공원, 탄천을 경유해 수서역에 도착하는 코스이다. 
				                            본 코스는 강길, 숲길, 하천길이 모두 포함되어 서울시의 자연경관을 보고 느낄 수 있는 최적의 코스이다. 
				                            또한 숲길은 높지 않은 고도로 수월한 산행이 가능하며, 주변의 역사문화관광지가 다양하게 분포하고 있어 볼거리 또한 풍부하다. 
				                            코스가 긴 편으로 소요시간이 다소 걸리지만 비교적 평탄한 지형으로 트레킹을 하기에 무리가 없다.</span>
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
								<td rowspan = "5">3코스 고덕·일자산</td>
							</tr>
							<tr>
								<td>3-1</td>
								<td>9.3㎞</td>
								<td>3시간</td>
								<td>광나루역 ~ 명일근린공원입구(고덕역)</td>
							</tr>
							<tr>
								<td>3-2</td>
								<td>7.7㎞</td>
								<td>3시간15분</td>
								<td>명일근린공원입구(고덕역) ~ 오금1교(올림픽역)</td>
							</tr>
							<tr>
								<td>3-3</td>
								<td>8.6㎞</td>
								<td>2시간35분</td>
								<td>오금1교(올림픽역) ~ 수서역</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">광나루역~고덕산~일자산~성내천~탄천~수서역</td>
							</tr>
						</tbody>
					</table>	
				</div>
					
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/20/5037185396514522.JPG" alt="광진교 초입" width="375px;" height="280px">
							<p>광진교 초입</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/20/5037223693205185.jpg" alt="일자산 초입(고덕역 4번 출구 260m 앞)" width="375px;" height="280px">
							<p>일자산 초입(고덕역 4번 출구 260m 앞)</p>
						</div>
						<div class="stm"> 
							<img src="	https://gil.seoul.go.kr/view/point/2014/11/21/5083405443904726.jpg" alt="방이동 생태경관보전지역 사무소 앞" width="375px;" height="280px"> 
							<p>방이동 생태경관보전지역 사무소 앞</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5081775288142086.JPG" alt="탄천 끝부분" width="375px;" height="280px"> 
							<p>탄천 끝부분</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491369359466657000.jpg" alt="한강공원 광나루지구" width="275px;" height="188px;">
								<p id="infoArdTit">한강공원 광나루지구</p>
								<p>강동대교에서 잠실철교 사이에 있는 광나루 한강공원은 한강 상류로부터 유입된 토사가 퇴적되어 자연스럽게 형성된 모래톱과 대규모 갈대군락지로 
								      자연 그대로의 한강의 모습을 가장 잘 유지하고 있는 곳이다. 서울시의 유일한 상수원보호구역으로 뱃놀이와 각종 수상레저활동이 금지되어 있어 물이 맑고 깨끗하며, 
								      북쪽 아차산 수목의 푸르름과 2km에 이르는 한강둔치의 갈대밭이 잘 조화되어 아름다운 경관을 자랑한다. 
								      또한 광나루 한강공원은 철새들의 서식처이기도 하다. 더욱이 근처에는 암사선사주거지 등 많은 문화유적지가 곳곳에 산재해 있어 자연과 문화가 잘 조화를 이루는 곳이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491381122054964000.jpg" alt="성내천" width="275px;" height="188px;">
								<p id="infoArdTit">성내천</p>
								<p>성내천은 청량산에서 발원하여 몽촌토성과 풍납토성 사이를 돌아 한강으로 흘러드는 하천이다. 옛 성내리(현 성내동)를 관통하여 흘렀기 때문에 성내천이라 부른다. 
								      도시화 과정에서 건천이 되어버린 하천에 한강물과 지하수를 끌어와 흐르게 하고, 나무와 풀을 심어 생태하천으로 되살렸다. 
								      물에는 잉어가 떼 지어 올라오고 산책로와 자전거길은 한강까지 이어진다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491369459482726000.jpg" alt="길동자연생태공원" width="275px;" height="188px;">
								<p id="infoArdTit">길동자연생태공원</p>
								<p>길동 생태공원은 생물 서식공간을 복원하고 시민들에게 자연체험의 기회를 제공하여 환경에 대한 이해를 높이기 위해 하남시와 인접한 천호대로변 저습지에 조성한 공원이다. 
								      참나리, 패랭이 등의 야생 초화류가 여기저기 피어나고 말잠자리, 호랑나비가 호숫가를 선회하며 귀여운 물총새와 꼬마물떼새가 먹이를 사냥하고 흰뺨검둥오리 부부가 
								      호수를 누비는 길동자연생태공원에서는 다양한 생태학습프로그램이 연중 운영된다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/09/03/7780999835789.jpg" alt="올림픽공원" width="275px;" height="188px;">
								<p id="infoArdTit">올림픽공원</p>
								<p>서울 올림픽 공원은 대한민국 서울특별시 송파구 방이동에 있는 공원이다. 1988년 서울 올림픽을 위해 건설되었으며, 현재는 일반적인 종합 공원으로 이용되고 있다. 
								      사이클· 역도· 펜싱· 수영· 체조· 테니스 등 6개의 경기장 등의 경기 시설과 소마미술관 등 다양한 문화 시설들이 함께 있다. 
								      올림픽 공원 건설 도중 발굴된 백제 유적지 몽촌토성은 공원 내에 자리하고 있다. 올림픽공원은 야외조각공원을 비롯하여 88놀이마당, 
								      음악 분수 등과 같은 휴식공간이 조성되어 있다. 기타 주요 시설로는 올림픽회관, 올림픽 파크텔, 몽촌 역사관 등 각종 편익시설이 구비되어 있다</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491369480986338000.jpg" alt="방이동 생태경관보전지역" width="275px;" height="188px;">
								<p id="infoArdTit">방이동 생태경관보전지역</p>
								<p>서울 송파구 방이동 443-8 일대에 있는 인공습지이다. 2002년 4월 15일 58,909㎡의 면적이 생태경관보전지역으로 지정되었다. 
								      방이동 생태경관보전지역은 도심지역에서는 보기 드문 인공습지로, 2007년 5월 관찰데크, 조류전망대 등 생태복원사업을 통해 송파구 지역주민들의 생태교육장으로 활용되고 있다.</p>
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/8284370306368.jpg" alt="가든파이브" width="275px;" height="188px;">
								<p id="infoArdTit">가든파이브</p>
								<p>가든파이브는 총 6천여개의 점포가 입점하는 초대형 쇼핑몰에 멀티플랙스영화관, 서점, 전시관, 
								      스파시설은 물론 생산시설,기초산업용재판매시설,물류시설,지원시설 등이 총 망라되어 있는 원스톱 문화특구이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/03/1491208283107032000.jpg" alt="고덕산자락길" width="275px;" height="188px;">
								<p id="infoArdTit">고덕산자락길</p>
								<p>고덕산자락길은 계단이 불편한 어르신과 유모차, 휠체어 이용자 등 누구나 이용이 가능한 무장애 숲길로 조성하였다. 계단이 없는 흙길과 나무데크길이 이어진다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/7532039144334.jpg" alt="명일공원" width="275px;" height="188px;">
								<p id="infoArdTit">명일공원</p>
								<p>숲과 문화를 즐길 수 있는 공원으로 1971년에 공원으로 지정하여 강동구 상일동 산26번지 일대 53,117㎡에 야생화단지, 생태연못, 건강보도, 인라인스케이트장, 고인돌 등 일부 공원을 조성하였다.</p>	
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