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
		src="../../../../../jsp/jquery/jquery-1.12.4.js"></script>
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
					<span class="cBtn on">2코스</span>
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
					<span class="cBtn">6코스</span>
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
				<span>2코스 - 용마·아차산코스</span>
				
				<div class="courseLevel">
					<span>지역</span> : 광진구, 중랑구 &nbsp;&nbsp;
					<span>총길이</span> : 12.3km&nbsp;&nbsp;
					<span>소요시간</span> : 5시간 10분 &nbsp;&nbsp;
					<span>난이도</span> : 중급
				</div>	
			</div>
			
			<div class="courseCon_map">지도</div>
			
			<div class="courseCon_mapDetail">
			<img src="resources/images/mark.png">
				<span>코스 진입 방법</span><br /> 
				<div class="courseCon_1">
					<dl>
						<dt>출발지</dt>
						<dd>지하철 6호선 화랑대역 4번 출입구</dd>
					</dl>
					
					<dl>				
						<dt>진입로</dt>
						<dd>지하철 중앙선 양원역 2번 출입구</dd>
					</dl>

					<dl>				
						<dt>도착지</dt>
						<dd>지하철 5호선 광나루역 1번 출입구</dd>
					</dl>
				</div>
			</div>
			
			<div class="courseCon">
				<div class="courseCon_1">				
				<span id="cDetail">서울 둘레길의 2코스로 묵동천, 망우산, 용마산, 아차산을 통과하는 코스이다. 
							    산 능선을 따라 산책하는 코스로 서울 둘레길 중 전망이 가장 뛰어난 코스이며, 용마산과 아차산은 정비가 잘되어있는 편안한 트래킹이 가능하다. 
							    특히 아차산은 정비가 잘 되어 있을 뿐만이 아니라 아차산보루 등 역사, 문화자원이 풍부하다. 
							    또한 아차산 생태공원으로 인해 볼거리가 다양하다는 특성이 있다.</span>
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
								<td rowspan = "4">2코스 용마·아차산</td>
							</tr>
							<tr>
								<td>2-1</td>
								<td>7.7㎞</td>
								<td>3시간</td>
								<td>화랑대역 ~ 깔닥고개 쉼터(사가정역)</td>
							</tr>
							<tr>
								<td>2-2</td>
								<td>4.6㎞</td>
								<td>2시간10분</td>
								<td>깔닥고개 쉼터(사가정역) ~ 광나루역</td>
							</tr>
							<tr>
								<td colspan = "3">세부코스</td>
								<td colspan = "2">화랑대역 ~ 묵동천 ~ 중랑캠핑숲 ~ 망우산 ~ 용마산 ~ 아차산 ~ 광나루역</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				<img src="resources/images/mark.png">
				<span>스탬프 시설 위치</span>
				<div class="courseCon_1">
					<div class="wrapStp">
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491351539436985000.jpg" alt="화랑대역 4번 출구 앞 공원" width="375px;" height="280px">
							<p>화랑대역 4번 출구 앞 공원</p>
						</div>
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491522974017703000.GIF" alt="용마산 깔딱고개 쉼터" width="375px;" height="280px">
							<p>용마산 깔딱고개 쉼터</p>
						</div>
						<div class="stp"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491899111141517000.jpg" alt="아차산 관리사무소 앞" width="375px;" height="280px"> 
							<p>아차산 관리사무소 앞</p>
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
				
					<div class="tabContent active" id="tab_1">
						<div class="tabC">
							<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6396722895955.jpg" alt="중랑캠핑숲" width="275px;" height="188px;">
							<p id="conTitle">중랑캠핑숲</p>
							<p>개발제한구역내 비닐하우스등으로 훼손된 곳을 복원하여 학생소풍 및 가족단위 피크닉을 주제로 한 체험형 공원, 
							      인위적 시설 최소화, 건강한 숲을 주제로 한 생태학습 공원, 소규모 야외무대 설치 등 청소년 중심의 문화중심 공원으로 조성하였다.</p>	
						</div>
						<div class="tabC">
							<img src="https://gil.seoul.go.kr/view/point/2013/10/21/3172331853309.jpg" alt="망우묘지공원" width="275px;" height="188px;">
							<p id="conTitle">망우묘지공원</p>
							<p>망우산 일대 83만 2,800㎡의 공간에 조성된 묘지공원이다.한용운, 오세창, 서동일 등 독립운동가들과 방정환, 이중섭, 박인환 등 17인의 유명인사가 잠들어 있으며, 
							      안창호 선생의 묘도 이장되기 전에는 이곳에 있었다. 산책과 조깅을 즐길 수 있는 휴식공간으로 활용되고 있으며, 5.2km의 산책로 곳곳에 15인의 연보비가 놓여 있다.</p>	
						</div>
						<div class="tabC">
							<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6536229355332.jpg" alt="해맞이광장" width="275px;" height="188px;">
							<p id="conTitle">해맞이광장</p>
							<p>아차산내에 있는 광장으로 해돋이 뿐만 아니라 다채로운 축제가 열리는 곳이다.</p>	
						</div>
						<div class="tabC">
							<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491377097803644000.jpg" alt="묵동천" width="275px;" height="188px;">
							<p id="conTitle">묵동천</p>
							<p>묵동을 지나 중랑천과 합해진다고 해서 묵동천이라고 부른다. 봉화산 아래에 있는 묵동은 조선시대에 먹을 만들던 고장이어서 먹골이라고 했는데, 
							      한자로 표기하면서 묵동이 되었다. 유명한 먹골배가 나오던 곳이다.</p>	
						</div>
						<div class="tabC">
							<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6894249247902.jpg" alt="아차산성" width="275px;" height="188px;">
							<p id="conTitle">아차산성</p>
							<p>해발고도 200m 산정에서 시작해 동남쪽으로 한강을 향하여 완만하게 경사진 산 중턱 위쪽을 둘러서, 
							      둘레 약 1,000m 이상의 성벽이 구축되어 있으며 동쪽·서쪽·남쪽에 성문지(城門址)가 남아 있다. 
							      산성의 형식은 테뫼식[鉢卷式]에 속하나 규모가 매우 크고 성안에 작은 계곡도 있어 포곡식(包谷式)으로도 보인다.</p>
						</div>
						<div class="tabC">
							<img src="	https://gil.seoul.go.kr/view/point/2013/10/21/3820795598287.jpg" alt="아차산4보루성터" width="275px;" height="188px;">
							<p id="conTitle">아차산4보루성터</p>
							<p>보루성이라고도 불리는 보루는 사방을 조망하기 좋은 낮은 봉우리에 쌓은 소형 석축산성으로, 산성에 비해 규모가 작은 군사시설을 말한다. 
							      아차산 일대 보루군은 출토유물이나 축성방법 등으로 보아 삼국시대의 유적으로 보이며, 분포지역으로 볼 때 고구려가 5세기 후반에 한강유역을 
							      진압한 후 신라와 백제에게 한강유역을 빼앗긴 6세기 중반까지 한강유역을 둘러싼 삼국의 정세를 규명하는 중요한 유적으로 평가된다.</p>	
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
	
	<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>