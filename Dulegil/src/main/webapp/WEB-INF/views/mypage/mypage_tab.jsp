<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	const tabList = document.querySelectorAll('.btnsBox a li');
	var pathname = $(location).attr('pathname');
	pathname = pathname.substr(9);
	console.log(pathname);
	console.log(tabList[1].parentNode.classList);
	for(var i=0; i<tabList.length; i++){
		if(tabList[i].parentNode.classList == pathname){
			tabList[i].classList.add('tab_on');
		};
	}
	
	if(pathname == "mypageMyinfoUpdate"){
		tabList[1].classList.add('tab_on');
	}

});





</script>
<!-- Sidebar -->
		<div class="mypageBtn">
			<ul class="btnsBox">
				<a href="mypageMyinfo" class="mypageMyinfo">
					<li class="btnbox li">내 정보</li>
				</a>
				<a href="mypagePasswordCheck" class="mypagePasswordCheck">
				   	<li class="btnbox li">개인 정보 수정</li>				
				</a>
				<a href="mypageBoard" class="mypageBoard">
			   		<li class="btnbox li">게시글 관리</li>					
				</a>			   	
				<a href="mypageComment" class="mypageComment">
			   		<li class="btnbox li">댓글 관리</li>
				</a>
				<a href="mypageAccompany" class="mypageAccompany">				
			   		<li class="btnbox li">동행 </li>
				</a>
			   
				
			</ul>
		</div>