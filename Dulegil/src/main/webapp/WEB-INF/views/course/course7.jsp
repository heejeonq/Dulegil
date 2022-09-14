<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>코스 안내</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/course.css" type="text/css">
<script type="text/javascript">
$(document).ready(function(){
	$('ul.infoBtn li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.infoBtn li').removeClass('on');
		$('.infoArd').removeClass('on');

		$(this).addClass('on');
		$("#"+tab_id).addClass('on');
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
			
			<div class="crsBtn">
				<a href="course1">
					<span>1코스</span>
				</a>
				<a href="course2">
					<span>2코스</span>
				</a>
				<a href="course3">
					<span>3코스</span>
				</a>
				<a href="course4">
					<span>4코스</span>
				</a>
				<a href="course5">
					<span>5코스</span>
				</a>
				<a href="course6">
					<span>6코스</span>
				</a>
				<a href="course7">
					<span class="on">7코스</span>
				</a>
				<a href="course8">
					<span>8코스</span>
				</a>
			</div>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>7코스 - 봉산·앵봉산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 마포구, 은평구 &nbsp;&nbsp;
					<span>총길이</span> : 16.8km &nbsp;&nbsp;
					<span>소요시간</span> : 6시간 25분 &nbsp;&nbsp;
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
						<dd>지하철 9호선 가양역 4번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 1</dt>
						<dd>지하철 6호선 월드컵경기장역 3번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 2</dt>
						<dd>지하철 경의선, 공항철도, <br />
							6호선 디지털미디어시티역 1번 출입구</dd>
					</dl>
									
					<dl>
						<dt>진입로 3</dt>
						<dd>지하철 2호선 도림천역 2번 출입구</dd>
					</dl>

					<dl>				
						<dt>도착지</dt>
						<dd>지하철 3호선 구파발역 3번 출입구, <br />
							북한산 인접지</dd>
					</dl>
				</div>
			</div>
			
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">서울 둘레길의 7코스인 봉산, 앵봉산코스는 가양역에서부터 출발하여 과거의 난지도로 유명한 지금의 노을공원, 하늘공원을 통과하고 
				              2002년 이후로 많은 사람들이 찾는 월드컵경기장을 지나 진입하게 된다. 봉산과 앵봉산은 특별한 트래킹 기술을 요하지는 않으며 
				                            급한 경사지와 통과하기 어려운 곳은 정비가 잘 되어 있음에 따라 어려움은 없을 것으로 판단된다. 
				                            봉산과 앵봉산은 수국사, 서오릉 등 역사적 유산이 많아 볼거리가 다양한 것이 특징이다.</span>
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
								<td rowspan = "4">7코스 봉산·앵봉산코스</td>
							</tr>
							<tr>
								<td>7-1</td>
								<td>7.7㎞</td>
								<td>2시간 10분</td>
								<td>가양대교 남단(가양역) ~ 증산역 갈림길</td>
							</tr>
							<tr>
								<td>7-2</td>
								<td>9.1㎞</td>
								<td>4시간 15분</td>
								<td>증산역 갈림길 ~ 구파발역</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">가양역 ~ 노을공원 ~ 하늘공원 ~ 월드컵경기장 ~ 봉산 ~ 앵봉산 ~ 구파발역</td>
							</tr>
						</tbody>
					</table>	
				</div>
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491898859908939000.jpg" alt="증산체육공원 화장실 앞" width="375px;" height="280px">
							<p>증산체육공원 화장실 앞</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491898878330381000.jpg" alt="가양대교 시작점" width="375px;" height="280px">
							<p>가양대교 시작점</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491900805924229000.jpg" alt="앵봉산 끝부분" width="375px;" height="280px">
							<p>앵봉산 끝부분</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/17616986325621.jpg" alt="노을공원" width="275px;" height="188px;">
								<p id="infoArdTit">노을공원</p>
								<p>노을공원은 서울에서 가장 아름다운 저녁노을을 볼 수 있는 문화예술공원으로, 조각작품, 전망데크 등과 더불어 넓은 잔디밭에서 시민들이 여유로움을 즐길 수 있다. 
								      또한 노을공원은 고라니, 삵, 너구리 등 야생동물이 살고 있는 서울의 대표적인 생태보고이기도 하다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/17646011007880.jpg" alt="난지천공원" width="275px;" height="188px;">
								<p id="infoArdTit">난지천공원</p>
								<p>월드컵공원 내에 위치한 공원으로 한강변의 난지도 쓰레기 매립장이 폐쇄된 자리와 그 주변에 조성되었다. 
								      난지천을 생태하천으로 복원하여 갈대가 우거지고 버드나무와 각종 식물들이 군락을 형성하고 있다. 하천 외의 주변에는 어린이놀이터와 다목적운동장, 
								      게이트볼장 및 인조잔디축구장, 산책로 등의 시설이 마련되었다.</p>	
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2017/04/05/1491376653214371000.jpg" alt="하늘공원" width="275px;" height="188px;">
								<p id="infoArdTit">하늘공원</p>
								<p>제2매립지는 한강 상류 쪽에 위치한 곳으로 면적은19만㎡로 이곳은 난지도 중에서 가장 토양이 척박한 지역이다. 
								      하늘공원은 자연 천이가 진행되는 생태적 환경을 갖추고 있다기보다는 쓰레기 매립지 안정화공사의 결과로 형성된 인공적인 땅이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491374963967082000.jpg" alt="월드컵경기장" width="275px;" height="188px;">
								<p id="infoArdTit">월드컵경기장</p>
								<p>마포구 난지도길에 위치한 월드컵 경기장은 2002년 월드컵으로 인해 유명해진 곳으로 66,806명이 관람할 수 있는 경기장이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491376462327794000.jpg" alt="홍제천" width="275px;" height="188px;">
								<p id="infoArdTit">홍제천</p>
								<p>서울특별시 종로구, 서대문구, 마포구 일대에 걸쳐 흐르는 지방 2급 하천으로 조선시대에 이 하천 연안에 
								      중국의 사신이나 관리가 묵어 가던 홍제원이 있었던 까닭으로 '홍제원천'이라고도 한다. 홍제천은 생태하천으로 복원되어 많은 시민들이 이용하고 있다.</p>
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/17805418261625.JPG" alt="수국사" width="275px;" height="188px;">
								<p id="infoArdTit">수국사</p>
								<p>대한 불교조계종 수국사는 조선조 제7대 세조대왕5년(1459년)에 세조의 장남 의경세자의 극락왕생을 위해 경릉 동쪽에 정인사라는 이름으로 건립되었다. 
								      그후 화재로 소실되어 오랫동안 폐허로 남아있다가 갈현동 태화산 자락에 다시 짓게 되었다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/17863321455008.jpg" alt="은평뉴타운" width="275px;" height="188px;">
								<p id="infoArdTit">은평뉴타운</p>
								<p>은평뉴타운은 서울 도심에서 북서쪽으로 10km 떨어진 뉴타운으로 동쪽으로 북한산 국립공원, 서쪽으로는 서오릉 자연공원, 남쪽으로는 갈현근린공원과 인접한다. 
								      구역 중앙에는 진관 근린공원이 자리잡고 있고, 북쪽으로 청정하천인 창릉천이 경기도와 시계를 이루고 있는 등 도시 내에서 자연 그대로를 느낄 수 있는 
								      서울지역 최고의 자연경관을 보유하고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491380114726355000.jpg" alt="서오릉" width="275px;" height="188px;">
								<p id="infoArdTit">서오릉</p>
								<p>경기도 고양시 용두동(龍頭洞)에 있는 사적 제198호 조선시대 왕실의 무덤으로 경릉, 창릉, 익릉, 명릉, 홍릉 총 오릉이 있어 서오릉으로 불린다.</p>	
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
				
			</div>
		</div>
	</div>		

	<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>