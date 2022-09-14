<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

function change_btn(e) {
   var btns = document.querySelectorAll(".btnbox");
   btns.forEach(function(btn, i) {
      if(e.currentTarget == btn) {
         btn.classList.add("active");
      }
      else {
         btn.classList.remove("active");
      }
   });
   console.log( e.currentTarget );
}
</script>
<!-- Sidebar -->
		<div class="mypageBtn">
			<ul class="btnsBox">
				<a href="mypageMyinfo">
				   <li><button class="btnbox active" onclick="change_btn(event)">내 정보</button></li>
				</a>
				<a href="mypagePasswordCheck">
				   <li><button class="btnbox" onclick="change_btn(event)">개인 정보 수정</button></li>
				</a>
				<a href="mypageBoard">
				   <li><button class="btnbox" onclick="change_btn(event)">게시글 관리</button></li>
				</a>
				<a href="mypageComment">
				  <li><button class="btnbox" onclick="change_btn(event)">댓글 관리</button></li>
				</a>
				<a href="mypageAccopany">
				   <li><button class="btnbox" onclick="change_btn(event)">동행</button></li>
				</a>      
			</ul>
		</div>