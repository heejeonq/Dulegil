<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Gothic+A1:100,200,300,400,500,600,700,800,900')
	;

body {
	font-family: "Gothic A1";
	font-weight: 600;
}

#header {
	height: 93px;
    text-align: center;
    background-color: #f2f3ef;
    padding: 42px;
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
	border: solid 1px #C0C0C0;
	background-color: white;
	font-family: "Gothic A1";
	font-weight: 500;
	background-color: rgba(255, 255, 255, 0.25);
	backdrop-filter: blur(6px);
	-webkit-backdrop-filter: blur(6px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	-webkit-box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	border-radius: 12px;
	-webkit-border-radius: 12px;
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

.input {
	display: inline-block;
	width: 300px;
	height: 47px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	height: 47px;
	width: 300px;
	height: 47px;
}

.input:focus {
	outline: none;
}

.loginBtn {
	display: inline-block;
	width: 200px;
	height: 50px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	border-radius: 42px;
	background-color: rgba(255, 255, 255, 0.25);
	backdrop-filter: blur(6px);
	-webkit-backdrop-filter: blur(6px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	-webkit-box-shadow: rgba(142, 142, 142, 0.19) 0px 6px 15px 0px;
	border-radius: 12px;
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









</head>
<body>

	<div id="header">
		<div class="h_logo"></div>
	</div>

	<div id="bottom">
		<div id="login">
			<div class="login_banner">
				<span class="material-symbols-outlined"
					style="font-size: 34px; color: #4a4a4a; vertical-align: bottom;">
					badge </span><span
					style="font-size: 20px; color: #4a4a4a; vertical-align: middle; padding-left: 6px;
">Admin
					Login</span>
			</div>

			<div class="login_box">
				<div class="id_box">
					<span class="material-symbols-outlined"
						style="font-size: 20px; color: #C0C0C0; vertical-align: middle;">
						info </span> <input type="text" class="input" placeholder="ID"
						maxlength="20" />

				</div>
				<div class="pw_box">
					<span class="material-symbols-outlined"
						style="font-size: 20px; color: #C0C0C0; vertical-align: middle;">
						lock </span><input type="password" class="input" placeholder="PASSWORD"
						maxlength="20" />
				</div>
				<div class="login_btn">
					<input type="button" class="loginBtn" value="login" />
				</div>
			</div>

		</div>
	</div>

</body>
</html>