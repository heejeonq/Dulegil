<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/css/join.css" />
<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 이메일 select -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } else {
            	
            }

            document.getElementById('zcd').value = data.zonecode;
            document.getElementById("adr").value = addr;
            document.getElementById("adrDtl").focus();
        }
    }).open();
}

function emailSelect(ele){
    var $ele = $(ele);
    var $emailId = $('input[name=emailId]');

    if($ele.val() == "1"){
        $emailId.attr('readonly', false);
        $emailId.val('');
    } else {
        $emailId.attr('readonly', true);
        $emailId.val($ele.val());
    }
}

function action(flag){
	 var params = $("#actionForm").serialize();
    
    $.ajax({
       url:"joinAction/" + flag, 
       type:"POST", 
       dataType:"json", 
       data : params,
       success: function(res) { 
       	switch(res.msg) {
       	case "success" : 
       		switch(flag){
       		case "insert" : 
       			
       			makeAlert("알림", "회원가입이 완료되었습니다.", function() {
       				location.href='main';
       			});
       		break;
       		case "delete" :
       			$("#page").val("1");
       			$("#searchGbn").val("0");
       			$("#searchText").val("");
       			$("#oldGbn").val("0");
       			$("#oldText").val("");
       		break;
       		case "update" :
       			$("#oldGbn").val($("#searchGbn").val());
       			$("#oldText").val($("#searchText").val());
       			$("#con").val("");
       			$("#no").val("");
       			$(".insert").show();
       			$(".update").hide();
       		break;
       		}
       	break;
       	
       	case "fail" :  alert("알림", msg[flag] + "에 실패하였습니다.");
   			break;
   		
    		case "error" : alert("알림", msg[flag] + " 중 문제가 발생하였습니다.");
				break;
			}
       }, 
       error: function(request, status, error) { 
          console.log(request.responseText); 
       }
    });
} 

function check(obj){
	// 허용할 특수문자는 여기서 삭제하면 된다.
	var regExp1 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

	//배열에서 하나씩 값을 비교 (.test()괄호안에 있는 값이 .앞에 있는 값에 포함 되면 true/obj.value값이 인풋 안에 들어간 벨류 값(입력 받은 값.))
	if( regExp1.test(obj.value) ){
	   alert("특수문자는 입력하실수 없습니다.");
	   //값이 일치하면 문자를 삭제             //첫번째거부터 맨 마지막의 앞자리까지 잘라줌(그 값의 길이의 -1)
	   obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움.
	   
	}else{
		   
	}
} 

$(document).ready(function() {
	$("#cnfmBtn").on("click", function(){
		$("#chkId").val("0");
		$("#email").val($("#id").val() + "@" + $("#emailId").val());
		if($.trim($("#id").val()) == ""){
			makeAlert("알림", "아이디를 입력하세요.", function(){
				$("#id").focus();	
			});
		}else if($.trim($("#emailId").val()) == ""){
			makeAlert("알림", "이메일을 입력하세요.", function(){
				$("#emailId").focus();
			});
		}else{
			var params = $("#actionForm").serialize();
			$.ajax({
				url:"chkIdAjax", 
				type:"POST", 
				dataType:"json", 
				data : params,
				success: function(res) { 
					if(res.msg == "success"){
						makeAlert("알림", "사용할 수 없는 아이디입니다.");
						$("#id").val("");
						$("#emailId").val("");
						$("#emailSel").val("1");
					}else{
						makeAlert("알림", "사용 가능한 아이디입니다.");
						$("#chkId").val("1");
					}
				}, 
				error: function(request, status, error) { 
					console.log(request.responseText); 
				}
			});
		}
	});
	
	$("#joinBtn").on("click", function(){
		$("#email").val($("#id").val() + "@" + $("#emailId").val());
		
		if($.trim($("#id").val()) == ""){
			makeAlert("알림", "아이디를 입력하세요.", function(){
				$("#id").focus();	
			});
		}else if($.trim($("#emailId").val()) == ""){
			makeAlert("알림", "이메일 주소를 입력하세요.", function(){
				$("#emailId").focus();
			});
		}else if($.trim($("#chkId").val()) == "0"){ 
			makeAlert("알림", "아이디 중복확인을 해주세요.", function(){
			});
		}else if($.trim($("#pwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요.", function(){
				$("#pwd").focus();
			});
		}else if($.trim($("#cnfmPwd").val()) == ""){
			makeAlert("알림", "비밀번호를 입력하세요.", function(){
				$("#cnfmPwd").focus();
			});
		}else if($("#pwd").val() != $("#cnfmPwd").val()){
			makeAlert("알림", "비밀번호가 일치하지 않습니다.", function(){
				$("#cnfmPwd").focus();
			});
		}else if($.trim($("#nm").val()) == ""){
			makeAlert("알림", "이름을 입력하세요.", function(){
				$("#nm").focus();
			});
		}else if($.trim($("#phn").val()) == ""){
			makeAlert("알림", "휴대전화번호를 입력하세요.", function(){
				$("#phn").focus();
			});
		}else{
			action("insert");
		}
	});
	
});
</script>
</head>
<body>

	<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-main">							
		<div class="mainWrap">
			<form action="#" id="actionForm">
				<h1>회원가입</h1>
				<p>필수 입력 사항</p>
				<table class="bscInfo">
					<colgroup>
					<col style="width:140px;">
					<col style="width:auto;">
					</colgroup>
					<tr>
						<th>아이디</th>
						<td>
							<input type="hidden" name="email" id="email">
						 	<input type="text" name="id" id="id" onkeyup="check(this)" placeholder="영문 대/소문자, 숫자, 4~20자 이내" maxlength="20" /> 
							<p id="at">@</p> 
							<input type="text" name="emailId" id="emailId" placeholder="직접 입력" onkeyup="check(this)" />
							<select id="emailSel" name="emailSel" onChange="emailSelect(this)">
								<option value="1">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="icloud.com">icloud.com</option>
							</select>
							<input type="hidden" name="chkId" id="chkId" value="0">
							<input type="button" name="cnfmBtn" id="cnfmBtn" value="중복확인" onclick="cnfmId()" />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="pwd" id="pwd" onkeyup="check(this)" placeholder="영문 대/소문자, 숫자 8자이상 20자 이내"  maxlength="20" />
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="cnfmPwd" id="cnfmPwd" maxlength="20" onkeyup="check(this)" />
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="nm" id="nm" placeholder="영문 대/소문자, 한글, 숫자 10자 이내" maxlength="10" onkeyup="check(this)"/>
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>
							<input type="text" name="phn" id="phn" placeholder="- 없이 입력하세요" maxlength="11" onkeyup="check(this)" />
						</td>
					</tr>
				</table>
				
				<p>추가 입력 사항</p>
				<table class="addInfo">
					<colgroup>
					<col style="width:140px;">
					<col style="width:auto;">
					</colgroup>	
					<tr>
						<th>생년월일</th>
						<td>
							<input type="date" name="dtBrt" id="dtBrt">
						</td>	
					</tr>
					<tr>			
						<th>성별</th>
						<td class="gender">
							<input type="radio" name="gen" id="gen" value="0" checked="checked" />
	      					<label for="m">남자</label>
							<input type="radio" name="gen" id="gen" value="1" />
							<label for="f">여자</label>
						</td>
					</tr>
					<tr>
						<th rowspan="2">주소</th>
						<td colspan="3">	
							<input type="text" name="zcd" id="zcd" placeholder="우편 번호" />
							<input type="button" name="adrBtn" id="adrBtn" value="검색" onclick="sample6_execDaumPostcode()" />	
							<input type="text" name="adr" id="adr" placeholder="주소" />
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="text" name="adrDtl" id="adrDtl" placeholder="상세 주소" value=""/>
						</td>
					</tr>
				</table>
	
				<div class="btn">
					<input type="button" id="joinBtn" value="가입하기">
				</div>
			</form>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>