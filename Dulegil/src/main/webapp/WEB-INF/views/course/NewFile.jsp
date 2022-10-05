<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/walk/css/StyleSheet.css">
<link rel="stylesheet" type="text/css" media="all" href="//www.seoul.go.kr/seoulgnb/seoul-common-gnb.css">
<title>서울둘레길 | 둘레길 코스</title>
<script type="text/javascript" src="https://weblog2.eseoul.go.kr/event/?ra=4BPGYE47Y07ASINRAEASJ9NE2CLI1221&amp;service_id=gil.seoul.go.kr&amp;pc_id=16547586250272849519163&amp;session_id=6CB032499726F3114C171724858529DB.node1&amp;screen=1920x1080&amp;language=ko-KR&amp;mode=&amp;referrer=https%3A%2F%2Fgil.seoul.go.kr%2Fwalk%2Fmain.jsp&amp;unique_info=%5B%7B%22code%22%3A%22PLUG%22%2C%20%22hsCode%22%3A%2299a88d21e10e959428879450d48ceeb1%22%7D%2C%20%7B%22code%22%3A%22UAGT%22%2C%20%22hsCode%22%3A%22620eeaccf0f03dc51ea5a9f1f3fb4360%22%7D%2C%20%7B%22code%22%3A%22SCRE%22%2C%20%22hsCode%22%3A%22572cda553fa9ac8d225f93d1bae76ab8%22%7D%5D&amp;e_url=https%3A%2F%2Fgil.seoul.go.kr%2Fwalk%2Fcourse%2Fdulae_gil.jsp%3Fc_idx%3D1%23detail&amp;e_title=%EC%84%9C%EC%9A%B8%EB%91%98%EB%A0%88%EA%B8%B8%20%7C%20%EB%91%98%EB%A0%88%EA%B8%B8%20%EC%BD%94%EC%8A%A4&amp;e_type=pageview&amp;END" charset="UTF-8"></script>
<script type="text/javascript" src="//weblog.eseoul.go.kr/wlo/js/AutoEvent.js?2022819" charset="utf-8"></script>
<script src="https://cdn-city.livere.com/js/embed.dist.js"></script>
<script type="text/javascript" src="//weblog.eseoul.go.kr/wlo/js/seetoc.js?2022819" charset="utf-8"></script>
<script type="text/javascript" src="//weblog.eseoul.go.kr/wlo/js/wl6.js?2022819" charset="utf-8"></script>
<script type="text/javascript" src="/walk/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/walk/js/js_sub.js"></script>
<script type="text/javascript" src="/walk/js/walk_search_nav.js"></script>
<script src="//www.seoul.go.kr/seoulgnb/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//weblog.eseoul.go.kr/wlo/js/install.js"></script>
<!-- 서울 GNB 스크립트 -->
<script type="text/javascript" src="//www.seoul.go.kr/seoulgnb/gnb.js"></script>
<script type="text/javascript">
//프린트 관련 스크립트 map영역
         var win=null;
       function print(printThis, printThis2)  
       {
              win = window.open();
              self.focus();
              win.document.open();
              win.document.write('<'+'!DOCTYPE html'+'>');
              win.document.write('<'+'html'+'><'+'head'+'><'+'link rel="stylesheet" href="/walk/css/StyleSheet.css"'+'><'+'link rel="stylesheet" href="/walk/css/sub.css"'+'><'+'style'+'>');
              win.document.write('body, td {font-size:12px;color:#666;line-height:170%;background:none;font-family: Verdana; font-size: 10pt;}');
              win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
              win.document.write('<'+'div class="course_detail_info" style="background:#fff;width:840px;margin:0 auto;padding:20px 0 0 0" id="course_detail_info"'+'>');
              win.document.write(printThis);
			  win.document.write(printThis2);
              win.document.write('<'+'/'+'div'+'><'+'/'+'body'+'><'+'/'+'html'+'>');
              win.document.close();
              win.print();
              win.close();
       }
</script>
<script type="text/javascript">
function fnDown_poster(num,divi){
	//alert("/common/download/fileDown_poster.jsp?num="+num+"&divi="+divi);
	document.getElementById("dnFrame").src="/common/download/fileDown_poster.jsp?num="+num+"&divi="+divi;
}
</script>
<script type="text/javascript"> /* 완주증 발급 현황 */
window.onload=function(){
	var compCnt=57338;
	$.ajax({
		type: "POST",
		url: "https://api.openweathermap.org/data/2.5/forecast/daily?callback=?&id=1835848&units=imperial&appid=4fcd1777e7302a260e1cfe0df9d614c8",
		crossDomain:true,
		dataType:"jsonp",
		success: function (data) {	
			
			$(".weather").html('완주증 발급 현황 : <span> '+compCnt+'명</span>&nbsp;&nbsp;&nbsp;&nbsp;서울특별시&nbsp;&nbsp;
			<img src="/walk/images/main/'+weather+'.png" alt='+imgAlt+' />&nbsp;&nbsp;
			'+temp+'℃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.facebook.com/seoultrail/?fref=ts" 
			target="_blank" title="서울둘레길 페이스북 새창열림"><img src="/walk/images/main/main_f.png" 
			alt="서울둘레길 페이스북 새창열림" /></a> 
	});
	
	Yjs.Gnb.init('G148', 'seoul-common-gnb');
}
</script>

<style type="text/css">
.titlebar{padding:15px 0}
#wrap #contents .section1 .title{text-align:left;padding-left:10px;line-height:15px}
.infowindow .window .top .right .sprite{background:#fff;}
.infowindow .window .top .right .user .titlebar .hide .sprite{display:none;}
.infowindow .window .top .right .user{position: absolute;background:#fff;border:2px solid #666;padding:0;}
.infowindow .window .top .right .user .layout{padding-left:0;margin:10px 0;}
.infowindow .window .top .right .user .titlebar .hide{position: absolute;top:5px;right:10px;width:21px;height:21px;overflow: hidden;background:url(/walk/images/btn_close.gif) no-repeat left top;cursor:pointer}
.infowindow .window .top .right .user .content{overflow:hidden}
.infowindow .window .top .right .user .content .img{float:left;display:block;width:154px;border:3px solid #2891c3;margin-left:10px}
.infowindow .window .top .right .user .content .img img{width:100%;vertical-align:top}
.infowindow .window .top .right .user .content .txt{position: relative;float: left;width: 205px;min-height: 63px;margin-left: 14px;padding-bottom: 40px;line-height:150%}
.infowindow .window .top .right .user .content .txt strong{font-weight:bold;color:#2a93c6;display:block;padding-bottom:10px}
.infowindow .window .top .right .user .content .txt .detail{position: absolute;bottom: 0;right: 0;}
.infowindow .pointer{display:none}
.infowindow .window .top .right .user .border{margin:0;}
.infowindow .window .bottom{display:none}
.course_map_include{position:relative}
.mirae{position:absolute;right:35px;top:0px;z-index:990}
.mirae button{background:url(/walk/images/btn_mirae.png) no-repeat left top;display:block;width:111px;height:26px;overflow:hidden;border:0;text-indent:-9999px;cursor:pointer}
.mirae button:hover{background-position:0 -26px}
.mirae button.on{background-position:0 -26px}
</style>
</head>
<body>
<div id="wrap" class="sub3">
	<!-- 완주증 발급 현황 -->
	<div id="header_w" class="main2"> 
		<div id="header">
			<div class="weather">완주증 발급 현황 : <span> 57338명</span></div>
		</div>
	</div>
	
	<div id="contents" class="sub">
		<div class="content full">
			<!-- 검색 시작 -->
			<script>
			$(document).ready(function(){
				if (1!=0){
					$("a[name=det]").trigger('click');
				}
			});
			</script>
			<iframe src="https://map.seoul.go.kr/smgis/short.jsp?p=6LBTL" width="942" height="600" title="서울의 역사, 문화, 자연생태를 탐방할 수 있는 서울둘레길에 대한 정보지도입니다."></iframe>
		</div>

		<script type="text/javascript" src="http://101.livere.co.kr/js/livere8_lib.js"></script>
		<div id="livereContainer">
			<script type="text/javascript">
				var consumer_seq 	= "328";
				var livere_seq 		= "15039";
				var smartlogin_seq 	= "365";
		
				var title = "1코스-수락·불암산코스";
				var refer = "gil.seoul.go.kr/walk/course/dulae_gil.jsp?c_idx=8";
		
				livereReply = new Livere( livere_seq , refer , title );
				livereLib.start();
			</script>
		</div>
	</div>
</div>
</body>
</html>