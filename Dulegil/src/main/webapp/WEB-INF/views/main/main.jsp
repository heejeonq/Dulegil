<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>메인</title>
 <script type="text/javascript">
$(document).ready(function (){
	var weatherIcon = {
	        '01' : 'wi-day-sunny',
	        '02' : 'wi-day-cloudy',
	        '03' : 'wi-cloud',
	        '04' : 'wi-cloudy',
	        '09' : 'wi-rain',
	        '10' : 'wi-rain',
	        '11' : 'wi-thunderstorm',
	        '13' : 'wi-snow',
	        '50' : 'wi-fog'
	    };
	//날씨온도
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=43090d11eab8a5ec7641ee64421fe73d&units=metric";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
	    success: function(resp) {
	    	var temp ="";
	        
	        
	        temp = Math.floor(resp.main.temp) + 'º';
	        var icon = (resp.weather[0].icon).substr(0,2);
	        $(".weather_now1").append(temp);
	    
	        $('.weather_now1').append('<img src="resources/images/' + weatherIcon[icon] + '.svg">');
	 
        
    }
});
	var apiURI = "http://openapi.seoul.go.kr:8088/646457596d6a737939337146634246/json/ListAvgOfSeoulAirQualityService/1/5/";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
	    success: function(data) {
	    	var pm10 = data.ListAvgOfSeoulAirQualityService.row[0].PM10 + "㎍/㎥<br>";
	    	var grade = data.ListAvgOfSeoulAirQualityService.row[0].GRADE;
	        console.log(data);
	       	console.log(data.ListAvgOfSeoulAirQualityService.row[0].PM10);
	       	$(".weather_now2").append(pm10);
	       	$(".weather_now2").append(grade);
	       	
	       	
        
    }
});
	
	
	//코스정보
	$.ajax({
		url: "resources/css/courseInfo.json", //경로
		type: "GET", //전송방식 (GET:주소형태, POST: 주소 헤더형태)
		dataType: "json",//데이터 형태
		success : function(res) { //성공했을 때 결과를 res에 받고 함수 실행

				$("[name='duleMap']").on("mouseover", "area", function(){
					for(var i=0; i<res.length; i++){
							if($(this).attr("title") == res[i].title){
								$(".course_no span").text(res[i].title);
								$("#courseDe").text(res[i].courseDe);
								$("#courseDis").text(res[i].courseDis);
								$("#courseTm").text(res[i].courseTm);
								$("#courseLvl").text(res[i].courseLvl);
								$("#courseP1").attr("src", "resources/images/" +res[i].courseP1 +".jpg");
								$("#courseP2").attr("src", "resources/images/" +res[i].courseP2 +".jpg");
								$("#courseP3").attr("src", "resources/images/" +res[i].courseP3 +".jpg");
								$(".map_line img").attr("src", "resources/images/" + (i+1) + "코스.png" );
						}
					} 
					
				});
				$("[name='duleMap']").on("mouseout", "area", function(){
					for(var i=0; i<res.length; i++){
						$(".map_line img").attr("src", "" );
					}
				});	
				
		
		}, 
		error : function(req, status, error){ // 실패했을 때 함수 실행
			console.log(request.responseText);// 실패 상세 내역
		
		}
	});
	
});
</script> 
</head>
<body>

	<!-- Header -->
	<c:import url="/header"></c:import>
 


	<!-- Container -->
	<div class="container">
   
         <div class="flowtxt">
            <MARQUEE  scrollamount="10" class="welcometxt">서울둘레길에 오신 것을 환영합니다!</MARQUEE>
         </div>
         
         
      <div class="weather">
      <div class="weather_now1">온도</div>
      <div class="weather_now2">미세먼지 <br></div>
      </div>
		<div class="map_area">
			<div class="map_img">
				<img alt="서울둘레길 지도" src="resources/images/map.png" usemap="#duleMap">
				<map name="duleMap">
				    <area target="" alt="1코스" title="1코스" href="course1" coords="542,87,562,58,602,78,646,110,633,168,633,224,591,135" shape="poly">
				    <area target="" alt="2코스" title="2코스" href="course2" coords="630,236,654,198,688,214,691,275,676,336,653,347,625,277" shape="poly">
				     <area target="" alt="3코스" title="3코스" href="course3" coords="717,348,677,345,675,316,728,292,782,309,780,358,770,409,760,454,723,492,689,517,678,476,721,381" shape="poly">
				    <area target="" alt="4코스" title="4코스" href="course4" coords="674,525,649,495,599,502,541,518,492,505,463,520,464,554,506,557,595,566" shape="poly">
				    <area target="" alt="5코스" title="5코스" href="course5" coords="445,553,441,505,395,515,348,528,316,557,320,596,399,579" shape="poly">
				    <area target="" alt="6코스" title="6코스" href="course6" coords="299,573,312,527,295,486,292,338,221,301,190,312,227,373,264,551" shape="poly">
				    <area target="" alt="7코스" title="7코스" href="course7" coords="242,297,190,280,227,248,267,253,279,187,288,145,304,174,327,212,307,299,260,299" shape="poly">
				    <area target="" alt="8코스" title="8코스" href="course8" coords="337,195,312,148,361,139,390,181,444,145,475,90,522,31,545,88,522,115,480,210,372,245" shape="poly">
				</map>
				<div class="map_line">
				<img src="" >
				</div>
				
			</div>
			<div class="map_info">
				<div class="course_no">
					<span>1코스</span>
				</div>
				<div class="course_txt">
					<dl>
						<div>
							<dt>코스 :</dt>
							<dd id="courseDe">수락·불암산코스</dd>
						</div>
						<div>
							<dt>길이 :</dt>
							<dd id="courseDis">18.6km</dd>
						</div>
						<div>
							<dt>예상 소요시간 :</dt>
							<dd id="courseTm">8시간 10분</dd>
						</div>
						<div>
							<dt>난이도 :</dt>
							<dd id="courseLvl">고급</dd>
						</div>
					</dl>
					<div class="mindul">
					<img alt="서울둘레길코스사진" src="resources/images/mindul.png" class="mindul2"/>
					</div>
				</div>
				<div class="photo">
				<img alt="서울둘레길코스사진" src="resources/images/course1a.jpg" class="cosP" id="courseP1"/>
				<img alt="서울둘레길코스사진" src="resources/images/course1b.jpg" class="cosP" id="courseP2"/>
				<img alt="서울둘레길코스사진" src="resources/images/course1c.jpg" class="cosP" id="courseP3"/>
				</div>
				<div class="photo1">
				<img alt="서울둘레길코스사진" src="resources/images/main_icon01.png" class="cosI"/>
				<img alt="서울둘레길코스사진" src="resources/images/main_icon02.png" class="cosI"/>
				<img alt="서울둘레길코스사진" src="resources/images/main_icon04.png" class="cosI"/>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>