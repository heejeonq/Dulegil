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
/* 행사 정보 */
$.ajax({
	url: "http://openAPI.seoul.go.kr:8088/796c6d6446676d6c38354a416a4b55/json/GJListPublicReservationCulture/1/10/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawGJEvtList(res.GJListPublicReservationCulture.row);
	},
	error : function(request, status, error){
		console.log(request.responseText);
	}
});

$.ajax({
	url: "http://openAPI.seoul.go.kr:8088/6450736d6c676d6c3130364457646141/json/JRListPublicReservationCulture/1/10/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawJLEvtList(res.JRListPublicReservationCulture.row);
	},
	error : function(request, status, error){
		console.log(request.responseText);
	}
});


/* 숙박 정보*/
$.ajax({
	url: "http://openapi.seoul.go.kr:8088/6f53486e41676d6c35384c726f6d54/json/LOCALDATA_031103_GJ/1/50/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawGJStayList(res.LOCALDATA_031103_GJ.row);
	},
	error : function(request, status, error){
		
	}
});
$.ajax({
	url: "http://openapi.seoul.go.kr:8088/6255537262676d6c3735716d527764/json/LOCALDATA_031103_JR/1/50/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawJRStayList(res.LOCALDATA_031103_JR.row);
	},
	error : function(request, status, error){
		
	}
});






/* 음식점 정보 */
$.ajax({
	url: "http://openapi.seoul.go.kr:8088/(인증키)/json/LOCALDATA_072404_GJ/1/50/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawGJStayList(res.LOCALDATA_031103_GJ.row);
	},
	error : function(request, status, error){
		
	}
});

$.ajax({
	url: "http://openapi.seoul.go.kr:8088/6247544441676d6c36347a6362647a/json/LOCALDATA_072404_DB/1/50/",
	type: "GET",
	dataType: "json",
	success : function(res){
		drawDBRstrList(res.LOCALDATA_072404_DB.row);
	},
	error : function(request, status, error){
		console.log(request.responseText);
	}
}); 


/* 행사 정보 */
function drawGJEvtList(list){
var html = "";

for (var i=0; i<list.length; i++){
	html += "<tr>";
	html += "<td rowspan=2>광진구</td>";
	html += "<td rowspan=2>" + list[i].SVCNM + "</td>";
	html += "<td>" + list[i].PLACENM +", 서비스대상 : "+ list[i].USETGTINFO +  "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SVCURL + "</td>";
	html += "</tr>";
}
$(".infoTable2 tbody").append(html);
}

function drawJLEvtList(list){
var html = "";

for (var i=0; i<list.length; i++){
	html += "<tr>";
	html += "<td rowspan=2>중랑구</td>";
	html += "<td rowspan=2>" + list[i].SVCNM + "</td>";
	html += "<td>" + list[i].PLACENM +", 서비스대상 : "+ list[i].USETGTINFO +  "</td>";
	html += "</tr>";
	html += "<tr>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SVCURL + "</td>";
	html += "</tr>";
}
$(".infoTable2 tbody").append(html);
} 

/* 숙박 정보*/
function drawJRStayList(list){
var html = "";

for (var i=0; i<list.length; i++){
	if(list[i].DTLSTATENM == "영업"){
		html += "<tr>";
		html += "<td>중랑</td>";
		html += "<td>" + list[i].BPLCNM + "</td>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITEWHLADDR + "</td>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITETEL + "</td>";
		html += "</tr>";
		}
}
$(".infoTable3 tbody").append(html);
}

function drawGJStayList(list){
	var html = "";

	for (var i=0; i<list.length; i++){
		if(list[i].DTLSTATENM == "영업"){
			html += "<tr>";
			html += "<td>광진</td>";
			html += "<td>" + list[i].BPLCNM + "</td>";
			html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITEWHLADDR + "</td>";
			html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITETEL + "</td>";
			html += "</tr>";
			}
	}
	$(".infoTable3 tbody").append(html);
	}


/* 음식점 정보 */
function drawNWRstrList(list){
var html = "";

for (var i=0; i<list.length; i++){
	if(list[i].DTLSTATENM != "폐업"){
	html += "<tr>";
	html += "<td>노원구</td>";
	html += "<td>" + list[i].BPLCNM + "</td>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].RDNWHLADDR + "</td>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITETEL + "</td>";
	html += "</tr>";
	}
}
$(".infoTable4 tbody").append(html);
}

function drawDBRstrList(list){
var html = "";

for (var i=0; i<list.length; i++){
	if(list[i].DTLSTATENM != "폐업"){
	html += "<tr>";
	html += "<td>도봉구</td>";
	html += "<td>" + list[i].BPLCNM + "</td>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].RDNWHLADDR + "</td>";
	html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].SITETEL + "</td>";
	html += "</tr>";
	}
}
$(".infoTable4 tbody").append(html);
}
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
				<li class="on">2코스</li>
				<li onclick="document.location.href='course3'">3코스</li>
				<li onclick="document.location.href='course4'">4코스</li>
				<li onclick="document.location.href='course5'">5코스</li>
				<li onclick="document.location.href='course6'">6코스</li>
				<li onclick="document.location.href='course7'">7코스</li>
				<li onclick="document.location.href='course8'">8코스</li>
			</ul>
			
			<div class="crsTit">
				<img src="https://gil.seoul.go.kr/walk/images/sub/sc2.png" alt="코스">
				<br />
				<span>2코스 - 용마·아차산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 광진구, 중랑구 &nbsp;&nbsp;
					<span>총길이</span> : 12.3km&nbsp;&nbsp;
					<span>소요시간</span> : 5시간 10분 &nbsp;&nbsp;
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
			
			<div class="crsCon">
				<div class="crsDtl">				
				<span id="crsInfo">서울 둘레길의 2코스로 묵동천, 망우산, 용마산, 아차산을 통과하는 코스이다. 
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
				<div class="crsDtl">
					<div class="crsStm">
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491351539436985000.jpg" alt="화랑대역 4번 출구 앞 공원" width="375px;" height="280px">
							<p>화랑대역 4번 출구 앞 공원</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/07/1491522974017703000.GIF" alt="용마산 깔딱고개 쉼터" width="375px;" height="280px">
							<p>용마산 깔딱고개 쉼터</p>
						</div>
						<div class="stm"> 
							<img src="https://gil.seoul.go.kr/view/point/2017/04/11/1491899111141517000.jpg" alt="아차산 관리사무소 앞" width="375px;" height="280px"> 
							<p>아차산 관리사무소 앞</p>
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
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6396722895955.jpg" alt="중랑캠핑숲" width="275px;" height="188px;">
								<p id="infoArdTit">중랑캠핑숲</p>
								<p>개발제한구역내 비닐하우스등으로 훼손된 곳을 복원하여 학생소풍 및 가족단위 피크닉을 주제로 한 체험형 공원, 
								      인위적 시설 최소화, 건강한 숲을 주제로 한 생태학습 공원, 소규모 야외무대 설치 등 청소년 중심의 문화중심 공원으로 조성하였다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/10/21/3172331853309.jpg" alt="망우묘지공원" width="275px;" height="188px;">
								<p id="infoArdTit">망우묘지공원</p>
								<p>망우산 일대 83만 2,800㎡의 공간에 조성된 묘지공원이다.한용운, 오세창, 서동일 등 독립운동가들과 방정환, 이중섭, 박인환 등 17인의 유명인사가 잠들어 있으며, 
								      안창호 선생의 묘도 이장되기 전에는 이곳에 있었다. 산책과 조깅을 즐길 수 있는 휴식공간으로 활용되고 있으며, 5.2km의 산책로 곳곳에 15인의 연보비가 놓여 있다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6536229355332.jpg" alt="해맞이광장" width="275px;" height="188px;">
								<p id="infoArdTit">해맞이광장</p>
								<p>아차산내에 있는 광장으로 해돋이 뿐만 아니라 다채로운 축제가 열리는 곳이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2017/04/05/1491377097803644000.jpg" alt="묵동천" width="275px;" height="188px;">
								<p id="infoArdTit">묵동천</p>
								<p>묵동을 지나 중랑천과 합해진다고 해서 묵동천이라고 부른다. 봉화산 아래에 있는 묵동은 조선시대에 먹을 만들던 고장이어서 먹골이라고 했는데, 
								      한자로 표기하면서 묵동이 되었다. 유명한 먹골배가 나오던 곳이다.</p>	
							</div>
							<div class="infoDtl">
								<img src="https://gil.seoul.go.kr/view/point/2013/09/03/6894249247902.jpg" alt="아차산성" width="275px;" height="188px;">
								<p id="infoArdTit">아차산성</p>
								<p>해발고도 200m 산정에서 시작해 동남쪽으로 한강을 향하여 완만하게 경사진 산 중턱 위쪽을 둘러서, 
								      둘레 약 1,000m 이상의 성벽이 구축되어 있으며 동쪽·서쪽·남쪽에 성문지(城門址)가 남아 있다. 
								      산성의 형식은 테뫼식[鉢卷式]에 속하나 규모가 매우 크고 성안에 작은 계곡도 있어 포곡식(包谷式)으로도 보인다.</p>
							</div>
							<div class="infoDtl">
								<img src="	https://gil.seoul.go.kr/view/point/2013/10/21/3820795598287.jpg" alt="아차산4보루성터" width="275px;" height="188px;">
								<p id="infoArdTit">아차산4보루성터</p>
								<p>보루성이라고도 불리는 보루는 사방을 조망하기 좋은 낮은 봉우리에 쌓은 소형 석축산성으로, 산성에 비해 규모가 작은 군사시설을 말한다. 
								      아차산 일대 보루군은 출토유물이나 축성방법 등으로 보아 삼국시대의 유적으로 보이며, 분포지역으로 볼 때 고구려가 5세기 후반에 한강유역을 
								      진압한 후 신라와 백제에게 한강유역을 빼앗긴 6세기 중반까지 한강유역을 둘러싼 삼국의 정세를 규명하는 중요한 유적으로 평가된다.</p>	
							</div>
						</div>
					
						<div class="infoArd" id="tab_2">
						  	<div>
								<table class="infoTable2">
									<colgroup style="table-layout: fixed;">
										<col width="100px">
										<col width="400px">
										<col width="auto">
									</colgroup>
									<thead>
										<tr>
											<th>구분</th>
											<th>제목</th>
											<th>관련 내용 / 링크</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
						  	</div>
						</div>
							
						<div class="infoArd" id="tab_3" >
							<div>
								<table class="infoTable3">
									<colgroup style="table-layout: fixed;">
										<col width="100px">
										<col width="300px">
										<col width="450px">
										<col width="150px">
									</colgroup>
									<thead>
										<tr>
											<th>구분</th>
											<th>사업장명</th>
											<th>주소</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
							
						<div class="infoArd" id="tab_4">
							<div class="infoDtl">
								<div>
									<table class="infoTable4">
										<colgroup style="table-layout: fixed;">
											<col width="100px">
											<col width="300px">
											<col width="450px">
											<col width="150px">
										</colgroup>
										<thead>
											<tr>
												<th>구분</th>
												<th>사업장명</th>
												<th>주소</th>
												<th>전화번호</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
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
			center: new kakao.maps.LatLng(37.58295,127.10777), //지도의 중심좌표. !!!내용수정하기
			level: 7 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options);
	
	var linePath = [
		new kakao.maps.LatLng(37.61991,127.08603),
		new kakao.maps.LatLng(37.62001,127.0858),
		new kakao.maps.LatLng(37.62012,127.0856),
		new kakao.maps.LatLng(37.62021,127.08537),
		new kakao.maps.LatLng(37.62027,127.08512),
		new kakao.maps.LatLng(37.62045,127.08514),
		new kakao.maps.LatLng(37.62031,127.0853),
		new kakao.maps.LatLng(37.62034,127.08554),
		new kakao.maps.LatLng(37.62038,127.08579),
		new kakao.maps.LatLng(37.62035,127.08602),
		new kakao.maps.LatLng(37.62032,127.08625),
		new kakao.maps.LatLng(37.62029,127.08651),
		new kakao.maps.LatLng(37.62025,127.08673),
		new kakao.maps.LatLng(37.62017,127.08694),
		new kakao.maps.LatLng(37.62011,127.08717),
		new kakao.maps.LatLng(37.62014,127.0874),
		new kakao.maps.LatLng(37.62007,127.08797),
		new kakao.maps.LatLng(37.61996,127.08815),
		new kakao.maps.LatLng(37.61994,127.08838),
		new kakao.maps.LatLng(37.61982,127.08855),
		new kakao.maps.LatLng(37.61971,127.08874),
		new kakao.maps.LatLng(37.61964,127.08895),
		new kakao.maps.LatLng(37.61954,127.08916),
		new kakao.maps.LatLng(37.61943,127.08939),
		new kakao.maps.LatLng(37.61935,127.08962),
		new kakao.maps.LatLng(37.61925,127.08985),
		new kakao.maps.LatLng(37.61916,127.09006),
		new kakao.maps.LatLng(37.61908,127.09028),
		new kakao.maps.LatLng(37.61897,127.09049),
		new kakao.maps.LatLng(37.61887,127.09071),
		new kakao.maps.LatLng(37.61877,127.09093),
		new kakao.maps.LatLng(37.61867,127.09117),
		new kakao.maps.LatLng(37.61857,127.09137),
		new kakao.maps.LatLng(37.6185,127.09159),
		new kakao.maps.LatLng(37.6184,127.09179),
		new kakao.maps.LatLng(37.61829,127.09201),
		new kakao.maps.LatLng(37.61818,127.09223),
		new kakao.maps.LatLng(37.61806,127.09243),
		new kakao.maps.LatLng(37.61797,127.09264),
		new kakao.maps.LatLng(37.61786,127.09285),
		new kakao.maps.LatLng(37.61776,127.09306),
		new kakao.maps.LatLng(37.61766,127.09327),
		new kakao.maps.LatLng(37.61756,127.0935),
		new kakao.maps.LatLng(37.61747,127.09371),
		new kakao.maps.LatLng(37.61735,127.09391),
		new kakao.maps.LatLng(37.6168,127.09476),
		new kakao.maps.LatLng(37.61683,127.09498),
		new kakao.maps.LatLng(37.61668,127.09517),
		new kakao.maps.LatLng(37.61653,127.09533),
		new kakao.maps.LatLng(37.61639,127.09549),
		new kakao.maps.LatLng(37.61623,127.09564),
		new kakao.maps.LatLng(37.61609,127.09579),
		new kakao.maps.LatLng(37.61594,127.09595),
		new kakao.maps.LatLng(37.61577,127.09613),
		new kakao.maps.LatLng(37.61565,127.0963),
		new kakao.maps.LatLng(37.61553,127.09648),
		new kakao.maps.LatLng(37.61547,127.09671),
		new kakao.maps.LatLng(37.61548,127.09695),
		new kakao.maps.LatLng(37.61554,127.09719),
		new kakao.maps.LatLng(37.61558,127.09742),
		new kakao.maps.LatLng(37.61539,127.09748),
		new kakao.maps.LatLng(37.61534,127.09726),
		new kakao.maps.LatLng(37.61532,127.09703),
		new kakao.maps.LatLng(37.61529,127.09679),
		new kakao.maps.LatLng(37.61534,127.09657),
		new kakao.maps.LatLng(37.61545,127.09635),
		new kakao.maps.LatLng(37.61555,127.09615),
		new kakao.maps.LatLng(37.61556,127.09589),
		new kakao.maps.LatLng(37.61538,127.09586),
		new kakao.maps.LatLng(37.61517,127.0959),
		new kakao.maps.LatLng(37.61502,127.09603),
		new kakao.maps.LatLng(37.61495,127.09625),
		new kakao.maps.LatLng(37.61487,127.09646),
		new kakao.maps.LatLng(37.61481,127.09669),
		new kakao.maps.LatLng(37.61469,127.0969),
		new kakao.maps.LatLng(37.61462,127.09711),
		new kakao.maps.LatLng(37.6145,127.09729),
		new kakao.maps.LatLng(37.61441,127.0975),
		new kakao.maps.LatLng(37.61442,127.09775),
		new kakao.maps.LatLng(37.61437,127.09797),
		new kakao.maps.LatLng(37.61437,127.09821),
		new kakao.maps.LatLng(37.61427,127.09842),
		new kakao.maps.LatLng(37.6142,127.09866),
		new kakao.maps.LatLng(37.61409,127.09889),
		new kakao.maps.LatLng(37.61392,127.09904),
		new kakao.maps.LatLng(37.61378,127.09922),
		new kakao.maps.LatLng(37.61367,127.09944),
		new kakao.maps.LatLng(37.61356,127.09967),
		new kakao.maps.LatLng(37.61342,127.09987),
		new kakao.maps.LatLng(37.61323,127.09997),
		new kakao.maps.LatLng(37.61308,127.10013),
		new kakao.maps.LatLng(37.61305,127.10036),
		new kakao.maps.LatLng(37.61307,127.10063),
		new kakao.maps.LatLng(37.6131,127.10087),
		new kakao.maps.LatLng(37.6131,127.10112),
		new kakao.maps.LatLng(37.61288,127.10114),
		new kakao.maps.LatLng(37.61283,127.10138),
		new kakao.maps.LatLng(37.61279,127.10162),
		new kakao.maps.LatLng(37.61274,127.10185),
		new kakao.maps.LatLng(37.61268,127.10211),
		new kakao.maps.LatLng(37.61258,127.1023),
		new kakao.maps.LatLng(37.6125,127.10253),
		new kakao.maps.LatLng(37.61244,127.10275),
		new kakao.maps.LatLng(37.61237,127.10302),
		new kakao.maps.LatLng(37.61239,127.10328),
		new kakao.maps.LatLng(37.61231,127.10352),
		new kakao.maps.LatLng(37.61217,127.10373),
		new kakao.maps.LatLng(37.61205,127.10391),
		new kakao.maps.LatLng(37.612,127.10415),
		new kakao.maps.LatLng(37.61195,127.10439),
		new kakao.maps.LatLng(37.61192,127.10462),
		new kakao.maps.LatLng(37.61185,127.10488),
		new kakao.maps.LatLng(37.61179,127.10513),
		new kakao.maps.LatLng(37.6117,127.10534),
		new kakao.maps.LatLng(37.61162,127.10554),
		new kakao.maps.LatLng(37.61154,127.10575),
		new kakao.maps.LatLng(37.61146,127.10599),
		new kakao.maps.LatLng(37.61138,127.10622),
		new kakao.maps.LatLng(37.61129,127.10643),
		new kakao.maps.LatLng(37.61118,127.10662),
		new kakao.maps.LatLng(37.61107,127.10682),
		new kakao.maps.LatLng(37.61097,127.10702),
		new kakao.maps.LatLng(37.61084,127.10723),
		new kakao.maps.LatLng(37.61074,127.10743),
		new kakao.maps.LatLng(37.61062,127.10762),
		new kakao.maps.LatLng(37.61045,127.10753),
		new kakao.maps.LatLng(37.61027,127.10742),
		new kakao.maps.LatLng(37.6101,127.10732),
		new kakao.maps.LatLng(37.60994,127.10721),
		new kakao.maps.LatLng(37.60978,127.10708),
		new kakao.maps.LatLng(37.60963,127.10692),
		new kakao.maps.LatLng(37.60946,127.10678),
		new kakao.maps.LatLng(37.60932,127.10662),
		new kakao.maps.LatLng(37.60917,127.1065),
		new kakao.maps.LatLng(37.60902,127.10635),
		new kakao.maps.LatLng(37.60884,127.10618),
		new kakao.maps.LatLng(37.60869,127.10602),
		new kakao.maps.LatLng(37.60855,127.10588),
		new kakao.maps.LatLng(37.60839,127.10572),
		new kakao.maps.LatLng(37.60821,127.10559),
		new kakao.maps.LatLng(37.60802,127.10553),
		new kakao.maps.LatLng(37.60781,127.1055),
		new kakao.maps.LatLng(37.60762,127.10551),
		new kakao.maps.LatLng(37.60745,127.10558),
		new kakao.maps.LatLng(37.60725,127.10567),
		new kakao.maps.LatLng(37.60705,127.10566),
		new kakao.maps.LatLng(37.60685,127.10568),
		new kakao.maps.LatLng(37.60667,127.10576),
		new kakao.maps.LatLng(37.60649,127.10583),
		new kakao.maps.LatLng(37.60631,127.10591),
		new kakao.maps.LatLng(37.60613,127.1059),
		new kakao.maps.LatLng(37.60595,127.106),
		new kakao.maps.LatLng(37.60577,127.10611),
		new kakao.maps.LatLng(37.60592,127.10625),
		new kakao.maps.LatLng(37.60606,127.10641),
		new kakao.maps.LatLng(37.6062,127.10661),
		new kakao.maps.LatLng(37.60623,127.10684),
		new kakao.maps.LatLng(37.60618,127.10708),
		new kakao.maps.LatLng(37.60607,127.10728),
		new kakao.maps.LatLng(37.60612,127.10751),
		new kakao.maps.LatLng(37.60627,127.10768),
		new kakao.maps.LatLng(37.60645,127.10785),
		new kakao.maps.LatLng(37.60632,127.10802),
		new kakao.maps.LatLng(37.60623,127.10822),
		new kakao.maps.LatLng(37.60604,127.1083),
		new kakao.maps.LatLng(37.60584,127.10835),
		new kakao.maps.LatLng(37.60566,127.10845),
		new kakao.maps.LatLng(37.60565,127.10868),
		new kakao.maps.LatLng(37.60573,127.10891),
		new kakao.maps.LatLng(37.60582,127.10911),
		new kakao.maps.LatLng(37.60588,127.10933),
		new kakao.maps.LatLng(37.60596,127.10957),
		new kakao.maps.LatLng(37.60596,127.10981),
		new kakao.maps.LatLng(37.60583,127.10997),
		new kakao.maps.LatLng(37.60564,127.10994),
		new kakao.maps.LatLng(37.60546,127.10987),
		new kakao.maps.LatLng(37.60528,127.1098),
		new kakao.maps.LatLng(37.60509,127.10986),
		new kakao.maps.LatLng(37.60489,127.1099),
		new kakao.maps.LatLng(37.60471,127.10992),
		new kakao.maps.LatLng(37.6046,127.10975),
		new kakao.maps.LatLng(37.60444,127.10963),
		new kakao.maps.LatLng(37.60427,127.10973),
		new kakao.maps.LatLng(37.60411,127.10985),
		new kakao.maps.LatLng(37.60399,127.11004),
		new kakao.maps.LatLng(37.60387,127.11023),
		new kakao.maps.LatLng(37.60378,127.11047),
		new kakao.maps.LatLng(37.60371,127.11069),
		new kakao.maps.LatLng(37.6036,127.11087),
		new kakao.maps.LatLng(37.6034,127.11096),
		new kakao.maps.LatLng(37.60334,127.1112),
		new kakao.maps.LatLng(37.6033,127.11143),
		new kakao.maps.LatLng(37.60311,127.11149),
		new kakao.maps.LatLng(37.60292,127.11148),
		new kakao.maps.LatLng(37.60277,127.11162),
		new kakao.maps.LatLng(37.60263,127.1118),
		new kakao.maps.LatLng(37.60248,127.11166),
		new kakao.maps.LatLng(37.60234,127.11149),
		new kakao.maps.LatLng(37.60219,127.11135),
		new kakao.maps.LatLng(37.602,127.11135),
		new kakao.maps.LatLng(37.60184,127.11145),
		new kakao.maps.LatLng(37.60167,127.11154),
		new kakao.maps.LatLng(37.60149,127.11151),
		new kakao.maps.LatLng(37.60129,127.11154),
		new kakao.maps.LatLng(37.6011,127.11152),
		new kakao.maps.LatLng(37.60094,127.11139),
		new kakao.maps.LatLng(37.60082,127.11119),
		new kakao.maps.LatLng(37.60072,127.11098),
		new kakao.maps.LatLng(37.60062,127.11079),
		new kakao.maps.LatLng(37.60059,127.11053),
		new kakao.maps.LatLng(37.60054,127.11029),
		new kakao.maps.LatLng(37.60047,127.11007),
		new kakao.maps.LatLng(37.6005,127.10982),
		new kakao.maps.LatLng(37.60051,127.10956),
		new kakao.maps.LatLng(37.60052,127.10933),
		new kakao.maps.LatLng(37.60056,127.10907),
		new kakao.maps.LatLng(37.60059,127.10884),
		new kakao.maps.LatLng(37.60059,127.1086),
		new kakao.maps.LatLng(37.6004,127.10861),
		new kakao.maps.LatLng(37.60033,127.10885),
		new kakao.maps.LatLng(37.60039,127.10907),
		new kakao.maps.LatLng(37.60041,127.1093),
		new kakao.maps.LatLng(37.60051,127.1095),
		new kakao.maps.LatLng(37.60056,127.10972),
		new kakao.maps.LatLng(37.60044,127.10994),
		new kakao.maps.LatLng(37.60036,127.11016),
		new kakao.maps.LatLng(37.6003,127.11041),
		new kakao.maps.LatLng(37.60024,127.11065),
		new kakao.maps.LatLng(37.60011,127.11081),
		new kakao.maps.LatLng(37.59993,127.11095),
		new kakao.maps.LatLng(37.59975,127.11102),
		new kakao.maps.LatLng(37.59955,127.11109),
		new kakao.maps.LatLng(37.59936,127.11104),
		new kakao.maps.LatLng(37.59917,127.11106),
		new kakao.maps.LatLng(37.59897,127.11108),
		new kakao.maps.LatLng(37.5988,127.11121),
		new kakao.maps.LatLng(37.59862,127.11129),
		new kakao.maps.LatLng(37.59878,127.11143),
		new kakao.maps.LatLng(37.59882,127.11168),
		new kakao.maps.LatLng(37.59882,127.11191),
		new kakao.maps.LatLng(37.5987,127.11209),
		new kakao.maps.LatLng(37.5986,127.1123),
		new kakao.maps.LatLng(37.5986,127.11252),
		new kakao.maps.LatLng(37.59851,127.11274),
		new kakao.maps.LatLng(37.5986,127.11294),
		new kakao.maps.LatLng(37.59862,127.11317),
		new kakao.maps.LatLng(37.59862,127.1134),
		new kakao.maps.LatLng(37.59865,127.11362),
		new kakao.maps.LatLng(37.59876,127.11382),
		new kakao.maps.LatLng(37.59885,127.11403),
		new kakao.maps.LatLng(37.5988,127.11429),
		new kakao.maps.LatLng(37.59865,127.11444),
		new kakao.maps.LatLng(37.59848,127.11458),
		new kakao.maps.LatLng(37.59831,127.11464),
		new kakao.maps.LatLng(37.59814,127.11478),
		new kakao.maps.LatLng(37.598,127.11494),
		new kakao.maps.LatLng(37.59786,127.11509),
		new kakao.maps.LatLng(37.59781,127.11531),
		new kakao.maps.LatLng(37.59778,127.11554),
		new kakao.maps.LatLng(37.59769,127.11574),
		new kakao.maps.LatLng(37.59757,127.11593),
		new kakao.maps.LatLng(37.59746,127.11612),
		new kakao.maps.LatLng(37.59729,127.11621),
		new kakao.maps.LatLng(37.59716,127.11638),
		new kakao.maps.LatLng(37.59701,127.11651),
		new kakao.maps.LatLng(37.59688,127.11667),
		new kakao.maps.LatLng(37.59678,127.11689),
		new kakao.maps.LatLng(37.59661,127.117),
		new kakao.maps.LatLng(37.59643,127.11706),
		new kakao.maps.LatLng(37.59624,127.11708),
		new kakao.maps.LatLng(37.59606,127.11707),
		new kakao.maps.LatLng(37.59588,127.11698),
		new kakao.maps.LatLng(37.59569,127.11703),
		new kakao.maps.LatLng(37.59555,127.11686),
		new kakao.maps.LatLng(37.59541,127.11672),
		new kakao.maps.LatLng(37.59522,127.11667),
		new kakao.maps.LatLng(37.59503,127.11662),
		new kakao.maps.LatLng(37.59486,127.11665),
		new kakao.maps.LatLng(37.59468,127.11656),
		new kakao.maps.LatLng(37.59453,127.11643),
		new kakao.maps.LatLng(37.59438,127.11659),
		new kakao.maps.LatLng(37.59423,127.11644),
		new kakao.maps.LatLng(37.59406,127.1165),
		new kakao.maps.LatLng(37.59387,127.11642),
		new kakao.maps.LatLng(37.59389,127.11618),
		new kakao.maps.LatLng(37.59375,127.11603),
		new kakao.maps.LatLng(37.59361,127.11583),
		new kakao.maps.LatLng(37.59351,127.11564),
		new kakao.maps.LatLng(37.59339,127.11543),
		new kakao.maps.LatLng(37.59334,127.1152),
		new kakao.maps.LatLng(37.59336,127.11497),
		new kakao.maps.LatLng(37.5934,127.11472),
		new kakao.maps.LatLng(37.59339,127.11448),
		new kakao.maps.LatLng(37.59338,127.11424),
		new kakao.maps.LatLng(37.59337,127.11399),
		new kakao.maps.LatLng(37.59332,127.11377),
		new kakao.maps.LatLng(37.59335,127.11353),
		new kakao.maps.LatLng(37.59333,127.11328),
		new kakao.maps.LatLng(37.59316,127.11318),
		new kakao.maps.LatLng(37.59301,127.11303),
		new kakao.maps.LatLng(37.59283,127.113),
		new kakao.maps.LatLng(37.59263,127.11298),
		new kakao.maps.LatLng(37.59244,127.11298),
		new kakao.maps.LatLng(37.59225,127.11293),
		new kakao.maps.LatLng(37.5921,127.11276),
		new kakao.maps.LatLng(37.59194,127.1126),
		new kakao.maps.LatLng(37.59177,127.11253),
		new kakao.maps.LatLng(37.59173,127.11229),
		new kakao.maps.LatLng(37.59155,127.11237),
		new kakao.maps.LatLng(37.59139,127.11224),
		new kakao.maps.LatLng(37.59127,127.11206),
		new kakao.maps.LatLng(37.5911,127.1119),
		new kakao.maps.LatLng(37.59095,127.11179),
		new kakao.maps.LatLng(37.5908,127.11164),
		new kakao.maps.LatLng(37.59062,127.11159),
		new kakao.maps.LatLng(37.59046,127.11145),
		new kakao.maps.LatLng(37.59033,127.11131),
		new kakao.maps.LatLng(37.59015,127.11124),
		new kakao.maps.LatLng(37.58998,127.1111),
		new kakao.maps.LatLng(37.5898,127.1112),
		new kakao.maps.LatLng(37.58964,127.11106),
		new kakao.maps.LatLng(37.58946,127.11097),
		new kakao.maps.LatLng(37.58936,127.11077),
		new kakao.maps.LatLng(37.58919,127.11066),
		new kakao.maps.LatLng(37.58902,127.11056),
		new kakao.maps.LatLng(37.58883,127.11052),
		new kakao.maps.LatLng(37.58863,127.1105),
		new kakao.maps.LatLng(37.58845,127.1104),
		new kakao.maps.LatLng(37.58826,127.11033),
		new kakao.maps.LatLng(37.58806,127.11029),
		new kakao.maps.LatLng(37.58788,127.11038),
		new kakao.maps.LatLng(37.5877,127.11043),
		new kakao.maps.LatLng(37.58754,127.1103),
		new kakao.maps.LatLng(37.58737,127.11017),
		new kakao.maps.LatLng(37.58717,127.11015),
		new kakao.maps.LatLng(37.58699,127.11005),
		new kakao.maps.LatLng(37.58678,127.11012),
		new kakao.maps.LatLng(37.58659,127.11015),
		new kakao.maps.LatLng(37.5864,127.11013),
		new kakao.maps.LatLng(37.58621,127.11006),
		new kakao.maps.LatLng(37.58603,127.11002),
		new kakao.maps.LatLng(37.58584,127.10995),
		new kakao.maps.LatLng(37.58567,127.10988),
		new kakao.maps.LatLng(37.58551,127.10977),
		new kakao.maps.LatLng(37.58533,127.10972),
		new kakao.maps.LatLng(37.58515,127.10968),
		new kakao.maps.LatLng(37.58499,127.10957),
		new kakao.maps.LatLng(37.58482,127.10947),
		new kakao.maps.LatLng(37.58464,127.10939),
		new kakao.maps.LatLng(37.58447,127.10927),
		new kakao.maps.LatLng(37.58428,127.10923),
		new kakao.maps.LatLng(37.58409,127.10919),
		new kakao.maps.LatLng(37.58389,127.10919),
		new kakao.maps.LatLng(37.5837,127.10919),
		new kakao.maps.LatLng(37.5835,127.10917),
		new kakao.maps.LatLng(37.58331,127.10917),
		new kakao.maps.LatLng(37.58328,127.10891),
		new kakao.maps.LatLng(37.58321,127.10868),
		new kakao.maps.LatLng(37.58317,127.10845),
		new kakao.maps.LatLng(37.58316,127.1082),
		new kakao.maps.LatLng(37.58305,127.10798),
		new kakao.maps.LatLng(37.58295,127.10777),
		new kakao.maps.LatLng(37.58282,127.10757),
		new kakao.maps.LatLng(37.58264,127.10742),
		new kakao.maps.LatLng(37.58248,127.10724),
		new kakao.maps.LatLng(37.58238,127.10704),
		new kakao.maps.LatLng(37.58228,127.10686),
		new kakao.maps.LatLng(37.58226,127.10662),
		new kakao.maps.LatLng(37.58208,127.10651),
		new kakao.maps.LatLng(37.58202,127.10625),
		new kakao.maps.LatLng(37.582,127.10598),
		new kakao.maps.LatLng(37.58198,127.10573),
		new kakao.maps.LatLng(37.58187,127.10552),
		new kakao.maps.LatLng(37.58177,127.10528),
		new kakao.maps.LatLng(37.58168,127.10507),
		new kakao.maps.LatLng(37.58156,127.10488),
		new kakao.maps.LatLng(37.5814,127.10471),
		new kakao.maps.LatLng(37.58129,127.10451),
		new kakao.maps.LatLng(37.58117,127.10433),
		new kakao.maps.LatLng(37.58104,127.10416),
		new kakao.maps.LatLng(37.5809,127.104),
		new kakao.maps.LatLng(37.58077,127.10384),
		new kakao.maps.LatLng(37.58062,127.1037),
		new kakao.maps.LatLng(37.58045,127.10359),
		new kakao.maps.LatLng(37.58036,127.10338),
		new kakao.maps.LatLng(37.5802,127.10322),
		new kakao.maps.LatLng(37.58001,127.10312),
		new kakao.maps.LatLng(37.57983,127.10314),
		new kakao.maps.LatLng(37.57964,127.10318),
		new kakao.maps.LatLng(37.57944,127.10321),
		new kakao.maps.LatLng(37.57926,127.10332),
		new kakao.maps.LatLng(37.57907,127.10328),
		new kakao.maps.LatLng(37.5789,127.10324),
		new kakao.maps.LatLng(37.57874,127.10311),
		new kakao.maps.LatLng(37.57857,127.103),
		new kakao.maps.LatLng(37.57843,127.10286),
		new kakao.maps.LatLng(37.57831,127.10267),
		new kakao.maps.LatLng(37.57816,127.10253),
		new kakao.maps.LatLng(37.57799,127.10244),
		new kakao.maps.LatLng(37.57785,127.10229),
		new kakao.maps.LatLng(37.57772,127.10214),
		new kakao.maps.LatLng(37.57753,127.10212),
		new kakao.maps.LatLng(37.57734,127.1021),
		new kakao.maps.LatLng(37.57717,127.10203),
		new kakao.maps.LatLng(37.57701,127.10191),
		new kakao.maps.LatLng(37.57683,127.10184),
		new kakao.maps.LatLng(37.57664,127.1018),
		new kakao.maps.LatLng(37.57647,127.10173),
		new kakao.maps.LatLng(37.57635,127.10153),
		new kakao.maps.LatLng(37.57618,127.10141),
		new kakao.maps.LatLng(37.57601,127.10136),
		new kakao.maps.LatLng(37.57598,127.10113),
		new kakao.maps.LatLng(37.5758,127.10113),
		new kakao.maps.LatLng(37.57562,127.10106),
		new kakao.maps.LatLng(37.57543,127.10109),
		new kakao.maps.LatLng(37.57524,127.10117),
		new kakao.maps.LatLng(37.57504,127.10122),
		new kakao.maps.LatLng(37.57485,127.10126),
		new kakao.maps.LatLng(37.57467,127.10124),
		new kakao.maps.LatLng(37.57449,127.1012),
		new kakao.maps.LatLng(37.57431,127.1011),
		new kakao.maps.LatLng(37.57418,127.10093),
		new kakao.maps.LatLng(37.57398,127.10094),
		new kakao.maps.LatLng(37.57382,127.10105),
		new kakao.maps.LatLng(37.57363,127.10098),
		new kakao.maps.LatLng(37.57344,127.10089),
		new kakao.maps.LatLng(37.57336,127.10068),
		new kakao.maps.LatLng(37.57322,127.10051),
		new kakao.maps.LatLng(37.57306,127.10038),
		new kakao.maps.LatLng(37.57292,127.10021),
		new kakao.maps.LatLng(37.57281,127.10001),
		new kakao.maps.LatLng(37.57273,127.0998),
		new kakao.maps.LatLng(37.57257,127.09968),
		new kakao.maps.LatLng(37.57245,127.09948),
		new kakao.maps.LatLng(37.57252,127.09926),
		new kakao.maps.LatLng(37.57254,127.09903),
		new kakao.maps.LatLng(37.57251,127.0988),
		new kakao.maps.LatLng(37.57246,127.09856),
		new kakao.maps.LatLng(37.57234,127.09839),
		new kakao.maps.LatLng(37.57221,127.09822),
		new kakao.maps.LatLng(37.57207,127.09808),
		new kakao.maps.LatLng(37.57196,127.09786),
		new kakao.maps.LatLng(37.57189,127.09764),
		new kakao.maps.LatLng(37.57181,127.09742),
		new kakao.maps.LatLng(37.57167,127.09724),
		new kakao.maps.LatLng(37.57156,127.09704),
		new kakao.maps.LatLng(37.57145,127.09687),
		new kakao.maps.LatLng(37.57135,127.09667),
		new kakao.maps.LatLng(37.57123,127.09646),
		new kakao.maps.LatLng(37.57111,127.09627),
		new kakao.maps.LatLng(37.57109,127.09605),
		new kakao.maps.LatLng(37.57115,127.09582),
		new kakao.maps.LatLng(37.57129,127.09567),
		new kakao.maps.LatLng(37.57117,127.09585),
		new kakao.maps.LatLng(37.57114,127.09608),
		new kakao.maps.LatLng(37.57112,127.09631),
		new kakao.maps.LatLng(37.57126,127.09649),
		new kakao.maps.LatLng(37.57137,127.09668),
		new kakao.maps.LatLng(37.57147,127.09687),
		new kakao.maps.LatLng(37.5716,127.09705),
		new kakao.maps.LatLng(37.57173,127.09722),
		new kakao.maps.LatLng(37.57185,127.09739),
		new kakao.maps.LatLng(37.57192,127.09762),
		new kakao.maps.LatLng(37.57199,127.09784),
		new kakao.maps.LatLng(37.57204,127.09806),
		new kakao.maps.LatLng(37.5722,127.0982),
		new kakao.maps.LatLng(37.57235,127.09835),
		new kakao.maps.LatLng(37.57247,127.09854),
		new kakao.maps.LatLng(37.57255,127.09875),
		new kakao.maps.LatLng(37.57257,127.099),
		new kakao.maps.LatLng(37.57251,127.09923),
		new kakao.maps.LatLng(37.57247,127.09947),
		new kakao.maps.LatLng(37.57256,127.09969),
		new kakao.maps.LatLng(37.57272,127.0998),
		new kakao.maps.LatLng(37.57287,127.09996),
		new kakao.maps.LatLng(37.57298,127.10015),
		new kakao.maps.LatLng(37.57303,127.10038),
		new kakao.maps.LatLng(37.57306,127.10062),
		new kakao.maps.LatLng(37.57303,127.10087),
		new kakao.maps.LatLng(37.57299,127.1011),
		new kakao.maps.LatLng(37.57286,127.10126),
		new kakao.maps.LatLng(37.57295,127.10147),
		new kakao.maps.LatLng(37.57279,127.10157),
		new kakao.maps.LatLng(37.57271,127.10178),
		new kakao.maps.LatLng(37.57259,127.10196),
		new kakao.maps.LatLng(37.57242,127.10205),
		new kakao.maps.LatLng(37.57238,127.10229),
		new kakao.maps.LatLng(37.57231,127.10251),
		new kakao.maps.LatLng(37.57229,127.10274),
		new kakao.maps.LatLng(37.57237,127.10295),
		new kakao.maps.LatLng(37.57229,127.10316),
		new kakao.maps.LatLng(37.57213,127.10327),
		new kakao.maps.LatLng(37.57204,127.10348),
		new kakao.maps.LatLng(37.57195,127.10369),
		new kakao.maps.LatLng(37.5718,127.10384),
		new kakao.maps.LatLng(37.57163,127.10391),
		new kakao.maps.LatLng(37.57157,127.10413),
		new kakao.maps.LatLng(37.57147,127.10433),
		new kakao.maps.LatLng(37.5713,127.10442),
		new kakao.maps.LatLng(37.57118,127.10425),
		new kakao.maps.LatLng(37.57102,127.1041),
		new kakao.maps.LatLng(37.57092,127.1039),
		new kakao.maps.LatLng(37.57073,127.10384),
		new kakao.maps.LatLng(37.57055,127.10391),
		new kakao.maps.LatLng(37.57037,127.10382),
		new kakao.maps.LatLng(37.57024,127.10366),
		new kakao.maps.LatLng(37.57013,127.10346),
		new kakao.maps.LatLng(37.56995,127.10348),
		new kakao.maps.LatLng(37.56977,127.1034),
		new kakao.maps.LatLng(37.56959,127.10341),
		new kakao.maps.LatLng(37.56942,127.10331),
		new kakao.maps.LatLng(37.5692,127.10332),
		new kakao.maps.LatLng(37.56901,127.10328),
		new kakao.maps.LatLng(37.56883,127.10327),
		new kakao.maps.LatLng(37.56865,127.10322),
		new kakao.maps.LatLng(37.56845,127.10322),
		new kakao.maps.LatLng(37.56826,127.1032),
		new kakao.maps.LatLng(37.56808,127.10311),
		new kakao.maps.LatLng(37.56791,127.10306),
		new kakao.maps.LatLng(37.56774,127.10297),
		new kakao.maps.LatLng(37.56753,127.1029),
		new kakao.maps.LatLng(37.56737,127.1028),
		new kakao.maps.LatLng(37.56717,127.10275),
		new kakao.maps.LatLng(37.56693,127.10279),
		new kakao.maps.LatLng(37.56673,127.10282),
		new kakao.maps.LatLng(37.56653,127.10279),
		new kakao.maps.LatLng(37.56636,127.10269),
		new kakao.maps.LatLng(37.56616,127.10267),
		new kakao.maps.LatLng(37.56597,127.10264),
		new kakao.maps.LatLng(37.56579,127.10259),
		new kakao.maps.LatLng(37.56559,127.10259),
		new kakao.maps.LatLng(37.5654,127.1026),
		new kakao.maps.LatLng(37.56529,127.1024),
		new kakao.maps.LatLng(37.5651,127.10232),
		new kakao.maps.LatLng(37.56493,127.10238),
		new kakao.maps.LatLng(37.56475,127.10242),
		new kakao.maps.LatLng(37.56456,127.10241),
		new kakao.maps.LatLng(37.56438,127.10235),
		new kakao.maps.LatLng(37.56423,127.10221),
		new kakao.maps.LatLng(37.56406,127.10209),
		new kakao.maps.LatLng(37.56391,127.10195),
		new kakao.maps.LatLng(37.56372,127.102),
		new kakao.maps.LatLng(37.56357,127.10188),
		new kakao.maps.LatLng(37.56339,127.10176),
		new kakao.maps.LatLng(37.5632,127.10178),
		new kakao.maps.LatLng(37.56301,127.10182),
		new kakao.maps.LatLng(37.56283,127.10188),
		new kakao.maps.LatLng(37.56265,127.10187),
		new kakao.maps.LatLng(37.5625,127.1017),
		new kakao.maps.LatLng(37.56231,127.10166),
		new kakao.maps.LatLng(37.56216,127.10154),
		new kakao.maps.LatLng(37.56197,127.10146),
		new kakao.maps.LatLng(37.56178,127.10139),
		new kakao.maps.LatLng(37.56158,127.10139),
		new kakao.maps.LatLng(37.56138,127.1014),
		new kakao.maps.LatLng(37.56121,127.1015),
		new kakao.maps.LatLng(37.56102,127.10148),
		new kakao.maps.LatLng(37.56084,127.10151),
		new kakao.maps.LatLng(37.56067,127.10141),
		new kakao.maps.LatLng(37.56049,127.10147),
		new kakao.maps.LatLng(37.5603,127.1014),
		new kakao.maps.LatLng(37.56011,127.10152),
		new kakao.maps.LatLng(37.55994,127.10146),
		new kakao.maps.LatLng(37.55976,127.10155),
		new kakao.maps.LatLng(37.55959,127.1016),
		new kakao.maps.LatLng(37.55946,127.10177),
		new kakao.maps.LatLng(37.55936,127.10198),
		new kakao.maps.LatLng(37.55921,127.10214),
		new kakao.maps.LatLng(37.55912,127.10234),
		new kakao.maps.LatLng(37.559,127.10252),
		new kakao.maps.LatLng(37.55885,127.10264),
		new kakao.maps.LatLng(37.55873,127.10283),
		new kakao.maps.LatLng(37.55868,127.10308),
		new kakao.maps.LatLng(37.55855,127.10326),
		new kakao.maps.LatLng(37.55843,127.10342),
		new kakao.maps.LatLng(37.55829,127.10359),
		new kakao.maps.LatLng(37.55815,127.10376),
		new kakao.maps.LatLng(37.55799,127.10389),
		new kakao.maps.LatLng(37.55785,127.10404),
		new kakao.maps.LatLng(37.5577,127.10418),
		new kakao.maps.LatLng(37.55753,127.10426),
		new kakao.maps.LatLng(37.55735,127.10431),
		new kakao.maps.LatLng(37.55718,127.10441),
		new kakao.maps.LatLng(37.55699,127.10444),
		new kakao.maps.LatLng(37.5568,127.10448),
		new kakao.maps.LatLng(37.5566,127.10449),
		new kakao.maps.LatLng(37.55641,127.10448),
		new kakao.maps.LatLng(37.55621,127.10449),
		new kakao.maps.LatLng(37.55601,127.1045),
		new kakao.maps.LatLng(37.55584,127.10443),
		new kakao.maps.LatLng(37.55565,127.10436),
		new kakao.maps.LatLng(37.55546,127.10433),
		new kakao.maps.LatLng(37.55529,127.10426),
		new kakao.maps.LatLng(37.55511,127.1042),
		new kakao.maps.LatLng(37.55494,127.10409),
		new kakao.maps.LatLng(37.5548,127.10393),
		new kakao.maps.LatLng(37.55469,127.10375),
		new kakao.maps.LatLng(37.5546,127.10354),
		new kakao.maps.LatLng(37.55442,127.10343),
		new kakao.maps.LatLng(37.55424,127.10336),
		new kakao.maps.LatLng(37.55409,127.10324),
		new kakao.maps.LatLng(37.5539,127.10319),
		new kakao.maps.LatLng(37.55389,127.10296),
		new kakao.maps.LatLng(37.55382,127.10275),
		new kakao.maps.LatLng(37.55371,127.10256),
		new kakao.maps.LatLng(37.55359,127.10239),
		new kakao.maps.LatLng(37.55345,127.10222),
		new kakao.maps.LatLng(37.5533,127.10208),
		new kakao.maps.LatLng(37.55335,127.10183),
		new kakao.maps.LatLng(37.55345,127.1016),
		new kakao.maps.LatLng(37.55339,127.10137),
		new kakao.maps.LatLng(37.55333,127.10114),
		new kakao.maps.LatLng(37.55332,127.10091),
		new kakao.maps.LatLng(37.55321,127.10072),
		new kakao.maps.LatLng(37.55319,127.10049),
		new kakao.maps.LatLng(37.55322,127.10025),
		new kakao.maps.LatLng(37.55317,127.10003),
		new kakao.maps.LatLng(37.55307,127.09983),
		new kakao.maps.LatLng(37.55288,127.09974),
		new kakao.maps.LatLng(37.55271,127.09967),
		new kakao.maps.LatLng(37.55254,127.09974),
		new kakao.maps.LatLng(37.55236,127.09984),
		new kakao.maps.LatLng(37.55221,127.09997),
		new kakao.maps.LatLng(37.55202,127.09994),
		new kakao.maps.LatLng(37.55184,127.10006),
		new kakao.maps.LatLng(37.55176,127.10026),
		new kakao.maps.LatLng(37.5516,127.10042),
		new kakao.maps.LatLng(37.55145,127.10056),
		new kakao.maps.LatLng(37.55128,127.1007),
		new kakao.maps.LatLng(37.55111,127.10081),
		new kakao.maps.LatLng(37.55096,127.10095),
		new kakao.maps.LatLng(37.55078,127.101),
		new kakao.maps.LatLng(37.5506,127.10099),
		new kakao.maps.LatLng(37.55054,127.10122),
		new kakao.maps.LatLng(37.55035,127.10118),
		new kakao.maps.LatLng(37.55015,127.1012),
		new kakao.maps.LatLng(37.54997,127.10109),
		new kakao.maps.LatLng(37.54979,127.10117),
		new kakao.maps.LatLng(37.5496,127.10113),
		new kakao.maps.LatLng(37.54942,127.10119),
		new kakao.maps.LatLng(37.54924,127.10126),
		new kakao.maps.LatLng(37.54908,127.1014),
		new kakao.maps.LatLng(37.54892,127.10152),
		new kakao.maps.LatLng(37.54873,127.10161),
		new kakao.maps.LatLng(37.54867,127.10185),
		new kakao.maps.LatLng(37.54848,127.10195),
		new kakao.maps.LatLng(37.54829,127.10203),
		new kakao.maps.LatLng(37.54817,127.1022),
		new kakao.maps.LatLng(37.54798,127.10213),
		new kakao.maps.LatLng(37.5478,127.10211),
		new kakao.maps.LatLng(37.54759,127.10218),
		new kakao.maps.LatLng(37.54741,127.10225),
		new kakao.maps.LatLng(37.54724,127.10218),
		new kakao.maps.LatLng(37.54704,127.10224),
		new kakao.maps.LatLng(37.54685,127.10226),
		new kakao.maps.LatLng(37.54667,127.10216),
		new kakao.maps.LatLng(37.54646,127.10216),
		new kakao.maps.LatLng(37.54628,127.10231),
		new kakao.maps.LatLng(37.54612,127.10244),
		new kakao.maps.LatLng(37.54595,127.10249)
	];

	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#9F03C6', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
});
</script>
</html>