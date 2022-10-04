<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="resources/css/common/cmn.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<title>관리자 로그인</title>
<style type="text/css">
body, input{
	font-family: 'Pretendard-Regular';
}
#header {
	height: 93px;
	text-align: center;
	background-color: #fffce1;
	padding: 42px;
	width: auto;
    min-width: 1500px;
}

#header .h_logo {
	width: 100%;
	height: 100%;
	display: inline-block;
	background-image:
		url('http://localhost:8090/Dulegil/resources/images/minlogo.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
}

#bottom {
	height: 1000px;
	margin: auto;
	text-align: center;
	background-color: white;
	width: auto;
    min-width: 1500px;
}

#bottom #login {
	width: 800px;
	height: 1000px;
	display: inline-block;
	background-color: white;
}

#bottom #login .login_banner {
	width: 200px;
	display: inline-block;
	margin-top: 80px;
	background-color: white;
	font-size: larger;
	color: #4a4a4a;
}

#bottom #login .login_box {
	width: 400px;
	height: 250px;
	margin: 20px 0px 0px 200px; /*아니 왜 중간으로 안오는거*/
	backdrop-filter: blur(6px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	-webkit-box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	-webkit-border-radius: 4px;
	color: rgba(255, 255, 255, 0.75);
}

#bottom #login .login_box .id_box {
	width: 350px;
	height: 50px;
	display: inline-block;
	margin-top: 25px;
	border: solid 1px #f3f3f3;
	background-color: white;
	position: relative;
}

#bottom #login .login_box .pw_box {
	width: 350px;
	height: 50px;
	display: inline-block;
	margin-top: 10px;
	border: solid 1px #f3f3f3;
	background-color: white;
	position: relative;
}

#bottom #login .login_box .login_btn {
	width: 200px;
	height: 50px;
	display: inline-block;
	margin-top: 30px;
	background-color: white;
}

input {
	width: 300px;
	border: none;
	cursor: pointer;
	font-size: 13pt;
	padding: 15px 7px;
}

input:focus {
	outline: none;
}

.loginBtn {
	display: inline-block;
	width: 200px;
	height: 50px;
	cursor: pointer;
	font-size: 15px;
	background-color: rgba(255, 255, 255, 0.25);
	backdrop-filter: blur(6px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	-webkit-box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	-webkit-border-radius: 12px;
	color: #4a4a4a;
}

.loginBtn:hover {
	background-color: #f2f3ef;
}

.loginBtn:active {
	background-color: #AECFDE;
}
</style>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#actionForm").on("keypress","input",function(event){
      if(event.keyCode == 13){//13은 엔터라는 뜻 엔터쳤을때 실행
		//버튼 이벤트 발생
		$("#loginBtn").click();
        return false;
      }
   })
   
   $("#loginBtn").on("click", login);  
});

function login(){
   if($.trim($("#id").val()) == ""){
      makeAlert("알림", "아이디를 입력하세요.", function(){
      $("#id").focus();	  
      });
   }else if ($.trim ($("#pwd").val()) == ""){
	   makeAlert("알림","비밀번호를 입력하세요",  function(){
      $("#pwd").focus();
	   });
   }else{
	   var params = $("#actionForm").serialize();	
		   $.ajax({
		      url:"loginAjax", //경로
		      type: "POST", //전송방식(GET : 주소 형태, POST: 주소 헤더)
		      dataType: "json", //
		      data: params, //json 으로 보낼데이터
		      	success : function(res){ // 성공했을 때 결과를 res에 받고 함수 실행
		      		console.log(res);
		     		 if(res.msg == "success"){	
		    		  location.href = "adminList"; 
		    		  
		     		 }else{
		    		  makeAlert("알림", "아이디나 비밀번호가 틀립니다.")
		    		  }
		    	  },
		    	  error :function(request, status, error) { //실패했을 때 함수 실행
		        	 console.log(request.responseText); //실패 상세내역
		     		}
		   });
   }     
}
</script>
</head>
<body>
	<div id="header">
		<div class="h_logo"></div>
	</div>
	<div id="bottom">
		<div id="login">
			<div class="login_banner">
				<span class="material-symbols-outlined" style="font-size: 34px; color: #4a4a4a; vertical-align: bottom;">badge</span>
				<span style="font-size: 23px; color: #4a4a4a; padding-left: 6px;">관리자 로그인</span>
			</div>
			<div class="login_box">
				<form action="#" id="actionForm" method="post">
					<div class="id_box">
						<span class="material-symbols-outlined" style="font-size: 20px; color: #C0C0C0; position: relative; top: 4px;"> face </span>
						<input type="text"   name="id" id="id" class="input" placeholder="ID" maxlength="20" />
					</div>
					<div class="pw_box">
						<span class="material-symbols-outlined" style="font-size: 20px; color: #C0C0C0; position: relative; top: 4px;"> key </span> 
						<input type="password" name="pwd" id="pwd" class="input" placeholder="PASSWORD" maxlength="20" />
					</div>
				</form>
				<div class="login_btn">
					<input type="button" id="loginBtn" class="loginBtn" value="login" />
				</div>
			</div> <!-- login box end -->
		</div>
	</div>
</body>
</html>