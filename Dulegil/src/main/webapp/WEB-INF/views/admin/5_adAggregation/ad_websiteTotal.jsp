<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adjscss.jsp" flush="true" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹 사이트 활동 집계</title>
<style type="text/css">
#box1 {
	width: 100%;
	height: 6%;
	font-size: small;
	margin: 8px 0px;
	text-align: -webkit-center;
	font-size: small;
	margin: 8px 0px;
}

#box2 {
	width: 100%;
	height: 11%;
	font-size: medium;
	margin: 10px 0px;
	text-align: -webkit-center;
	font-size: medium;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 50px;
	color: #404040;
	box-shadow: 3px 3px 3px 0px #ebebeb;
	border-radius: 4px;
}

td, th {
	border-collapse: collapse;
	text-align: center;
	padding: 4px;
	color: #404040;
	font-weight: 500;
}

th {
	width: 153px;
	padding: 6px;
	background: #f4f5ee;
	font-size: small;
}

td {
	font-size: small;
	padding: 8px;
}


/* 하이 차트 */
.highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#containerC {
    height: 400px;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    fill: #f1f7ff;
    x: 143;
    y: 103;
    width: 6;
    height: 152;
    opacity: 1;
}



</style>

<!-- 하이차트 -->
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
<script src="resources/script/highcharts/modules/export-data.js"></script>
<script src="resources/script/highcharts/modules/accessibility.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var month = new Array();
	var mem = new Array();
	var post = new Array();
	var cmt = new Array();
	var acp = new Array();
	var cnt = new Array();
	
	
	
	//function chartLoad(){
		  $.ajax({
		      url : "chartAjax",
		      type : "POST", 
		      dataType: "json", 
		      //data: params,
		      success : function(res) { 
		    	  console.log(res);
		         
				          // month 배열
		          for(var i =0; i< res.month.length; i++){    
		            	   month[i] = parseInt(res.month[i].M);
		            	   mem[i] = parseInt(res.month[i].MEM);
		            	   post[i] = parseInt(res.month[i].POST);
		            	   cmt[i] = parseInt(res.month[i].CMT); 
		            	   acp[i] = parseInt(res.month[i].ACOM);
		            	   cnt[i] = parseInt(res.month[i].CNT); 
		               }
		          //console.log(mem);
		          Highcharts.chart('containerC', {
		      	    chart: {
		      	        type: 'column'
		      	    },
		      	    title: {
		      	        text: '웹사이트 활동 집계'
		      	    },
		      	    subtitle: {
		      	        text: 'Source: ' +
		      	            '<a href="https://www.ssb.no/en/statbank/table/08940/" ' +
		      	            'target="_blank">SSB</a>'
		      	    },
		      	    xAxis: {
		      	        categories: month
		      	    },
		      	    colors: ['rgb(193,230,224)', 'rgb(245,228,213)', 'rgb(245,200,215)', 'rgb(219,245,213)', '#1aadce',
		      	        '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
		      	    yAxis: {
		      	        title: {
		      	            useHTML: true,
		      	            text: '민둘레 웹사이트 총 집계<sub>2</sub>-equivalents'
		      	        }
		      	    },
		      	    tooltip: {
		      	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		      	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		      	            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
		      	        footerFormat: '</table>',
		      	        shared: true,
		      	        useHTML: true
		      	    },
		      	    plotOptions: {
		      	        column: {
		      	        	// 막대기 사이 간격
		      	            pointPadding: 0.2,
		      	            
		      	            // 막대기 너비
		      	            borderWidth: 0
		      	        }
		      	    },
		      	    series: [{
		      	        name: '회원 수',
		      	        data: mem

		      	    }, {
		      	        name: '게시글 수',
		      	        data: post
		      	       

		      	    }, {
		      	        name: '댓글 수',
		      	        data: cmt
		      	    

		      	    }, {
		      	        name: '동행 신청수',
		      	        data: acp

		      	    },{
		      	        name: '동행 성사 수',
		      	        data: cnt 

		      	    }]
		      	});
		      },
		      error : function(request, status, error) { 
		         console.log(request.responseText); 
		      }
		   }); 

	
	//}
	
		console.log(mem);
	
	
	
	
}); // document.ready end

function getData() {
	var params =  $("#getForm").serialize();
	$.ajax({
		type : "post",
		url : "totalAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			makeChart(result.list);
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

</script>

</head>
<body>
	<jsp:include page="../adHeader.jsp" flush="true" />

	<div class="container">
		<div class="Cname">
			<span class="material-symbols-outlined"
				style="font-size: 30px; font-weight: 600; color: #444; vertical-align: bottom;">leaderboard</span>
			웹사이트활동 집계
		</div>
		
		
		
		<!-- 차트 -->
		<figure class="highcharts-figure">
			<div id="containerC"></div>
			<p class="highcharts-description">위 표는 웹사이트 활동집계</p>
			
			<input type="hidden" id="chartType" value="column"/>
			<form action="#" id="getForm">
			사이즈 : <input type="text" name="size" value="5" />
			시리즈 : <input type="text" name="series" value="2" />
			</form>
			
		</figure>
		
		
	

		<div id="box1">
			<table>
				<thead>
					<tr>
						<th>총 회원 수</th>
						<th>게시글 수</th>
						<th>댓글 수</th>
						<th>동행 신청 수</th>
						<th>동행 성사 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${data.MEMCNT}</td>
						<td>${data.POSTCNT}</td>
						<td>${data.CMTCNT}</td>
						<td>${data.ACPCNT}</td>
						<td>${data.CNT}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="box2">
			<table>
				<thead>
					<tr>
						<th>기간</th>
						<th>게시글</th>
						<th>댓글 수</th>
						<th>회원가입 수</th>
						<th>동행 신청 수</th>
						<th>동행 성사 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2022.03.01 ~<br /> 2022.03.15
						</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
						<td>10</td>
					</tr>

				</tbody>
			</table>
		</div>

	</div>
</body>
</html>