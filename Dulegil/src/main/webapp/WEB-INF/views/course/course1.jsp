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
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d38ddde2d7bb1d66146f9d2cdccedf3"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.6328206,127.0088088), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options);
	
	var linePath = [
		new kakao.maps.LatLng(37.68919,127.04679),
		new kakao.maps.LatLng(37.68927,127.047),
		new kakao.maps.LatLng(37.68916,127.04718),
		new kakao.maps.LatLng(37.6893,127.04732),
		new kakao.maps.LatLng(37.68943,127.0475),
		new kakao.maps.LatLng(37.68952,127.0477),
		new kakao.maps.LatLng(37.68952,127.04795),
		new kakao.maps.LatLng(37.68952,127.04818),
		new kakao.maps.LatLng(37.68954,127.04841),
		new kakao.maps.LatLng(37.68936,127.04844),
		new kakao.maps.LatLng(37.68919,127.04856),
		new kakao.maps.LatLng(37.68901,127.04848),
		new kakao.maps.LatLng(37.68883,127.04853),
		new kakao.maps.LatLng(37.68865,127.04853),
		new kakao.maps.LatLng(37.68883,127.04851),
		new kakao.maps.LatLng(37.68863,127.04854),
		new kakao.maps.LatLng(37.68845,127.04864),
		new kakao.maps.LatLng(37.68841,127.04887),
		new kakao.maps.LatLng(37.68824,127.049),
		new kakao.maps.LatLng(37.68822,127.04923),
		new kakao.maps.LatLng(37.68809,127.0494),
		new kakao.maps.LatLng(37.6879,127.04948),
		new kakao.maps.LatLng(37.68772,127.04956),
		new kakao.maps.LatLng(37.68754,127.04964),
		new kakao.maps.LatLng(37.68737,127.04978),
		new kakao.maps.LatLng(37.68721,127.0499),
		new kakao.maps.LatLng(37.68704,127.05001),
		new kakao.maps.LatLng(37.68687,127.05011),
		new kakao.maps.LatLng(37.68671,127.05023),
		new kakao.maps.LatLng(37.68654,127.05037),
		new kakao.maps.LatLng(37.68638,127.05051),
		new kakao.maps.LatLng(37.68635,127.05075),
		new kakao.maps.LatLng(37.68645,127.05098),
		new kakao.maps.LatLng(37.68654,127.05119),
		new kakao.maps.LatLng(37.68664,127.05143),
		new kakao.maps.LatLng(37.68675,127.05164),
		new kakao.maps.LatLng(37.68689,127.05185),
		new kakao.maps.LatLng(37.68705,127.05197),
		new kakao.maps.LatLng(37.68726,127.05204),
		new kakao.maps.LatLng(37.68745,127.05216),
		new kakao.maps.LatLng(37.68752,127.05238),
		new kakao.maps.LatLng(37.68763,127.05261),
		new kakao.maps.LatLng(37.68777,127.05276),
		new kakao.maps.LatLng(37.68795,127.05291),
		new kakao.maps.LatLng(37.68803,127.05312),
		new kakao.maps.LatLng(37.68813,127.05333),
		new kakao.maps.LatLng(37.68822,127.05353),
		new kakao.maps.LatLng(37.68829,127.05376),
		new kakao.maps.LatLng(37.68845,127.05393),
		new kakao.maps.LatLng(37.68857,127.05414),
		new kakao.maps.LatLng(37.68866,127.05438),
		new kakao.maps.LatLng(37.68879,127.05455),
		new kakao.maps.LatLng(37.68893,127.05475),
		new kakao.maps.LatLng(37.68903,127.05496),
		new kakao.maps.LatLng(37.68904,127.05519),
		new kakao.maps.LatLng(37.68904,127.05543),
		new kakao.maps.LatLng(37.68904,127.05566),
		new kakao.maps.LatLng(37.68907,127.05592),
		new kakao.maps.LatLng(37.68908,127.05617),
		new kakao.maps.LatLng(37.68911,127.0564),
		new kakao.maps.LatLng(37.68922,127.05658),
		new kakao.maps.LatLng(37.68938,127.05669),
		new kakao.maps.LatLng(37.68957,127.05666),
		new kakao.maps.LatLng(37.68961,127.05689),
		new kakao.maps.LatLng(37.68961,127.05712),
		new kakao.maps.LatLng(37.6896,127.05737),
		new kakao.maps.LatLng(37.68959,127.0576),
		new kakao.maps.LatLng(37.68966,127.05783),
		new kakao.maps.LatLng(37.68977,127.05804),
		new kakao.maps.LatLng(37.68986,127.05824),
		new kakao.maps.LatLng(37.68988,127.05848),
		new kakao.maps.LatLng(37.68975,127.05865),
		new kakao.maps.LatLng(37.68955,127.05865),
		new kakao.maps.LatLng(37.68939,127.05879),
		new kakao.maps.LatLng(37.68928,127.05898),
		new kakao.maps.LatLng(37.68919,127.05919),
		new kakao.maps.LatLng(37.68906,127.05936),
		new kakao.maps.LatLng(37.6889,127.05925),
		new kakao.maps.LatLng(37.68872,127.05925),
		new kakao.maps.LatLng(37.68856,127.05911),
		new kakao.maps.LatLng(37.68838,127.0591),
		new kakao.maps.LatLng(37.68828,127.0593),
		new kakao.maps.LatLng(37.6881,127.05937),
		new kakao.maps.LatLng(37.68792,127.0593),
		new kakao.maps.LatLng(37.68773,127.05923),
		new kakao.maps.LatLng(37.68753,127.05922),
		new kakao.maps.LatLng(37.68736,127.05912),
		new kakao.maps.LatLng(37.68718,127.05914),
		new kakao.maps.LatLng(37.68699,127.05907),
		new kakao.maps.LatLng(37.68682,127.05897),
		new kakao.maps.LatLng(37.68664,127.05895),
		new kakao.maps.LatLng(37.68644,127.0589),
		new kakao.maps.LatLng(37.68633,127.05869),
		new kakao.maps.LatLng(37.68633,127.05843),
		new kakao.maps.LatLng(37.68626,127.05822),
		new kakao.maps.LatLng(37.68612,127.05808),
		new kakao.maps.LatLng(37.68595,127.05795),
		new kakao.maps.LatLng(37.68577,127.05789),
		new kakao.maps.LatLng(37.68557,127.05798),
		new kakao.maps.LatLng(37.68538,127.05806),
		new kakao.maps.LatLng(37.68523,127.05819),
		new kakao.maps.LatLng(37.68506,127.05828),
		new kakao.maps.LatLng(37.68488,127.05826),
		new kakao.maps.LatLng(37.68469,127.05829),
		new kakao.maps.LatLng(37.6845,127.05835),
		new kakao.maps.LatLng(37.68435,127.05848),
		new kakao.maps.LatLng(37.68417,127.05844),
		new kakao.maps.LatLng(37.68398,127.05843),
		new kakao.maps.LatLng(37.68381,127.05829),
		new kakao.maps.LatLng(37.68363,127.05836),
		new kakao.maps.LatLng(37.68347,127.05846),
		new kakao.maps.LatLng(37.68329,127.05863),
		new kakao.maps.LatLng(37.68309,127.05863),
		new kakao.maps.LatLng(37.68295,127.05845),
		new kakao.maps.LatLng(37.68278,127.05848),
		new kakao.maps.LatLng(37.6826,127.0586),
		new kakao.maps.LatLng(37.68245,127.05875),
		new kakao.maps.LatLng(37.68228,127.05886),
		new kakao.maps.LatLng(37.68209,127.05883),
		new kakao.maps.LatLng(37.68201,127.05863),
		new kakao.maps.LatLng(37.68183,127.05857),
		new kakao.maps.LatLng(37.68167,127.05869),
		new kakao.maps.LatLng(37.68152,127.05885),
		new kakao.maps.LatLng(37.68133,127.05884),
		new kakao.maps.LatLng(37.68115,127.05887),
		new kakao.maps.LatLng(37.68099,127.05898),
		new kakao.maps.LatLng(37.68082,127.05892),
		new kakao.maps.LatLng(37.68069,127.05875),
		new kakao.maps.LatLng(37.68053,127.05862),
		new kakao.maps.LatLng(37.68033,127.05857),
		new kakao.maps.LatLng(37.68016,127.05866),
		new kakao.maps.LatLng(37.67997,127.0587),
		new kakao.maps.LatLng(37.67996,127.05895),
		new kakao.maps.LatLng(37.67994,127.0592),
		new kakao.maps.LatLng(37.68001,127.05942),
		new kakao.maps.LatLng(37.68002,127.05965),
		new kakao.maps.LatLng(37.68006,127.05987),
		new kakao.maps.LatLng(37.67989,127.05992),
		new kakao.maps.LatLng(37.67972,127.06001),
		new kakao.maps.LatLng(37.67954,127.06013),
		new kakao.maps.LatLng(37.67939,127.06028),
		new kakao.maps.LatLng(37.67926,127.06046),
		new kakao.maps.LatLng(37.67908,127.06057),
		new kakao.maps.LatLng(37.67894,127.06073),
		new kakao.maps.LatLng(37.67876,127.06074),
		new kakao.maps.LatLng(37.67857,127.06079),
		new kakao.maps.LatLng(37.67841,127.0607),
		new kakao.maps.LatLng(37.67822,127.06063),
		new kakao.maps.LatLng(37.67805,127.06053),
		new kakao.maps.LatLng(37.67793,127.06033),
		new kakao.maps.LatLng(37.67779,127.06017),
		new kakao.maps.LatLng(37.67773,127.05996),
		new kakao.maps.LatLng(37.67783,127.06017),
		new kakao.maps.LatLng(37.67789,127.06039),
		new kakao.maps.LatLng(37.67775,127.06052),
		new kakao.maps.LatLng(37.67755,127.06054),
		new kakao.maps.LatLng(37.67735,127.06055),
		new kakao.maps.LatLng(37.67721,127.06041),
		new kakao.maps.LatLng(37.67704,127.0603),
		new kakao.maps.LatLng(37.67685,127.06034),
		new kakao.maps.LatLng(37.67669,127.06025),
		new kakao.maps.LatLng(37.67651,127.06031),
		new kakao.maps.LatLng(37.67654,127.06054),
		new kakao.maps.LatLng(37.67643,127.06073),
		new kakao.maps.LatLng(37.67623,127.0608),
		new kakao.maps.LatLng(37.67606,127.06069),
		new kakao.maps.LatLng(37.67598,127.06091),
		new kakao.maps.LatLng(37.67598,127.06114),
		new kakao.maps.LatLng(37.67616,127.06123),
		new kakao.maps.LatLng(37.6763,127.0614),
		new kakao.maps.LatLng(37.67643,127.06157),
		new kakao.maps.LatLng(37.67626,127.0617),
		new kakao.maps.LatLng(37.67609,127.06179),
		new kakao.maps.LatLng(37.6759,127.06187),
		new kakao.maps.LatLng(37.67571,127.06194),
		new kakao.maps.LatLng(37.67556,127.06178),
		new kakao.maps.LatLng(37.67539,127.06167),
		new kakao.maps.LatLng(37.67521,127.06163),
		new kakao.maps.LatLng(37.67503,127.06167),
		new kakao.maps.LatLng(37.67497,127.06189),
		new kakao.maps.LatLng(37.675,127.06214),
		new kakao.maps.LatLng(37.67479,127.06215),
		new kakao.maps.LatLng(37.67464,127.062),
		new kakao.maps.LatLng(37.67447,127.06207),
		new kakao.maps.LatLng(37.6743,127.06224),
		new kakao.maps.LatLng(37.67415,127.06236),
		new kakao.maps.LatLng(37.67396,127.06237),
		new kakao.maps.LatLng(37.6738,127.06252),
		new kakao.maps.LatLng(37.67364,127.06262),
		new kakao.maps.LatLng(37.67349,127.06276),
		new kakao.maps.LatLng(37.67338,127.06297),
		new kakao.maps.LatLng(37.67331,127.06319),
		new kakao.maps.LatLng(37.67313,127.06327),
		new kakao.maps.LatLng(37.67296,127.06338),
		new kakao.maps.LatLng(37.67279,127.0633),
		new kakao.maps.LatLng(37.67266,127.06314),
		new kakao.maps.LatLng(37.6725,127.06303),
		new kakao.maps.LatLng(37.67235,127.06287),
		new kakao.maps.LatLng(37.67216,127.06288),
		new kakao.maps.LatLng(37.67198,127.06282),
		new kakao.maps.LatLng(37.6718,127.06286),
		new kakao.maps.LatLng(37.67162,127.0629),
		new kakao.maps.LatLng(37.67147,127.06304),
		new kakao.maps.LatLng(37.67129,127.06298),
		new kakao.maps.LatLng(37.67127,127.06274),
		new kakao.maps.LatLng(37.67122,127.06251),
		new kakao.maps.LatLng(37.67106,127.0626),
		new kakao.maps.LatLng(37.67091,127.06274),
		new kakao.maps.LatLng(37.67072,127.06276),
		new kakao.maps.LatLng(37.67054,127.06282),
		new kakao.maps.LatLng(37.67039,127.06297),
		new kakao.maps.LatLng(37.67024,127.0631),
		new kakao.maps.LatLng(37.67013,127.0633),
		new kakao.maps.LatLng(37.66994,127.06332),
		new kakao.maps.LatLng(37.66981,127.0635),
		new kakao.maps.LatLng(37.66969,127.06372),
		new kakao.maps.LatLng(37.6695,127.06369),
		new kakao.maps.LatLng(37.66949,127.06392),
		new kakao.maps.LatLng(37.66952,127.06417),
		new kakao.maps.LatLng(37.66954,127.06441),
		new kakao.maps.LatLng(37.66956,127.06464),
		new kakao.maps.LatLng(37.66941,127.0648),
		new kakao.maps.LatLng(37.66932,127.06501),
		new kakao.maps.LatLng(37.66931,127.06523),
		new kakao.maps.LatLng(37.6692,127.06543),
		new kakao.maps.LatLng(37.66915,127.06567),
		new kakao.maps.LatLng(37.6692,127.0659),
		new kakao.maps.LatLng(37.66921,127.06614),
		new kakao.maps.LatLng(37.66919,127.06636),
		new kakao.maps.LatLng(37.66922,127.06661),
		new kakao.maps.LatLng(37.66924,127.06684),
		new kakao.maps.LatLng(37.66942,127.06692),
		new kakao.maps.LatLng(37.66953,127.06712),
		new kakao.maps.LatLng(37.66969,127.06728),
		new kakao.maps.LatLng(37.66984,127.06743),
		new kakao.maps.LatLng(37.67002,127.06746),
		new kakao.maps.LatLng(37.67019,127.06735),
		new kakao.maps.LatLng(37.67035,127.06745),
		new kakao.maps.LatLng(37.67054,127.06751),
		new kakao.maps.LatLng(37.67072,127.06745),
		new kakao.maps.LatLng(37.6709,127.06742),
		new kakao.maps.LatLng(37.67108,127.06745),
		new kakao.maps.LatLng(37.67126,127.06742),
		new kakao.maps.LatLng(37.67141,127.06755),
		new kakao.maps.LatLng(37.6716,127.06757),
		new kakao.maps.LatLng(37.67177,127.06749),
		new kakao.maps.LatLng(37.67195,127.06741),
		new kakao.maps.LatLng(37.67178,127.0675),
		new kakao.maps.LatLng(37.67196,127.06738),
		new kakao.maps.LatLng(37.67214,127.06736),
		new kakao.maps.LatLng(37.67233,127.06737),
		new kakao.maps.LatLng(37.67238,127.06763),
		new kakao.maps.LatLng(37.67225,127.06781),
		new kakao.maps.LatLng(37.67223,127.06804),
		new kakao.maps.LatLng(37.67219,127.06826),
		new kakao.maps.LatLng(37.67213,127.06848),
		new kakao.maps.LatLng(37.6721,127.06872),
		new kakao.maps.LatLng(37.67226,127.06859),
		new kakao.maps.LatLng(37.67243,127.0687),
		new kakao.maps.LatLng(37.67263,127.06875),
		new kakao.maps.LatLng(37.6728,127.06887),
		new kakao.maps.LatLng(37.67277,127.0691),
		new kakao.maps.LatLng(37.67275,127.06934),
		new kakao.maps.LatLng(37.67282,127.06956),
		new kakao.maps.LatLng(37.67295,127.06975),
		new kakao.maps.LatLng(37.67309,127.06989),
		new kakao.maps.LatLng(37.67315,127.0701),
		new kakao.maps.LatLng(37.67319,127.07034),
		new kakao.maps.LatLng(37.67312,127.07056),
		new kakao.maps.LatLng(37.67311,127.0708),
		new kakao.maps.LatLng(37.67305,127.07102),
		new kakao.maps.LatLng(37.67306,127.07125),
		new kakao.maps.LatLng(37.67308,127.0715),
		new kakao.maps.LatLng(37.6731,127.07173),
		new kakao.maps.LatLng(37.67312,127.07196),
		new kakao.maps.LatLng(37.67316,127.07218),
		new kakao.maps.LatLng(37.67309,127.07242),
		new kakao.maps.LatLng(37.67297,127.0726),
		new kakao.maps.LatLng(37.6728,127.07269),
		new kakao.maps.LatLng(37.67274,127.07292),
		new kakao.maps.LatLng(37.67283,127.07312),
		new kakao.maps.LatLng(37.67285,127.07335),
		new kakao.maps.LatLng(37.67287,127.07359),
		new kakao.maps.LatLng(37.67289,127.07382),
		new kakao.maps.LatLng(37.6729,127.07406),
		new kakao.maps.LatLng(37.67288,127.0743),
		new kakao.maps.LatLng(37.67272,127.07441),
		new kakao.maps.LatLng(37.67256,127.07454),
		new kakao.maps.LatLng(37.67242,127.0747),
		new kakao.maps.LatLng(37.67224,127.0747),
		new kakao.maps.LatLng(37.67206,127.07467),
		new kakao.maps.LatLng(37.67188,127.07467),
		new kakao.maps.LatLng(37.67168,127.07466),
		new kakao.maps.LatLng(37.67149,127.07467),
		new kakao.maps.LatLng(37.67131,127.07474),
		new kakao.maps.LatLng(37.67113,127.07476),
		new kakao.maps.LatLng(37.67102,127.07497),
		new kakao.maps.LatLng(37.67107,127.07519),
		new kakao.maps.LatLng(37.67109,127.07543),
		new kakao.maps.LatLng(37.67101,127.07565),
		new kakao.maps.LatLng(37.67104,127.07588),
		new kakao.maps.LatLng(37.67101,127.07611),
		new kakao.maps.LatLng(37.67099,127.07635),
		new kakao.maps.LatLng(37.67089,127.07655),
		new kakao.maps.LatLng(37.67079,127.07674),
		new kakao.maps.LatLng(37.67067,127.07692),
		new kakao.maps.LatLng(37.67049,127.077),
		new kakao.maps.LatLng(37.6703,127.07702),
		new kakao.maps.LatLng(37.6701,127.07706),
		new kakao.maps.LatLng(37.66991,127.07707),
		new kakao.maps.LatLng(37.66975,127.07721),
		new kakao.maps.LatLng(37.66957,127.07723),
		new kakao.maps.LatLng(37.66941,127.07738),
		new kakao.maps.LatLng(37.66926,127.07752),
		new kakao.maps.LatLng(37.66919,127.07775),
		new kakao.maps.LatLng(37.66925,127.07796),
		new kakao.maps.LatLng(37.66934,127.07819),
		new kakao.maps.LatLng(37.66952,127.07829),
		new kakao.maps.LatLng(37.66972,127.07839),
		new kakao.maps.LatLng(37.66989,127.07849),
		new kakao.maps.LatLng(37.67002,127.07869),
		new kakao.maps.LatLng(37.67003,127.07893),
		new kakao.maps.LatLng(37.6701,127.07915),
		new kakao.maps.LatLng(37.67027,127.0793),
		new kakao.maps.LatLng(37.6704,127.07947),
		new kakao.maps.LatLng(37.6705,127.07966),
		new kakao.maps.LatLng(37.67041,127.07997),
		new kakao.maps.LatLng(37.67059,127.07966),
		new kakao.maps.LatLng(37.67075,127.07982),
		new kakao.maps.LatLng(37.67076,127.08009),
		new kakao.maps.LatLng(37.67067,127.0803),
		new kakao.maps.LatLng(37.67065,127.08053),
		new kakao.maps.LatLng(37.67058,127.08076),
		new kakao.maps.LatLng(37.67043,127.0809),
		new kakao.maps.LatLng(37.67041,127.08113),
		new kakao.maps.LatLng(37.67022,127.08116),
		new kakao.maps.LatLng(37.67003,127.08123),
		new kakao.maps.LatLng(37.66998,127.08145),
		new kakao.maps.LatLng(37.66994,127.08168),
		new kakao.maps.LatLng(37.66998,127.08195),
		new kakao.maps.LatLng(37.66995,127.08219),
		new kakao.maps.LatLng(37.66991,127.08244),
		new kakao.maps.LatLng(37.66988,127.08269),
		new kakao.maps.LatLng(37.66996,127.08292),
		new kakao.maps.LatLng(37.66994,127.08316),
		new kakao.maps.LatLng(37.66975,127.08318),
		new kakao.maps.LatLng(37.66956,127.08319),
		new kakao.maps.LatLng(37.66937,127.08314),
		new kakao.maps.LatLng(37.66921,127.08305),
		new kakao.maps.LatLng(37.66904,127.08294),
		new kakao.maps.LatLng(37.66885,127.0829),
		new kakao.maps.LatLng(37.6688,127.08313),
		new kakao.maps.LatLng(37.66868,127.08332),
		new kakao.maps.LatLng(37.6686,127.08352),
		new kakao.maps.LatLng(37.66845,127.08368),
		new kakao.maps.LatLng(37.66827,127.08368),
		new kakao.maps.LatLng(37.66809,127.08356),
		new kakao.maps.LatLng(37.66791,127.08352),
		new kakao.maps.LatLng(37.66773,127.08347),
		new kakao.maps.LatLng(37.66756,127.08333),
		new kakao.maps.LatLng(37.66737,127.08333),
		new kakao.maps.LatLng(37.66725,127.08315),
		new kakao.maps.LatLng(37.66713,127.08332),
		new kakao.maps.LatLng(37.667,127.08352),
		new kakao.maps.LatLng(37.66682,127.08345),
		new kakao.maps.LatLng(37.66671,127.08327),
		new kakao.maps.LatLng(37.6668,127.08307),
		new kakao.maps.LatLng(37.66694,127.08289),
		new kakao.maps.LatLng(37.66696,127.08264),
		new kakao.maps.LatLng(37.66693,127.0824),
		new kakao.maps.LatLng(37.66691,127.08217),
		new kakao.maps.LatLng(37.6667,127.08218),
		new kakao.maps.LatLng(37.66653,127.08206),
		new kakao.maps.LatLng(37.6664,127.08188),
		new kakao.maps.LatLng(37.66625,127.08174),
		new kakao.maps.LatLng(37.66607,127.08171),
		new kakao.maps.LatLng(37.66589,127.08178),
		new kakao.maps.LatLng(37.6657,127.08183),
		new kakao.maps.LatLng(37.66552,127.08189),
		new kakao.maps.LatLng(37.66531,127.08191),
		new kakao.maps.LatLng(37.66512,127.08187),
		new kakao.maps.LatLng(37.66501,127.08168),
		new kakao.maps.LatLng(37.66482,127.0816),
		new kakao.maps.LatLng(37.66466,127.08147),
		new kakao.maps.LatLng(37.66448,127.08154),
		new kakao.maps.LatLng(37.66428,127.08157),
		new kakao.maps.LatLng(37.6641,127.08157),
		new kakao.maps.LatLng(37.6639,127.08157),
		new kakao.maps.LatLng(37.66371,127.08163),
		new kakao.maps.LatLng(37.66353,127.08173),
		new kakao.maps.LatLng(37.66335,127.08176),
		new kakao.maps.LatLng(37.66318,127.08171),
		new kakao.maps.LatLng(37.66299,127.08175),
		new kakao.maps.LatLng(37.66281,127.08179),
		new kakao.maps.LatLng(37.66262,127.08178),
		new kakao.maps.LatLng(37.66244,127.08173),
		new kakao.maps.LatLng(37.66225,127.0817),
		new kakao.maps.LatLng(37.66207,127.0817),
		new kakao.maps.LatLng(37.6619,127.08186),
		new kakao.maps.LatLng(37.66172,127.08179),
		new kakao.maps.LatLng(37.66166,127.08202),
		new kakao.maps.LatLng(37.66157,127.08223),
		new kakao.maps.LatLng(37.6614,127.08238),
		new kakao.maps.LatLng(37.66124,127.08248),
		new kakao.maps.LatLng(37.66109,127.08233),
		new kakao.maps.LatLng(37.66093,127.08245),
		new kakao.maps.LatLng(37.66075,127.08254),
		new kakao.maps.LatLng(37.66061,127.08272),
		new kakao.maps.LatLng(37.66043,127.08279),
		new kakao.maps.LatLng(37.66025,127.08277),
		new kakao.maps.LatLng(37.66008,127.08285),
		new kakao.maps.LatLng(37.6599,127.08283),
		new kakao.maps.LatLng(37.65974,127.08271),
		new kakao.maps.LatLng(37.65956,127.08272),
		new kakao.maps.LatLng(37.65937,127.08267),
		new kakao.maps.LatLng(37.65919,127.08256),
		new kakao.maps.LatLng(37.65898,127.08257),
		new kakao.maps.LatLng(37.65881,127.08266),
		new kakao.maps.LatLng(37.65862,127.08271),
		new kakao.maps.LatLng(37.65844,127.08274),
		new kakao.maps.LatLng(37.65823,127.08273),
		new kakao.maps.LatLng(37.65805,127.08283),
		new kakao.maps.LatLng(37.65788,127.08289),
		new kakao.maps.LatLng(37.65768,127.08292),
		new kakao.maps.LatLng(37.65753,127.08307),
		new kakao.maps.LatLng(37.65736,127.08316),
		new kakao.maps.LatLng(37.65718,127.08318),
		new kakao.maps.LatLng(37.65699,127.08315),
		new kakao.maps.LatLng(37.6568,127.08307),
		new kakao.maps.LatLng(37.65666,127.08322),
		new kakao.maps.LatLng(37.65648,127.08324),
		new kakao.maps.LatLng(37.65631,127.08332),
		new kakao.maps.LatLng(37.65616,127.08345),
		new kakao.maps.LatLng(37.65604,127.08364),
		new kakao.maps.LatLng(37.65594,127.08386),
		new kakao.maps.LatLng(37.65581,127.08406),
		new kakao.maps.LatLng(37.6556,127.08399),
		new kakao.maps.LatLng(37.65546,127.08383),
		new kakao.maps.LatLng(37.65532,127.08368),
		new kakao.maps.LatLng(37.65513,127.08353),
		new kakao.maps.LatLng(37.65513,127.08327),
		new kakao.maps.LatLng(37.65511,127.08304),
		new kakao.maps.LatLng(37.65506,127.08282),
		new kakao.maps.LatLng(37.655,127.08305),
		new kakao.maps.LatLng(37.65487,127.08322),
		new kakao.maps.LatLng(37.65474,127.08338),
		new kakao.maps.LatLng(37.65456,127.08348),
		new kakao.maps.LatLng(37.65438,127.08348),
		new kakao.maps.LatLng(37.65421,127.08358),
		new kakao.maps.LatLng(37.65408,127.08376),
		new kakao.maps.LatLng(37.6539,127.08381),
		new kakao.maps.LatLng(37.65373,127.08372),
		new kakao.maps.LatLng(37.6536,127.08391),
		new kakao.maps.LatLng(37.65349,127.08412),
		new kakao.maps.LatLng(37.65337,127.08432),
		new kakao.maps.LatLng(37.65322,127.08449),
		new kakao.maps.LatLng(37.65307,127.08462),
		new kakao.maps.LatLng(37.65289,127.08473),
		new kakao.maps.LatLng(37.65278,127.08491),
		new kakao.maps.LatLng(37.65254,127.08499),
		new kakao.maps.LatLng(37.65237,127.08511),
		new kakao.maps.LatLng(37.65222,127.08524),
		new kakao.maps.LatLng(37.65205,127.08534),
		new kakao.maps.LatLng(37.65188,127.08544),
		new kakao.maps.LatLng(37.6517,127.0855),
		new kakao.maps.LatLng(37.65162,127.08573),
		new kakao.maps.LatLng(37.65154,127.08593),
		new kakao.maps.LatLng(37.65146,127.08615),
		new kakao.maps.LatLng(37.65144,127.0864),
		new kakao.maps.LatLng(37.65135,127.08661),
		new kakao.maps.LatLng(37.65121,127.08676),
		new kakao.maps.LatLng(37.65102,127.08678),
		new kakao.maps.LatLng(37.65092,127.08699),
		new kakao.maps.LatLng(37.65084,127.0872),
		new kakao.maps.LatLng(37.65073,127.08739),
		new kakao.maps.LatLng(37.65062,127.08758),
		new kakao.maps.LatLng(37.65058,127.08782),
		new kakao.maps.LatLng(37.65054,127.08804),
		new kakao.maps.LatLng(37.65037,127.08814),
		new kakao.maps.LatLng(37.65019,127.08817),
		new kakao.maps.LatLng(37.65,127.08826),
		new kakao.maps.LatLng(37.64982,127.0883),
		new kakao.maps.LatLng(37.64964,127.08839),
		new kakao.maps.LatLng(37.64945,127.08837),
		new kakao.maps.LatLng(37.64927,127.08832),
		new kakao.maps.LatLng(37.64909,127.08843),
		new kakao.maps.LatLng(37.6489,127.08838),
		new kakao.maps.LatLng(37.6487,127.08836),
		new kakao.maps.LatLng(37.64851,127.08833),
		new kakao.maps.LatLng(37.64836,127.08849),
		new kakao.maps.LatLng(37.64822,127.0887),
		new kakao.maps.LatLng(37.64811,127.0889),
		new kakao.maps.LatLng(37.64794,127.089),
		new kakao.maps.LatLng(37.64773,127.089),
		new kakao.maps.LatLng(37.64755,127.08904),
		new kakao.maps.LatLng(37.64737,127.08894),
		new kakao.maps.LatLng(37.64719,127.08884),
		new kakao.maps.LatLng(37.647,127.08882),
		new kakao.maps.LatLng(37.64683,127.08872),
		new kakao.maps.LatLng(37.64667,127.08884),
		new kakao.maps.LatLng(37.64648,127.08878),
		new kakao.maps.LatLng(37.64632,127.08869),
		new kakao.maps.LatLng(37.64613,127.08869),
		new kakao.maps.LatLng(37.64596,127.08879),
		new kakao.maps.LatLng(37.64577,127.08887),
		new kakao.maps.LatLng(37.64566,127.08908),
		new kakao.maps.LatLng(37.64562,127.08932),
		new kakao.maps.LatLng(37.64559,127.08955),
		new kakao.maps.LatLng(37.64558,127.0898),
		new kakao.maps.LatLng(37.64548,127.09),
		new kakao.maps.LatLng(37.64534,127.09016),
		new kakao.maps.LatLng(37.64526,127.09037),
		new kakao.maps.LatLng(37.6452,127.09059),
		new kakao.maps.LatLng(37.64518,127.09084),
		new kakao.maps.LatLng(37.64497,127.09076),
		new kakao.maps.LatLng(37.64475,127.09085),
		new kakao.maps.LatLng(37.64458,127.09094),
		new kakao.maps.LatLng(37.64446,127.09113),
		new kakao.maps.LatLng(37.64429,127.09121),
		new kakao.maps.LatLng(37.64411,127.09131),
		new kakao.maps.LatLng(37.64394,127.09141),
		new kakao.maps.LatLng(37.6438,127.09158),
		new kakao.maps.LatLng(37.6437,127.09177),
		new kakao.maps.LatLng(37.64354,127.0919),
		new kakao.maps.LatLng(37.64337,127.092),
		new kakao.maps.LatLng(37.64318,127.09203),
		new kakao.maps.LatLng(37.64302,127.09192),
		new kakao.maps.LatLng(37.64296,127.0917),
		new kakao.maps.LatLng(37.64282,127.09152),
		new kakao.maps.LatLng(37.64267,127.09138),
		new kakao.maps.LatLng(37.64248,127.09131),
		new kakao.maps.LatLng(37.64228,127.09135),
		new kakao.maps.LatLng(37.64217,127.09153),
		new kakao.maps.LatLng(37.64199,127.09148),
		new kakao.maps.LatLng(37.64181,127.09141),
		new kakao.maps.LatLng(37.64163,127.0914),
		new kakao.maps.LatLng(37.64147,127.09127),
		new kakao.maps.LatLng(37.64133,127.09112),
		new kakao.maps.LatLng(37.64116,127.09101),
		new kakao.maps.LatLng(37.64099,127.09111),
		new kakao.maps.LatLng(37.64081,127.09107),
		new kakao.maps.LatLng(37.64062,127.09103),
		new kakao.maps.LatLng(37.64046,127.0909),
		new kakao.maps.LatLng(37.64032,127.09074),
		new kakao.maps.LatLng(37.64021,127.09057),
		new kakao.maps.LatLng(37.64003,127.09065),
		new kakao.maps.LatLng(37.63985,127.09073),
		new kakao.maps.LatLng(37.63967,127.09064),
		new kakao.maps.LatLng(37.63949,127.09053),
		new kakao.maps.LatLng(37.6393,127.09043),
		new kakao.maps.LatLng(37.63912,127.09033),
		new kakao.maps.LatLng(37.63901,127.09013),
		new kakao.maps.LatLng(37.63883,127.08999),
		new kakao.maps.LatLng(37.63864,127.09007),
		new kakao.maps.LatLng(37.63846,127.09008),
		new kakao.maps.LatLng(37.63829,127.09018),
		new kakao.maps.LatLng(37.63815,127.09035),
		new kakao.maps.LatLng(37.63802,127.09052),
		new kakao.maps.LatLng(37.63783,127.09057),
		new kakao.maps.LatLng(37.63767,127.09045),
		new kakao.maps.LatLng(37.6375,127.0905),
		new kakao.maps.LatLng(37.63732,127.0906),
		new kakao.maps.LatLng(37.63714,127.09056),
		new kakao.maps.LatLng(37.63696,127.09049),
		new kakao.maps.LatLng(37.63678,127.09035),
		new kakao.maps.LatLng(37.63662,127.0902),
		new kakao.maps.LatLng(37.63646,127.09009),
		new kakao.maps.LatLng(37.63628,127.09),
		new kakao.maps.LatLng(37.63612,127.08987),
		new kakao.maps.LatLng(37.63596,127.08977),
		new kakao.maps.LatLng(37.63576,127.08977),
		new kakao.maps.LatLng(37.6356,127.08991),
		new kakao.maps.LatLng(37.63554,127.09015),
		new kakao.maps.LatLng(37.63552,127.09038),
		new kakao.maps.LatLng(37.63533,127.09041),
		new kakao.maps.LatLng(37.63512,127.0904),
		new kakao.maps.LatLng(37.63496,127.09031),
		new kakao.maps.LatLng(37.63476,127.09018),
		new kakao.maps.LatLng(37.63458,127.09014),
		new kakao.maps.LatLng(37.63439,127.0901),
		new kakao.maps.LatLng(37.63433,127.08987),
		new kakao.maps.LatLng(37.63431,127.08962),
		new kakao.maps.LatLng(37.63433,127.08936),
		new kakao.maps.LatLng(37.63418,127.0892),
		new kakao.maps.LatLng(37.634,127.08917),
		new kakao.maps.LatLng(37.63381,127.08918),
		new kakao.maps.LatLng(37.63363,127.08913),
		new kakao.maps.LatLng(37.63344,127.08917),
		new kakao.maps.LatLng(37.63325,127.08921),
		new kakao.maps.LatLng(37.63305,127.08921),
		new kakao.maps.LatLng(37.63286,127.08918),
		new kakao.maps.LatLng(37.63269,127.08908),
		new kakao.maps.LatLng(37.6325,127.08902),
		new kakao.maps.LatLng(37.63231,127.08901),
		new kakao.maps.LatLng(37.63212,127.08899),
		new kakao.maps.LatLng(37.63194,127.089),
		new kakao.maps.LatLng(37.63175,127.08904),
		new kakao.maps.LatLng(37.63156,127.08904),
		new kakao.maps.LatLng(37.63138,127.08902),
		new kakao.maps.LatLng(37.63119,127.08898),
		new kakao.maps.LatLng(37.63098,127.08899),
		new kakao.maps.LatLng(37.63082,127.08888),
		new kakao.maps.LatLng(37.63062,127.08882),
		new kakao.maps.LatLng(37.63042,127.0888),
		new kakao.maps.LatLng(37.63026,127.08867),
		new kakao.maps.LatLng(37.63012,127.0885),
		new kakao.maps.LatLng(37.62998,127.08833),
		new kakao.maps.LatLng(37.62988,127.08809),
		new kakao.maps.LatLng(37.62979,127.08788),
		new kakao.maps.LatLng(37.62969,127.08768),
		new kakao.maps.LatLng(37.62955,127.08752),
		new kakao.maps.LatLng(37.62939,127.08739),
		new kakao.maps.LatLng(37.6292,127.08729),
		new kakao.maps.LatLng(37.62902,127.08721),
		new kakao.maps.LatLng(37.62883,127.08714),
		new kakao.maps.LatLng(37.62861,127.0871),
		new kakao.maps.LatLng(37.62844,127.08704),
		new kakao.maps.LatLng(37.62824,127.08695),
		new kakao.maps.LatLng(37.62814,127.08675),
		new kakao.maps.LatLng(37.62806,127.08652),
		new kakao.maps.LatLng(37.62802,127.08626),
		new kakao.maps.LatLng(37.62809,127.08604),
		new kakao.maps.LatLng(37.62817,127.08582),
		new kakao.maps.LatLng(37.62827,127.08561),
		new kakao.maps.LatLng(37.62813,127.08544),
		new kakao.maps.LatLng(37.62808,127.0852),
		new kakao.maps.LatLng(37.62791,127.08529),
		new kakao.maps.LatLng(37.62772,127.0854),
		new kakao.maps.LatLng(37.62753,127.08546),
		new kakao.maps.LatLng(37.62739,127.08562),
		new kakao.maps.LatLng(37.62722,127.08572),
		new kakao.maps.LatLng(37.62704,127.08577),
		new kakao.maps.LatLng(37.62686,127.08584),
		new kakao.maps.LatLng(37.62665,127.08588),
		new kakao.maps.LatLng(37.62648,127.08597),
		new kakao.maps.LatLng(37.62628,127.08604),
		new kakao.maps.LatLng(37.62608,127.0861),
		new kakao.maps.LatLng(37.6259,127.08614),
		new kakao.maps.LatLng(37.62571,127.08615),
		new kakao.maps.LatLng(37.62554,127.08621),
		new kakao.maps.LatLng(37.62535,127.08632),
		new kakao.maps.LatLng(37.62517,127.08642),
		new kakao.maps.LatLng(37.62499,127.08648),
		new kakao.maps.LatLng(37.62481,127.08652),
		new kakao.maps.LatLng(37.62463,127.08659),
		new kakao.maps.LatLng(37.62445,127.08663),
		new kakao.maps.LatLng(37.62425,127.08673),
		new kakao.maps.LatLng(37.62409,127.08684),
		new kakao.maps.LatLng(37.62388,127.08684),
		new kakao.maps.LatLng(37.62369,127.08688),
		new kakao.maps.LatLng(37.62352,127.08692),
		new kakao.maps.LatLng(37.62334,127.08695),
		new kakao.maps.LatLng(37.62315,127.087),
		new kakao.maps.LatLng(37.62296,127.08699),
		new kakao.maps.LatLng(37.62277,127.08708),
		new kakao.maps.LatLng(37.6226,127.08722),
		new kakao.maps.LatLng(37.6224,127.08718),
		new kakao.maps.LatLng(37.62222,127.08723),
		new kakao.maps.LatLng(37.62204,127.08728),
		new kakao.maps.LatLng(37.62187,127.08738),
		new kakao.maps.LatLng(37.62169,127.08714),
		new kakao.maps.LatLng(37.62156,127.08698),
		new kakao.maps.LatLng(37.62138,127.08701),
		new kakao.maps.LatLng(37.62128,127.08679),
		new kakao.maps.LatLng(37.62116,127.08661),
		new kakao.maps.LatLng(37.62111,127.08638),
		new kakao.maps.LatLng(37.62103,127.08618),
		new kakao.maps.LatLng(37.62094,127.08594),
		new kakao.maps.LatLng(37.62084,127.08573),
		new kakao.maps.LatLng(37.62078,127.08548),
		new kakao.maps.LatLng(37.62066,127.08528),
		new kakao.maps.LatLng(37.62055,127.08506)
	];

	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FF0000', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  

	
	$("ul.infoBtn li").click(function(){
		var tab_id = $(this).attr("data-tab");

		$("ul.infoBtn li").removeClass("on");
		$(".infoArd").removeClass("on");

		$(this).addClass("on");
		$("#"+tab_id).addClass("on");
	});
	
	/* 행사 정보 */
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/43656e7541676d6c3932706769794f/json/NowonNewsEventList/1/10/",
		type: "GET",
		dataType: "json",
		success : function(res){
			drawNWEvtList(res.NowonNewsEventList.row);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
	
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/52576a4b61676d6c3839725076485a/json/DobongNewsEventList/1/10/",
		type: "GET",
		dataType: "json",
		success : function(res){
			drawDBEvtList(res.DobongNewsEventList.row);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
	
	/* 숙박 정보*/
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/665761455a676d6c38306f6b4b4966/json/LOCALDATA_031103_NW/1/50/",
		type: "GET",
		dataType: "json",
		success : function(res){
			drawNWStayList(res.LOCALDATA_031103_NW.row);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	}); 
	
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/5744645344676d6c3538486c437558/json/LOCALDATA_031103_DB/1/50/",
		type: "GET",
		dataType: "json",
		success : function(res){
			drawDBStayList(res.LOCALDATA_031103_DB.row);
		},
		error : function(request, status, error){
			console.log(request.responseText);
		}
	});
	
	/* 음식점 정보 */
	$.ajax({
		url: "http://openapi.seoul.go.kr:8088/46456e5752676d6c38357965685976/json/LOCALDATA_072404_NW/1/50/",
		type: "GET",
		dataType: "json",
		success : function(res){
			drawNWRstrList(res.LOCALDATA_072404_NW.row);
		},
		error : function(request, status, error){
			console.log(request.responseText);
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
});

/* 행사 정보 */
function drawNWEvtList(list){
	var html = "";
	
	for (var i=0; i<list.length; i++){
		html += "<tr>";
		html += "<td rowspan=2>노원구</td>";
		html += "<td rowspan=2>" + list[i].TITLE + "</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].LINK + "</td>";
		html += "</tr>";
	}
	$(".infoTable2 tbody").append(html);
}

function drawDBEvtList(list){
	var html = "";
	
	for (var i=0; i<list.length; i++){
		html += "<tr>";
		html += "<td rowspan=2>도봉구</td>";
		html += "<td rowspan=2>" + list[i].TITLE + "</td>";
		html += "<td>" + list[i].DESCRIPTION + "</td>";
		html += "</tr>";
		html += "<tr>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].LINK + "</td>";
		html += "</tr>";
	}
	$(".infoTable2 tbody").append(html);
} 

/* 숙박 정보*/
function drawNWStayList(list){
	var html = "";
	
	for (var i=0; i<list.length; i++){
		if(list[i].DTLSTATENM == "영업"){
		html += "<tr>";
		html += "<td>노원구</td>";
		html += "<td>" + list[i].BPLCNM + "</td>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].RDNWHLADDR + "</td>";
		html += "</tr>";
		}
	}
	$(".infoTable3 tbody").append(html);
}

function drawDBStayList(list){
	var html = "";
	
	for (var i=0; i<list.length; i++){
		if(list[i].DTLSTATENM == "영업"){
		html += "<tr>";
		html += "<td>도봉구</td>";
		html += "<td>" + list[i].BPLCNM + "</td>";
		html += "<td style=\"border-left: 1px solid #ddd;\">" + list[i].RDNWHLADDR + "</td>";
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
				<li class="on">1코스</li>
				<li onclick="document.location.href='course2'">2코스</li>
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
				<span>1코스 - 수락·불암산코스</span>
				
				<div class="crsDfc">
					<span>지역</span> : 노원구, 도봉구 &nbsp;&nbsp;
					<span>총길이</span> : 18.6km &nbsp;&nbsp;
					<span>소요시간</span> : 8시간 10분 &nbsp;&nbsp;
					<span>난이도</span> : 고급
				</div>
			</div>
				
			<div id="map" style="width:800px;height:600px;"></div>	
		
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
										<col width="400px">
										<col width="auto">
									</colgroup>
									<thead>
										<tr>
											<th>구분</th>
											<th>사업장명</th>
											<th>주소</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
							
						<div class="infoArd" id="tab_4">
							<div>
								<table class="infoTable4">
									<colgroup style="table-layout: fixed;">
										<col width="100px">
										<col width="400px">
										<col width="auto">
									</colgroup>
									<thead>
										<tr>
											<th>구분</th>
											<th>사업장명</th>
											<th>주소</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
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