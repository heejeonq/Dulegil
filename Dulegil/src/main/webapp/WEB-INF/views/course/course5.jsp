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
				<li class="on">5코스</li>
				<li onclick="document.location.href='course6'">6코스</li>
				<li onclick="document.location.href='course7'">7코스</li>
				<li onclick="document.location.href='course8'">8코스</li>
			</ul>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>5코스 - 관악·호암산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 관악구, 금천구 &nbsp;&nbsp;
					<span>총길이</span> : 13.0㎞ &nbsp;&nbsp;
					<span>소요시간</span> : 6시간 &nbsp;&nbsp;
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
						<dd>지하철 2호선, 4호선 사당역 4번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>도착지</dt>
						<dd>지하철 1호선 석수역 1번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">관악산코스는 사당역에서 출발해 관악산, 삼성산을 거쳐 석수역에 도착하는 코스이다. 
				                            관악산과 높은 고도로 등반을 위한 산행이 대부분이지만 본 코스는 관악산의 둘레길을 따라서 걷는 코스로 자연경관이 매우 훌륭하고 
				                            곳곳의 역사문화유적이 다양하게 분포하고 있어 볼거리 또한 매우 풍부하다. 
				                            대부분의 구간이 숲길로 비교적 난이도가 있는 코스지만 서울의 산림자연환경을 느낄 수 있는 최적의 코스이기도 하다.</span>
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
								<td rowspan = "4">5코스 관악·호암산코스</td>
							</tr>
							<tr>
								<td>5-1</td>
								<td>5.7㎞</td>
								<td>2시간 30분</td>
								<td>사당역 갈림길 ~ 관악산공원 입구</td>
							</tr>
							<tr>
								<td>5-2</td>
								<td>7.3㎞</td>
								<td>3시간 30분</td>
								<td>관악산공원 입구 ~ 석수역</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">사당역~관악산~삼성산~석수역</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491524194598855000.jpg" alt="관음사 입구" width="375px;" height="280px">
							<p>관음사 입구</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491549177654765000.jpg" alt="관악산 안내소 앞" width="375px;" height="280px">
							<p>관악산 안내소 앞</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/21/5083989996410890.JPG" alt="관악산 끝부분" width="375px;" height="280px"> 
							<p>관악산 끝부분</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374645730133000.jpg" alt="서울대학교" width="275px;" height="188px;">
								<p id="infoArdTit">서울대학교</p>
								<p>1946년에 설립된 한국 최초의 국립 종합대학이다. 대학본부와 14개 단과대학으로 이루어진 관악캠퍼스와 의과대학·간호대학으로 이루어진 연건캠퍼스로 나뉘어 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/15665819246504.jpg" alt="약수암" width="275px;" height="188px;">
								<p id="infoArdTit">약수암</p>
								<p>대한불교조계종 직할교구 본사인 조계사의 말사로 창건 시기는 정확히 알 수 없다. 
								   《봉은본말사지》에 따르면 어느 때인지는 모르나 김처사(金處士)라는 사람이 초가삼간을 짓고 수도하던 것이 절의 시작이라고 한다. 
								     그후 1880년(고종 17)에 명성황후가 법당을 건립하면서 절의 모습을 갖추게 되었다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491378384602788000.jpg" alt="천주교삼성산성지" width="275px;" height="188px;">
								<p id="infoArdTit">천주교삼성산성지</p>
								<p>삼성산 성지는 1839년의 기해박해 때 새남터에서 순교한 성 앵베르 주교, 성 모방 신부와 성 샤스탕 신부의 유해가 안장된 교회 사적지이다. 
								      본래 ‘삼성산’이란 명칭은 고려 말의 명승 나옹,무악,지공 등이 수도한 곳이라는 데서 유래되었다. 
								      그런데 묘하게도 이 곳 한 자락에 천주교 성직자였던 세 명의 성인 선교사의 유해가 안장되었고 1970년대 이후 천주교 안에서는 ‘ 삼성산’을 가리켜 
								   ‘ 세 명의 성인 유해가 안장되었던 성지’로 설명하게 된 것이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374662148799000.jpg" alt="호압사" width="275px;" height="188px;">
								<p id="infoArdTit">호압사</p>
								<p>대한불교조계종 직할교구 본사인 조계사의 말사이다. 1407년(태종 7) 왕명으로 창건되었다. 
								      당시 삼성산의 산세가 호랑이 형국을 하고 있어서 과천과 한양에 호환(虎患)이 많다는 점술가의 말을 듣고 산세를 누르기 위해 창건하였다고 한다. 
								      호갑사(虎岬寺) 또는 호암사(虎巖寺)라고도 하였다. 조선 후기까지의 연혁은 거의 전하지 않고, 
								      다만 1841년(헌종 7) 4월에 의민(義旻)이 상궁 남(南)씨와 유(兪)씨의 시주를 받아서 법당을 중창한 기록이 있다. 
								   1935년 만월(滿月)이 약사전을 중건하여 오늘에 이른다. 건물로는 약사전과 요사가 있고, 약사전 내에 약사불과 신중탱화가 모셔져 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374675801908000.jpg" alt="한우물" width="275px;" height="188px;">
								<p id="infoArdTit">한우물</p>
								<p>한우물 및 주변 산성지는 호암산 정상에 있는 길이 22m, 폭12m의 작은 연못 규모의 우물로 네 주변을 화강암으로 쌓았으며, 산 정상에 있으면서도 늘 물의 양이 변함없고, 
								      항상 맑은 상태로 고여있어 신비로움을 더해 주고 있다. 한우물은 용보라는 별칭을 가지고 있으며, 가뭄 때에는 기우제를 지내고 전시에는 군용에 대비하였다 한다. 
								      이 연못 모양의 우물이 만들어진 정확한 시기는 알 수 없으나 보수를 위한 발굴당시 확인된 바로는 삼국시대에 만들어진 연못이 현재의 연못 밑에 묻혀 있었으며, 
								      그 위에 어긋나게 축석한 연못이 다시 조선 초기에 만들어졌음이 밝혀졌다.</p>
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374700066338000.GIF" alt="관음사" width="275px;" height="188px;">
								<p id="infoArdTit">관음사</p>
								<p>관음사는 관악구 남현동 519-3번지 관악산 북동 기슭, 남태령 서쪽에 자리하고 있다. 예로부터 서울 근교 사찰 가운데 영험있는 관음 기도도량 중의 하나였다. 
								      관음사는 1943년 이후에 쓰여진 『봉은사본말사지(奉恩寺本末寺誌)』에 의하면 신라 진성여왕 9년(895) 도선대사가 세운 비보사찰(裨補寺刹) 중의 하나라고 전한다. 
								      조선 초기에 쓰여진 『신증동국여지승람』에 변계량이 관음사의 절경을 읊은 시가 수록되어 있어, 이 무렵까지 관음사가 있었음을 알 수 있다. 
								      또 영조 때 쓰여진 『여지도서』에도 관음사가 보인다. 예로부터 관음사 아래에 있는 승방벌이라는 마을과 '그 앞에 승방교가 있었던 것으로 미루어 
								      관음사는 작은 규모가 아니었던 것으로 보인다. 철종 14년(1863) 8월에 행념이 당시 철종의 장인인 영은부원군 김문근의 시주를 받아 다시 고쳐 지었다. 
								   1975년에 중창을 발원하여 7년여 동안 여러 건물을 차례로 중수하였다. 관음사 입구에는 수령 300여년의 느티나무가 있어 지정보호수로 관리되고 있다.</p>	
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
	    strokeColor: '#009B09', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
});
</script>
</html>