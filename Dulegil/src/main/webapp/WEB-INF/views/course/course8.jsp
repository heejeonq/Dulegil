<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/course.css" />
<title>코스 안내</title>
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
	<c:import url="/header"></c:import>
	
	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">코스 별 상세 안내</div>
			<div class="col"></div>
			
			<ul class="crsBtn">
				<li onclick="document.location.href='course1'">1코스</li>
				<li onclick="document.location.href='course2'">2코스</li>
				<li onclick="document.location.href='course3'">3코스</li>
				<li onclick="document.location.href='course4'">4코스</li>
				<li onclick="document.location.href='course5'">5코스</li>
				<li onclick="document.location.href='course6'">6코스</li>
				<li onclick="document.location.href='course7'">7코스</li>
				<li class="on">8코스</li>
			</ul>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>8코스 - 북한·도봉산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 강북구, 도봉구, 성북구, 은평구, 종로구 &nbsp;&nbsp;
					<span>총길이</span> : 33.7km &nbsp;&nbsp;
					<span>소요시간</span> : 16시간30분 &nbsp;&nbsp;
					<span>난이도</span> : 중급
				</div>	
			</div>
			
			<div id="map" style="width:800px;height:600px;"></div>
			
			<div class="crsMapDtl">
				<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="crsDtl">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 3호선 구파발역 2번 출입구, 
						<br/>북한산 인접지</dd>
					</dl>
					
					<dl>				
						<dt>도착지</dt>
						<dd>지하철 1호선, 7호선 도봉산역 1번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="crsCon">
				<div class="crsDtl">			
				<span id="crsInfo">8코스는 북한산 둘레길을 이용해 통과하는 노선으로 이미 개통이 된 곳으로 이용하여 정비가 잘되어 있다. 
				 			    대체적으로 경사가 급하진 않지만 약간의 코스에서 어려움이 있다. 또한 산 코스임에도 노선이 길어 하루동안 코스를 통과할 수는 없다. 
				 			  8코스는 대체적으로 사찰과 문화재뿐만 아닌 계곡 등의 자연적 요소 등이 분포되어있어 볼거리가 다양한 코스이다.</span>
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
								<td rowspan = "7">8코스 - 북한·도봉산코스</td>
							</tr>
							<tr>
								<td>8-1</td>
								<td>5.9㎞</td>
								<td>2시간 45분</td>
								<td>구파발역 ~ 북한산생태공원</td>
							</tr>
							<tr>
								<td>8-2</td>
								<td>7.4㎞</td>
								<td>4시간 00분</td>
								<td>북한산생태공원 ~ 형제봉 입구</td>
							</tr>
							<tr>
								<td>8-3</td>
								<td>6㎞</td>
								<td>2시간 50분</td>
								<td>형제봉 입구 ~ 화계사 일주문</td>
							</tr>
							<tr>
								<td>8-4</td>
								<td>7.1㎞</td>
								<td>3시간 30분</td>
								<td>화계사 일주문 ~ 북한산 우이역</td>
							</tr>
							<tr>
								<td>8-5</td>
								<td>7.3㎞</td>
								<td>3시간 25분</td>
								<td>북한산 우이역 ~ 도봉산역</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">은평뉴타운 ~ 선림사 ~ 북한산생태공원 ~ 탕춘대성암문 ~ 불심원 ~ 연화정사 ~<br />
												    성북생태체험관 ~ 빨래골지킴터 ~ 이준열사묘소 ~ 419국립묘지 ~ 봉황각 ~ <br />
												    우이령길입구 ~ 연산군묘 ~ 정의공주묘 ~ 무수골 ~ 도봉탐방지원센터 ~ 도봉산역</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5095611149712603.jpg" alt="명상길 시작점" width="375px;" height="280px">
							<p>북한산둘레길 명상길 시작점</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491522808825771000.jpg" alt="왕실묘역 시작점" width="375px;" height="280px">
							<p>북한산둘레길 왕실묘역길 시작점</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/28/5726670996599803.jpg" alt="흰구름길 시작점" width="375px;" height="280px">
							<p>북한산둘레길 흰구름길 시작점</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/28/5726727937741309.jpg" alt="도봉탐방지원센터 옆" width="375px;" height="280px">
							<p>도봉탐방지원센터 앞</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5084249688977808.jpg" alt="선림사 옆" width="375px;" height="280px">
							<p>서울둘레길과 북한산둘레길 합류점</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5095561903951134.JPG" alt="옛성길 시작점" width="375px;" height="280px">
							<p>북한산둘레길 옛성길 시작점</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2013/10/26/26712146624890792.jpg" alt="이준열사묘소" width="275px;" height="188px;">
								<p id="infoArdTit">이준열사묘소</p>
								<p>한말의 독립운동가 이준(李儁 1859~1907)의 묘이다. 묘역 입구에는 위훈비와 홍살문이 서 있고, 
								      묘역으로 올라가는 숲속 오솔길 곳곳에 이준이 남긴 말을 적은 비석들이 배치되어 있다. 
								      묘역에 들어서면 이준의 흉상부조가 부착된 벽체 아래에 태극기가 새겨진 석판이 놓여 있는데, 그 석판 밑에 이준열사가 묻혀 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/09/03/19936752673232.jpg" alt="북한산생태공원" width="275px;" height="188px;">
								<p id="infoArdTit">북한산생태공원</p>
								<p>북한산 생태공원(북한산도시자연공원)은 행정구역상 서울시 은평구 불광동에 위치하고 있으며, 
								      북쪽에는 북한산국립공원이 자리 잡고 동쪽에는 구기터널이 있으며 서쪽에는 불광역이 위치하고 있어 서울둘레길, 
								      은평둘레길과 더불어 북한산국립공원을 이용하는 시민고객들의 만남의 장소로 이용되고 있고 아울러 지역주민들의 쉼터로 애용되고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/19974693452873.jpg" alt="탕춘대성암문" width="275px;" height="188px;">
								<p id="infoArdTit">탕춘대성암문</p>
								<p>대남문과 비봉능선에서 이어져 내려와 조선시대 도성과 북한산성을 연결하여 축성된 성문이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/10/26/26712030978134412.jpg" alt="성북생태체험관" width="275px;" height="188px;">
								<p id="infoArdTit">성북생태체험관</p>
								<p>북한산에 인접하여 위치한 성북생태체험관은 자연학습을 통해 식물과 동물을 알고 교육을 할 수 있는 곳으로 어린이 뿐만 아니라 어른들도 함께 보고 즐길 수 있는 곳이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/10/26/26712085620924076.JPG" alt="빨래골지킴터" width="275px;" height="188px;">
								<p id="infoArdTit">빨래골지킴터</p>
								<p>빨래골은 삼각산 골짜기에서 흘러내리는 물의 양이 많아 ‘무너미’라 불리던 곳이다. 물이 많아 자연적으로 마을이 형성되어 인근 주민들의 쉼터와 빨래터로 이용되었고, 
								      당시 대궐의 궁중 무수리들이 빨래터와 휴식처로 이용하면서 ‘빨래골’이라는 명칭이 유래되었으며 지금도 일반인들에게 널리 통용되고 있는 지명이다.</p>
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/10/26/26712190676481024.JPG" alt="419국립묘지" width="275px;" height="188px;">
								<p id="infoArdTit">419국립묘지</p>
								<p>1963년 9월 20일 약 3,000평으로 건립되었다. 한가운데 4·19혁명의 기상을 상징하는 높이 7척의 탑주 일곱 개가 솟아 있고, 
								      주위에는 수호신상 및 각도를 달리한 20개의 만장이 조화를 이루었다. 진입로 앞에 세운 ‘민주의 뿌리’는 9개 기둥의 화강암 조형물로 민주주의 발원지임을 뜻하고, 
								      중앙 양측에 마련된 청동재질의 ‘자유투사’는 독재정권에 항쟁하는 모습을 담았으며, 화강암 재질의 ‘정의의 불꽃’은 높이 9m의 불꽃형상으로 4·19의 정신을 뜻한다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/10/26/26712250671772392.jpg" alt="봉황각" width="275px;" height="188px;">
								<p id="infoArdTit">봉황각</p>
								<p>1969년 9월 18일 서울특별시유형문화재 제2호로 지정되었다. 1912년 6월 19일 천도교 제3세 교조인 
								      의암 손병희(孫秉熙:1862∼1922)가 천도교의 신앙생활을 뿌리내리게 하는 한편, 보국안민(輔國安民)을 내세우고 천도교 지도자들에게 역사의식을 심어주며 
								      일제에 빼앗긴 주권을 되찾기 위하여 항일독립운동을 이끌 교역자를 양성하기 위한 목적으로 지었다. 
								      독립운동사에서 중요한 기능을 수행한 민족의 성지로서 재인식되고 있으며, 후세들의 역사탐방 장소로 많이 이용되고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2017/04/06/1491454023056197000.jpg" alt="김수영문학관" width="275px;" height="188px;">
								<p id="infoArdTit">김수영문학관</p>
								<p>김수영(1921~1968)시인은 대한민국의 대표적 자유시인이다. 문학관 1,2층 전시실에는 시인의 작품 초고, 육피 원고와 사진 등이 전시되어 있고
								   3,4층은 작은 도서관, 강당 등으로 구성되어있다. 문학관에서 원당샘공원에 이르는 거리는 주변의 둘레길과 역사문화 명소를 연계하여 
								   ‘문화의 거리’로 조성되어 볼거리를 제공하고 있다. 김수영시인의 대표작인 ‘풀’이 새겨진 시비는 도봉서원 아래 위치하고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491369359466657000.jpg" alt="한강공원 광나루지구" width="275px;" height="188px;">
								<p id="infoArdTit">한강공원 광나루지구</p>
								<p>강동대교에서 잠실철교 사이에 있는 광나루 한강공원은 한강 상류로부터 유입된 토사가 퇴적되어 자연스럽게 형성된 모래톱과 대규모 갈대군락지로 
								      자연 그대로의 한강의 모습을 가장 잘 유지하고 있는 곳이다. 서울시의 유일한 상수원보호구역으로 뱃놀이와 각종 수상레저활동이 금지되어 있어 물이 맑고 깨끗하며, 
								      북쪽 아차산 수목의 푸르름과 2km에 이르는 한강둔치의 갈대밭이 잘 조화되어 아름다운 경관을 자랑한다. 
								      또한 광나루 한강공원은 철새들의 서식처이기도 하다. 더욱이 근처에는 암사선사주거지 등 많은 문화유적지가 곳곳에 산재해 있어 자연과 문화가 잘 조화를 이루는 곳이다.</p>	
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
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d38ddde2d7bb1d66146f9d2cdccedf3"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.65456,127.08348), //지도의 중심좌표. !!!내용수정하기
			level: 7 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options);
	
	var linePath = [];

	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#D10003', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
});
</script>
</html>