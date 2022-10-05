<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="resources/css/common.css" />
<title>개인 정보 수정</title>

<!-- 주소 검색 (다음 우편번호 서비스 api 사용) -->
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

            // 사용자가 선택한 주소가 도로명 타입일 때 참고항목을 조합한다.
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
            // 위에 두개를 넣으면 상세주소가 다시 비워지게끔.
            $("#adrDtl").val('');
           	document.getElementById("adrDtl").focus();     
        }
    }).open();
}

//특수문자, 숫자 입력 방지
function check(obj){
// 허용할 문자는 여기서 삭제하면 된다.
var regExp1 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/g; 
var regExp2 = /[0-9]/g; 

//배열에서 하나씩 값을 비교 (.test()괄호안에 있는 값이 .앞에 있는 값에 포함 되면 true/obj.value값이 인풋 안에 들어간 벨류 값(입력 받은 값.))
if( regExp1.test(obj.value) ){
	alert("특수문자는 입력하실수 없습니다.");  
	//값이 일치하면 문자를 삭제             //첫번째부터 맨 마지막의 앞자리까지 잘라줌.(그 값의 길이의 -1은 불포함)    
	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움.
	} 
if( regExp2.test(obj.value) ){
	alert("숫자는 입력하실수 없습니다.");
	//값이 일치하면 문자를 삭제
	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움.
	}
} 

</script>
<script type="text/javascript">
$(document).ready(function(){ 
	//성별 값 넣기(값을 불러와서 값이{data.GENDER == 0}이면 남자고 아니면 여자를 체크)
	var gender = "${data.GENDER}";
	$("input[name='gen'][value='${data.GENDER}']").prop("checked",true);

	$("#updatemBtn").on("click", function(){
		if($.trim($("#cnfmPwd").val()) == "") {
			makeAlert("알림", "비밀번호를 입력해주세요", function(){;
				$("#cnfmPwd").focus();	
			});
		}
		else if($.trim($("#nm").val()) == "") {
			makeAlert("알림", "이름을 입력해주세요", function(){;
				$("#nm").focus();	
			});
		}	
		else {
	    	  //1.파일업로드 -> 2. 업로드 파일명 취득 -> 글저장
	    	  //폼 객체 취득 
	    	  var form = $("#actionForm");
	    	  //ajaxForm 적용
	    	  form.ajaxForm({
	    		  success: function(res){ //데이터 주고 받기 성공시
	    			  if(res.result == "SUCCESS"){//파일 전송 성공
	    				  //올라간 파일이 존재한다면
	    				  if(res.fileName.length > 0){
	    					  $("#imgFile").val(res.fileName[0]); //올라간 파일명 보관
	    				  }
	   					  /*
	   					 	글 저장
	   					  */
				         var params = $("#actionForm").serialize();
				         
				         $.ajax({
				            url:"mypageAjax/myinfoUpdate", 
				            type:"POST", 
				            dataType:"json", 
				            data : params,
				            success: function(res) { 
				            	switch(res.msg) {
				            	case "success" : makeAlert("알림", "수정이 완료되었습니다.", function(){
				            		location.href = "mypageMyinfo";
				            		});
				            		break;
				            		
				            	case "fail" : makeAlert("알림", "비밀번호가 일치하지 않습니다.");
				            		$("#cnfmPwd").val("");
				            		$("#cnfmPwd").val("");
				        			break;
				        		
				         		case "error" : makeAlert("알림", "수정 중 문제가 발생하였습니다.");
				     				break;
				     			}  
				            }, 
				            error: function(request, status, error) { 
				               console.log(request.responseText); 
				            }
				         });
	    			  }else {//문제 발생
	    				  makeAlert("알림", "파일 업로드에 <br>문제가 발생하였습니다.");
	    			  }
	    		  },
	    		  error : function (){ //에러시
	    			  makeAlert("알림", "파일 업로드에 <br>문제가 발생하였습니다.");
	    		  }
	    	  }); //ajaxForm 설정 끝
	    	  //ajaxForm 실행
	    	  form.submit();
	      }
	   });	
    // 파일 삭제 버튼
    // 누르면 전에 이미지 파일 지워지고, 새로운 이미지가 보이고, 파일명은 없어지고, 
    // 보여지는 이미지의 속성이 기본 프로필 url로 바뀌어서 기본 프로필이 보인다.
	$("#fileDelBtn").on("click",function(){
	      $(".imgOld").remove();
	      $(".img").show();
	      $("#imgFile").val("");
	      $("#preview").attr("src", "resources/upload/profile_img.png")
	   });
	
	$("#backBtn").on("click", function(){
   	 	makePopup({
        	title : "알림",
            contents : "수정을 취소하시겠습니까?",
            buttons   : [{
            	name : "확인",
              	func : function(){
                  	  location.href = "mypageMyinfo";
                 	  closePopup();
                }
            },{
               name : "취소"
           	  }]   
        })
	});
});

<!--이미지 파일 넣기-->
// 미리보기 처리 함수
function readURL(input) {
	 // 파일 선택했을 때 새로운 이미지 파일로 이미지가 변경
	 // 인풋 태그에 파일이 있는경우
	 if (input.files && input.files[0]) {
	   var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
	   //파일명의 경로를 읽어(reader가 동작하면 함수 실행)
	   reader.onload = function(e) {
		 // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러                
		 // 이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
		 //자바스크립트로 아이디 불러올때  document.getElementById
		 //제이쿼리는 자바스크립트의 라이브러리. 그래서 더 간편하게 쓸 수 있음
		 //제이쿼리 아이디 호출은 $("#preview")
		                                   //읽은 파일명의 대상의 실제 경로로 주소를 바꿈
		//document.getElementById('preview').src = e.target.result;
		 $("#preview").attr("src",e.target.result)
	   };
	 //File내용을 읽어 dataURL형식의 문자열로 저장
	 //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 한다.
	   reader.readAsDataURL(input.files[0]);
	 } else {
	   // 파일 선택 누르고 취소 누르면 전에 저장 되어있는 이미지 파일이 보여짐.
	   // document.getElementById('preview').src = "resources/upload/${data.IMG_FILE}";
	   $("#preview").attr("src","resources/upload/${data.IMG_FILE}")  
	 }
  }
  
</script>
</head>
<body>
<!-- Header -->
	<c:import url="/header"></c:import>

	<!-- Container -->
	<div class="container-mypage">
		<jsp:include page="mypage_tab.jsp"></jsp:include>
		
		<!-- Contents -->
		<div class="contents">
			<div class="area_tit">
				<span>개인 정보 수정</span>
			</div>
			<form action="fileUploadAjax" id="actionForm" method="post" enctype="multipart/form-data">
			    <!-- 내가 어떤 데이터를 수정할지 그 폼에 인풋을 담아서 수정할 정보를 쿼리에 주기 위한 부분 -->
			    <!-- value="${sMemNo}"를 폼으로 ajex로 넘김. case "myinfoUpdate": cnt = dao.update("member.updateMyinfo", params); 값을 가져오기 위해 -->
			    <!-- 수정할 정보를 쿼리에 주기 위해서(컨트롤러에서 /mypageAjax/{gbn}부분 업데이트문에 영향) --> 
				<input type="hidden" name="memNo" value="${sMemNo}">
	 
			<div class="mem_box">	
				<div class="contents_wrap">		
					<div class=" img_area">
					<img id="preview" src="resources/upload/${data.IMG_FILE}">
					<div>150 x 150 </div>
				
                        <td class="filBox">
                           <!-- 기존파일 --> 
                           <span class="imgOld">
                              <div id="fileDelBtn">파일 삭제</div>
                              <%-- 파일명 가져오는거 --%>
                              <c:set var="fileLength" value="${fn:length(data.IMG_FILE)}"></c:set>
                              <%-- 파일명 잘라주기 --%>
                              <c:set var="fileName" value="${fn:substring(data.IMG_FILE, 20, fileLength)}"></c:set>
                              <span id="fileName">${fileName}</span>
                           </span>
                           
                           <!-- 기존파일 삭제후 새파일 용도 --> 
                           <span class="img"> 
                              <!-- 파일명이 바뀌면 onchange 이벤트가 돈다. input type="file" 벨류 값은 파일명임 -->
                              <input type="file" name="img" onchange="readURL(this);"/> 
                              <!-- value="${data.IMG_FILE}"이게 없으면 사진 수정 없이 수정완료를 했을때 사진이 빔. -->
                              <input type="hidden" name="imgFile" id="imgFile" value="${data.IMG_FILE}" /><!-- 실 저장된 파일명 보관용 -->
                           </span>
                        </td>
					
					<div>*이미지 파일만 첨부하여 주세요 </div>
					</div>	
					<div class="join_area">
						<div class="join_tit">
						</div>
					<div class="join_info">
						<div class="input">*필수 입력 사항</div>
						<div class="email">
							<label for="email"></label>
							<input type="text" name="email" id="email" value="${data.EMAIL}" readonly="readonly" >
						</div>
						<div class="pw01">
							<label for="pw"></label>
							<input type="password" name="pwd" id="pwd" value="${data.PWD}" readonly="readonly">
						</div>
						<div class="pw02">
							<label for="pw"></label>
							<input type="password" name="cnfmPwd" id="cnfmPwd" placeholder="비밀번호 확인">
						</div>
						<div class="name01">
							<label for="name"></label>
							                   <!--xml에 있는 #이 name이야!..
							                   name은 그냥 이름일뿐 값은 따로 있어. 그 값이 input은 벨류가 입력 값이야.
							                   이게무슨말이냐. 입력값이 없으면 원래 받아온 정보를 보여주고,
							                   있으면 그 값으로 바뀜.-->
							<input type="text" name="nm" id="nm" maxlength="10" onkeyup="check(this)" value="${data.NM}">
						</div>	
						<div class="input">*선택 입력 사항</div>
						<div class="dtBrt01">
							<label for="dtBrt"></label>
							<input type="date" name="dtBrt" id="dtBrt" value="${data.DATE_BIRTH}" onblur="return chk_num(this.name);">
						</div>
						<div class="gen01">
							<div class="g_box">
							<input type="radio" name="gen" value="0" checked="false"><label for="M">남성</label>
						</div>
						<div class="g_box">
							<input type="radio" name="gen"  value="1" checked="false"><label for="F">여성</label>
						</div>
						</div>
						<div class="m_phn">
							<label for="phn"></label>
							<input type="text" name="phn" id="phn" value="${data.PHONE_NO}" onblur="return chk_num(this.name);">
						</div>
						<div class="adr_area">
							<div class="m_zcd">
								<label for="zcd"></label>
								<input type="text" name="zcd" id="zcd" value="${data.ZIP_CODE}" >		
							</div>
							<input type="button" class="adr_btn" name="adrBtn" id="adrBtn" onclick="sample6_execDaumPostcode()" value="주소검색">
							<div class="adr_01">
								<label for="adr"></label>
								<input type="text" name="adr" id="adr" value="${data.ADDRESS}">  
							</div>
						    <div class="adr_02">
								<label for="adr"></label>
								<input type="text" name="adrDtl" id="adrDtl" value="${data.DETAIL_ADDRESS}"> 
							</div>
						</div>
					</div>
					<div class="popup_btn">
						<input type="button" class="btn green" value="수정하기" id="updatemBtn">
						<input type="button" class="btn green" value="돌아가기" id="backBtn">
					</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div> 

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="true"/>
 </body>
 </html>