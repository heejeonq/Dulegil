<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 둘레길:회원 가입</title>
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/join.css" />
<link rel="stylesheet" href="resources/css/fonts.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   
                
                } else {
                    
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zcd').value = data.zonecode;
                document.getElementById("adr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("adrDtl").focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#joinBtn").on("click", function(){
		action("insert");
	});
});

function action(flag){
	//con의 <를 웹문자로 변환
	//$("#con").val($("#con").val().replace(/</gi, "&lt;"));
	//con의 >를 웹문자로 변환
	//$("#con").val($("#con").val().replace(/>/gi, "&gt;"));
	//Javascript Object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수 있다 
	// 							 Java의 Map에서 get, put 역할
	 var params = $("#actionForm").serialize();
     
     $.ajax({
        url:"joinAction/" + flag, 
        type:"POST", 
        dataType:"json", 
        data : params,
        success: function(res) { 
        	switch(res.msg) {
        	case "success" : 
        		//내용 초기화
        	
        		
        		//목록 재조회
        		switch(flag){
        		case "insert" : 
        			break;
        		case "delete" :
        			//조회 데이터 초기화
        			$("#page").val("1");
        			$("#searchGbn").val("0");
        			$("#searchText").val("");
        			$("#oldGbn").val("0");
        			$("#oldText").val("");
        			break;
        		case "update" :
        			//기존값 유지
        			$("#oldGbn").val($("#searchGbn").val());
        			$("#oldText").val($("#searchText").val());
        			//입력내용 초기화
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
     });// Ajax End
} 
</script>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->
	<div class="container-main">							
		<div class="mainWrap">
		<form action="#" id="actionForm">
			<h1>회원가입</h1>
			<div class="col"></div>
			
			<p>필수 입력 사항</p>
			
			<table class="bscInfo">
				<colgroup>
				<col style="width:150px;">
				<col style="width:auto;">
				</colgroup>
				
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="email" id="email" placeholder="(영문소문자/숫자, 4~16자)" />
						<select id="emailSel">
							<option>직접입력</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
							<option>daum.net</option>
							<option>nate.com</option>
							<option>hotmail.com</option>
							<option>gmail.com</option>
							<option>icloud.com</option>
						</select>
						<input type="button" name="cnfmBtn" id="cnfmBtn" id="cnfmBtn" value="중복확인" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" id="pwd" placeholder="(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)" />
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="cnfmPwd" id="cnfmPwd" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="nm" id="nm" />
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" name="phn" id="phn" placeholder="- 없이 입력하세요" />
					</td>
				</tr>
			</table>
			
			<p>추가 입력 사항</p>
			<table class="addInfo">	
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="dtBrt" id="dtBrt">
					</td>	
					<th>성별</th>
					<td class="gen">
						<input type="radio" name="gen" id="gen" value="0" checked="checked" />
      					<label for="m">남자</label>
						<input type="radio" name="gen" id="gen" value="1" />
						<label for="f">여자</label>
					</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td colspan="3">	
						<input type="text" name="zcd" id="zcd" value="우편 번호" />
						<input type="button" name="adrBtn" id="adrBtn" value="주소 검색" onclick="sample6_execDaumPostcode()" />	
						<input type="text" name="adr" id="adr" value="주소" />
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
			<div class="col"></div>
			
		</form>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>

</body>
</html>