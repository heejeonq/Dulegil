<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/jscss.jsp" flush="true"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/mainCon.css" />
<link rel="stylesheet" href="resources/css/board.css" />
<link rel="stylesheet" href="resources/css/withDulDet.css" />
<title>동행상세</title>
<style>
.update{
	display:none;
}
.commentBox span{
	font-size:13px;
    line-height: 50px;
    color: #808080;
    float:left;
}
</style>
<!-- 제이쿼리 -->
<script>
$(document).ready(function(){
	reloadList();
	$(".moreBtn").on("click",function(){
		$(".moreBtn").show();
	})
})

</script>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp" flush="true"/>

	<!-- Container -->

	<div class="container-main">
      
      <div class="mainWrap">
      <div class="tit">동행구하기</div>
      <div class="col"></div>
      
      <div class="midBox">
      <div class="emptyBox"></div>
      <div class="tit_tt">같이 돌아요</div>
      <div class="tit_tt">
         <div class="tit_cos">
         <img src="resources/images/gitIcon.png" />
         1코스-수락·불암산코스   노원구,도봉구   18.6km   8시간 10분
         </div>
   
         <div class="tit_Ddate">| 2022-09-01
         <img src="resources/images/gitIcon.png" /></div>
         
         
      </div>
      <div class="midBox">
         <div class="intro">
            <div class="tit_writer">
            <img src="resources/images/sample1.jpg" />양똥이  </div><span>&nbsp;&nbsp;</span>
            <div class="age"> 만 30 세 </div>         
            <div class="gender"> 여 </div>         
            <div class="trust">
               <img src="resources/images/Mstar.png"  />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar.png" />
               <img src="resources/images/Mstar2.png" />
            </div>
         </div>
         
         
         <div class="tit_date">
         작성일  
         2022-08-08</div>
         
      </div>
      
      <hr/>
      <div class="conBox">
      <div class="emptyBox"></div>
      <div class= "imgg">
      <img src="resources/images/완주사진.jpg" />
      <div class="te"> 지도앞에서 한컷</div>
      </div>
      <div class="btnBox">
         <div class="withMBtn">
         <span class="withMB">
         <img src="resources/images/manico.png" />
         </span>
         <div class="withMTitW">
         <span class="withMTit">동행신청</span>   
         </div>               
         </div>
         <div class="reporBtn">
         <span class="report">
         <img src="resources/images/report1.png" />
         </span>
         <span class="reporTit">신고하기</span>         
         </div>
         
      </div>
         
   <div class="emptyBox"></div>      
      <div class="box2">
      
         
         
         <input type="button" class="btn" id="upBtn" value="수정"/>
         <input type="button" class="btn" id="delBtn" value="삭제"/>      
         <input type="button" class="btn" id="listBtn" value="목록"/>
      </div>
            
      </div>
   
      

      </div>
      
      
      <div class="emptyBox"></div>
      <div class="emptyBox"></div>
         
         
      <hr/>
      <div class="DulList">
      <table>
      <colgroup>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      <col width="36.4px"/>
      </colgroup>
         <thead>
            <tr>
               <th colspan="5">
               <img src="resources/images/manico.png" />
               동행신청자 / 2명</th>

            </tr>
         </thead>
         <tbody>
            <tr>
               <td><div class="withM"> zanmang_loopy6</div> </td>
               <td> <div class="withM"> babo_bbororo1</div></td>
               <td> <div class="withM"> kkkrong2</div></td>
               <td> <div class="withM"> kkkrong3</div></td>
               <td> <div class="withM"> zanmang_loopy4</div></td>
            </tr>
            <tr class="m_Man">
               <td><div class="withM">zanmang_loopy</div></td>
               <td> <div class="withM">babo_bbororo</div></td>
               <td> <div class="withM">kkkrong</div></td>
               <td><div class="withM"> zanmang_loopy</div></td>
               <td><div class="withM">kkkrong3</div> </td>
            </tr>
         
         </tbody>
      
      </table>
      
      
      </div>
       <div class="more">
            <input type="button" class="moreBtn" value="더보기+" />
         </div>
         
         
      <hr/>
         <div class= mainview3>
            <div class="box3">
               <div class="comment">comment</div>
               
               <div class="commentBox">
               <input type="text" class=commentBoxT placeholder="댓글을 입력하세요" />
               </div>
               
               <input type="button" class="regBtn" value="등록"/>
            </div>
            <div class="coll"></div>
         </div>
         
         <div class="mainview4">
         
            <div class="iconBox">
               <img src="resources/images/detailViewIcon.png" />
            </div>
         <div class="idBox">
            <img src="resources/images/sample2.jpg" class="bbo"/> 지존루피
          </div>         
          <div class="commentDe">와 저도 가보고싶어요와 저도 가보고싶어요<br/>
                다음에 갈땐 나도 데려가요가요가요가요<br/>
                   나도 둘레둘레 할래
          </div>
          <div class="date">2022-08-13</div>
          <div class="more">
            <input type="button" class="moreBtn" value="더보기+" />
         </div>
         </div>
         
         
   
      
      

         </div>
         </div>
   
      </div>
      





	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="true"/>
</body>
</html>