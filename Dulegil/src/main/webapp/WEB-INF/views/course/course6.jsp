<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<link rel="stylesheet" href="resources/css/course.css" type="text/css">
<script type="text/javascript"
		src="../../../../../../jsp/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabTitle li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabTitle li').removeClass('active');
		$('.tabContent').removeClass('active');

		$(this).addClass('active');
		$("#"+tab_id).addClass('active');
	});
	
	$(".wrapCBtn span").click(function(){
		$(".wrapCBtn span").removeClass("on");
		$(this).addClass("on");
		$
	});

});
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- Header -->
		<jsp:include page="../common/header.jsp" flush="true"/>
	
	<!-- Container -->
	<div class="container-main">
		<div class="mainWrap">
			<div class="tit">코스 별 상세 안내</div>
			<div class="col"></div>
			
			<div class="wrapCBtn">
				<a href="course1">
					<span class="cBtn">1코스</span>
				</a>
				<a href="course2">
					<span class="cBtn">2코스</span>
				</a>
				<a href="course3">
					<span class="cBtn">3코스</span>
				</a>
				<a href="course4">
					<span class="cBtn">4코스</span>
				</a>
				<a href="course5">
					<span class="cBtn">5코스</span>
				</a>
				<a href="course6">
					<span class="cBtn on">6코스</span>
				</a>
				<a href="course7">
					<span class="cBtn">7코스</span>
				</a>
				<a href="course8">
					<span class="cBtn">8코스</span>
				</a>
			</div>
			
			<div class="courseTitle">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>6코스 - 안양천·한강코스</span>
				
				<div class="courseLevel">
					<span>지역</span> : 강서구, 구로구, 금천구, 영등포구 &nbsp;&nbsp;
					<span>총길이</span> : 18.2km &nbsp;&nbsp;
					<span>소요시간</span> : 4시간 30분 &nbsp;&nbsp;
					<span>난이도</span> : 초급
				</div>
			</div>
			
			<div class="courseCon_map">지도</div>	
			
			<div class="courseCon_mapDetail">
				<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="courseCon_1">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 1호선 석수역 2번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 1</dt>
						<dd>지하철 1호선 금천구청역</dd>
					</dl>
					
					<dl>				
						<dt>진입로 2</dt>
						<dd>지하철 1호선 구일역 1번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 3</dt>
						<dd>지하철 2호선 도림천역 2번 출입구</dd>
					</dl>

					<dl>				
						<dt>도착지</dt>
						<dd>지하철 9호선 가양역 4번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="courseCon">
				<div class="courseCon_1">					
				<span id="cDetail">안양천코스는 석수역에서 출발해 안양천, 한강을 따라 걸어 가양역에 도착하는 코스이다. 
				       		    본 코스는 다소 길지만 지하철역이 곳곳에 위치하고 있어 대중교통의 접근이 편리하고, 전 구간이 평탄한 지형으로 수월한 트레킹이 가능하다. 
				       		    서울의 하천과 한강을 만끽 할 수 있어 숲길이 대부분인 다른 코스와 차별화가 된다. 곳곳에 운동시설, 산책로, 편의시설, 휴게시설 등이 다수 위치하고 있다.<br />
							    ※특히 안양천길은 봄이면 봄꽃으로 물들며 하얀 벚꽃 비를 맞으며 길을 걸을 수 있다.</span>
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
								<td rowspan = "4">6코스 안양천·한강</td>
							</tr>
							<tr>
								<td>6-1</td>
								<td>8㎞</td>
								<td>2시간05분</td>
								<td>석수역 ~ 구일역</td>
							</tr>
							<tr>
								<td>6-2</td>
								<td>10.2㎞</td>
								<td>2시간 25분</td>
								<td>구일역 ~ 가양대교 남단(가양역)</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">석수역~안양천~한강~가양역</td>
							</tr>
						</tbody>
					</table>
					
				</div>
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="courseCon_1">
					<div class="wrapStp">
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2014/11/20/5037665361197156.jpg" alt="석수역 앞" width="375px;" height="280px">
							<p>석수역 앞</p>
						</div>
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491898757247411000.jpg" alt="구일역 앞" width="375px;" height="280px">
							<p>구일역 앞</p>
						</div>
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491898778184880000.jpg" alt="황금내 근린공원 화장실 앞" width="375px;" height="280px">
							<p>황금내 근린공원 화장실 앞</p>
						</div>
					</div>
				</div>

				<img src="resources/images/mark.png">
				<span>안내지도 및 스탬프북 배부처</span>
				<div class="courseCon_1">
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
				
				<div class="courseCon_1">
					<ul class="tabTitle">
					    <li class="tabT active" data-tab="tab_1">주변 관광지 안내</li>
					    <li class="tabT" data-tab="tab_2">주변 축제 안내</li>
					    <li class="tabT" data-tab="tab_3">주변 숙박 안내</li>
					    <li class="tabT" data-tab="tab_4">주변 식당 안내</li>
					</ul>
					
					<div class="tabDetail">
						<div class="tabContent active" id="tab_1">
							<div class="tabC">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/16241615965372.jpg" alt="안양천" width="275px;" height="188px;">
								<p id="mpT">안양천</p>
								<p>안양천(安養川)은 한강의 지류중 하나이다. 경기도 안양시를 지난다 하여 안양천이라는 이름이 붙었다. 안양천은 경기도 의왕시에서 발원하여 왕곡천, 오전천, 학의천, 산본천, 
								      수암천과 합류하며 경인선 구일역(안양천철교)부터 올림픽대로 염창교까지 국가하천으로 지정되어 있다. 안양천로와 서부간선도로가 안양천과 나란히 지나가고 있다. 
								      서울특별시에서는 양천구, 구로구, 강서구, 영등포구, 금천구, 경기도 광명시의 경계가 되기도 한다.</p>	
							</div>
							<div class="tabC">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/16522706786643.jpg" alt="목동 종합운동장" width="275px;" height="188px;">
								<p id="mpT">목동 종합운동장</p>
								<p>목동 운동장은 대한민국 서울특별시가 생활 체육의 저변 확대와 아마추어 야구의 활성화를 목적으로 1987년 대한민국 서울특별시 양천구에 건립한 종합운동장이다. 
								      주경기장, 야구장, 실내빙상장의 체육 시설과 사격장, 체력단련장의 부대 시설로 구성되어 있으며, 이용자의 편의를 위해 운동장 주차장과는 별도로 유수지를 복개하여 
								      조성한 주차 공간을 제공하고 있다. 육상 경기, 축구 경기, 아마추어 야구 경기, 빙상 경기, 아이스발레 등의 행사가 개최되며, 
								      인근에 목동 대단위 주택 단지 거주민이 편의 시설로 많이 이용하고 있다.</p>	
							</div>
							<div class="tabC">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/16586534291142.jpg" alt="양화교폭포" width="275px;" height="188px;">
								<p id="mpT">양화교폭포</p>
								<p>양화교 앞에 있으며 1979년 7월 27일에 준공하였다. 높이 15m·길이 98m의 규모로서 주 폭포를 포함하여 모두 6줄기의 폭포수가 쏟아져 내려온다. 
								      주 폭포는 높이 12m·넓이 15m 규모이며, 나머지 폭포들은 높이 12m·넓이는 각각 2~3m이다. 
								      폭포가 쏟아져 형성하는 연못 주변에 180개의 수중등과 투광등을 설치해놓아 밤이면 아름다운 야경이 연출된다. 
								      폭포 주위로는 녹지대를 조성하여 시민공원으로 활용하며, 파라솔·벤치·식수대·화장실·휴게실 등과 주차장도 설치되어 있다.</p>	
							</div>
							<div class="tabC">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/16622156869838.jpg" alt="황금내근린공원" width="275px;" height="188px;">
								<p id="mpT">황금내근린공원</p>
								<p>넓이 2만 2,002㎡로, 1993년 11월 1일 개원하였다. 서울 올림픽대로를 따라 길게 뻗어 있으며 올림픽대로와 맞닿는 면에는 높은 펜스가 있다. 
								      농구장·테니스장·배드민턴장 ·소운동장 등의 체육공간과 화장실·정자·벤치 등이 있다. 스트로브잣나무·은행나무·벚나무·느티나무 등이 있고, 
								      나무 사이로 700m의 탄성고무산책로가 있어 조깅하거나 산책하기에 좋다.</p>	
							</div>
						</div>
						
						<div class="tabContent" id="tab_2">
						  	<div class="tabC">
								<p>탭 메뉴 2 내용입니다.</p>
						  	</div>
						</div>
							
						<div class="tabContent" id="tab_3" >
							<div class="tabC">
								<p> 탭 메뉴 3 내용입니다.</p>
							</div>
						</div>
							
						<div class="tabContent" id="tab_4">
							<div class="tabC">
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