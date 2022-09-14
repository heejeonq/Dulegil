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
					<span class="on">1코스</span>
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
					<span>7코스</span>
				</a>
				<a href="course8">
					<span>8코스</span>
				</a>
			</div>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>1코스 - 수락·불암산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 노원구, 도봉구 &nbsp;&nbsp;
					<span>총길이</span> : 18.6km &nbsp;&nbsp;
					<span>소요시간</span> : 8시간 10분 &nbsp;&nbsp;
					<span>난이도</span> : 고급
				</div>
			</div>
				
			<div class="crsMap">지도</div>	
		
			<div class="crsMapDtl">
				<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="crsDtl">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 1호선, 7호선 도봉산역 2번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 1</dt>
						<dd>지하철 7호선 수락산역 3번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로 2</dt>
						<dd>지하철 4호선 당고개역 3번 출입구</dd>
					</dl>

					<dl>				
						<dt>도착지</dt>
						<dd>지하철 6호선 화랑대역 4번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">서울 둘레길의 1코스로서 수락산과 불암산을 통과하는 노선이다. 
							    서울의 대표적인 수락산과 불암산을 트래킹하며 숙련된 트래킹기술을 요하지는 않도록 정상을 통과하는 것이 아닌 
							    불암산을 둘러 통과하는 노선으로 대체적으로 완만하다. 이 코스는 수락산과 함께 연계되어 태릉까지 이어지며 
							    노선주변으로 수락산역, 당고개역, 상계역, 화랑대역 등이 인접한다.</span>
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
							<td rowspan = "6">1코스 수락·불암산</td>
						</tr>
						<tr>
							<td>1-1</td>
							<td>6.3㎞</td>
							<td>2시간50분</td>
							<td>도봉산역 ~ 당고개공원 갈림길</td>
						</tr>
						<tr>
							<td>1-2</td>
							<td>5.4㎞</td>
							<td>2시간50분</td>
							<td>당고개공원 갈림길 ~ 철쭉동산</td>
						</tr>
						<tr>
							<td>1-3</td>
							<td>6.9㎞</td>
							<td>2시간30분</td>
							<td>철쭉동산 ~ 화랑대역</td>
						</tr>
						<tr>
							<td colspan = "3">단축코스</td>
							<td>당고개 ~ 철쭉동산</td>
						</tr>
						<tr>
							<td colspan = "3">세부코스</td>
							<td colspan = "2">도봉산역 ∼ 서울창포원 ∼ 덕릉고개 ∼ 넒은마당 ∼ 경수사 ∼ 성관사 
											      ∼넓적바위 ∼ 학도암 ∼ 태릉 ∼ 화랑대</td>
						</tr>
					</tbody>
				</table>
				</div>
			
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491352274176704000.jpg" alt="창포원 관리사무소 앞" width="375px;" height="280px">
							<p>창포원 관리사무소 앞</p>
						</div>
						<div class="stm"> 
							<img src="	https://gil.seoul.go.kr/view/point/2014/11/20/5036898724304879.jpg" alt="불암산 우회코스 갈림길" width="375px;" height="280px">
							<p>불암산 우회코스 갈림길</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491351484981518000.jpg" alt="화랑대역 4번 출구 앞 공원" width="375px;" height="280px"> 
							<p>화랑대역 4번 출구 앞 공원</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/3700195241870.jpg" alt="서울창포원" width="275px;" height="188px;">
								<p id="infoArdTit">서울창포원</p>
								<p>서울창포원은 총면적 52,417㎡에 꽃창포를 비롯한 붓꽃을 주제로 한 서울시의 생태공원으로서 
								   12개의 테마로 구분 조성되어 시민들에게 생태교육 및 여가와 휴식공간을 제공한다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/03/1491207072509464000.JPG" alt="벽운동계곡" width="275px;" height="188px;">
								<p id="infoArdTit">벽운동계곡</p>
								<p>수락골계곡은 푸른 바위와 안개가 자욱한 계곡이란 뜻으로 벽운동계곡이라고 부르며 서예가 이병직이 바위에 새긴 벽운동천등의 글씨가 있다. 
								      수락골 등산로는 계유정란 이후 수락산에 숨어 살았던 김시습을 기념하여 김시습산길이라고 한다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/3769376943425.jpg" alt="덕릉고개" width="275px;" height="188px;">
								<p id="infoArdTit">덕릉고개</p>
								<p>노원구의 수락산과 불암산을 연결해주는 곳으로 생태육교를 설치하여 사람뿐만이 아닌 동물도 이동이 가능하도록 만들어진 다리이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/03/1491207848527459000.jpg" alt="넓적바위" width="275px;" height="188px;">
								<p id="infoArdTit">넓적바위</p>
								<p>풍요와 다산을 기원하던 여근석이다. 이곳 넓적바위도 아랫마을 동제의 대상이었을 것이고 조선시대에는 아들 낳기를 바라는 여인들의 발길이 끊이지 않았을 것이다. 
								      원래는 호젓한 산속이었지만 둘레길이 나면서 사람들이 많이 지나는 곳이 되었다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/3820580874985.JPG" alt="넓은마당" width="275px;" height="188px;">
								<p id="infoArdTit">넓은마당</p>
								<p>불암산 둘레길 노선에 위치한 공원으로 휴식시설과 편익시설 등이 설치되어 있으며 이용객들과 동네 주민들이 휴식을 취할 수 있는 공간이다.</p>
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/4519656670990.jpg" alt="학도암" width="275px;" height="188px;">
								<p id="infoArdTit">학도암</p>
								<p>학도암은 조선 인조2년(1624)무공화상이 불암산에 있던 옛절을 이곳으로 옮겨 창건하였다. 
								      학도암에는, 큰법당, 삼성각 등의 전각이 있으며, 대웅전 뒤편 암벽에는 명성황후의 염원에 의해 1872년에 조성된 높이 22.7m, 
								      폭 7m의 거대한 '마애관음보살좌상(서울시유형문화재 제 124호)이 있는데 조선후기의 뛰어난 마애상으로 평가받고 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/03/1491208006062534000.JPG" alt="노원골(천상병산길)" width="275px;" height="188px;">
								<p id="infoArdTit">노원골(천상병산길)</p>
								<p>노원골 아래는 넓은 평야에 갈대가 많아 노원평이라 불렀고, 말이 뛰놀아 마들이라고도 했다. 
								      노원이란 지명이 여기서 유래했다. 서울시 무형문화재 제22호인 마들농요는 노원평야에서 부르던 농요이며, 노원골에서 시인 천상병이 살았다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/03/1491206293952687000.jpg" alt="채석장" width="275px;" height="188px;">
								<p id="infoArdTit">채석장</p>
								<p>수락산 귀임봉 아래는 최근까지 채석장으로 이용되었다. 
								      전망이 뛰어나 불암산, 용마산, 아차산, 관악산, 남산, 북한산이 모두 보이고 그 사이에 안겨있는 서울 시내가 한눈에 들어온다.</p>	
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