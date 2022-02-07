<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>


    <footer class="footer">
        <div class="footer-inner">
            <div class="footer-left">
                <ul>
                    <li><a>개인정보 처리방침</a></li>
                    <li><a>위치정보 이용약관</a></li>
                    <li><a>QnABoard</a></li>
                </ul>
            </div>
            <div class="footer-right">
                <ul>
                    <li>Coded Burger</li>
                    <li>공동대표 : 5조 전원</li>
                    <li>사업자등록번호 : 1234-56-789</li>
                    <li>회사전화 : 010-7374-5328</li>
                    <li>COPYRIGHT © 2019 ALL RIGHTS RESERVED BY McDonald's.</li>
                </ul>
            </div>
            <div class="footer-icon">
                <a href=""><img src="${ cpath }/resources/src/footer/fb.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/insta.png" alt=""></a>
                <a href=""><img src="${ cpath }/resources/src/footer/youtube.png" alt=""></a>
            </div>
        </div>
    </footer>

<script>
	const cpath = '${ cpath }'
	const menuOpen = document.getElementById('menuOpen')
	const menuClose = document.getElementById('menuClose')
	const slide = document.querySelector('.slide')
	const mainInner = document.querySelector('.main-inner')

	// 모달
	const searchIcon = document.querySelector('.search-icon')
	const closeModal = document.getElementById('closeModal')
	const overlay = document.querySelector('.overlay')
	const modal = document.querySelector('.modal')
	
	const promotionImageList = document.querySelector('.promotion-imageList-home')
	console.log(promotionImageList)
	
	let value = 0

	const unit = 1700

	// 메인 페이지 +,- 버튼	
	let cnt1 = 1
	let cnt2 = 2
	console.log(cnt1)
	console.log(cnt2)
	menuOpen.onclick = function(){		
		promotionImageList.style.maxHeight = '1400px'
			menuOpen.classList.add('hidden')
			menuClose.classList.remove('hidden')	
		}
		
	menuClose.onclick = function(){
		promotionImageList.style.maxHeight = '900px'
		menuOpen.classList.remove('hidden')
		menuClose.classList.add('hidden')
	}
// 	menuOpen.addEventListener('click', function(){
// 		btnOpenHandler()
// 	})
		
// 	menuClose.addEventListener('click', function(){
// 		btn1Handler()
// 	})
	
	window.addEventListener('load', function(){
 		promotionAjax()
 	})
	
	// 기존 버튼형 슬라이더
	$('.main-slide > .page-btns > div').click(btnSlider)

	// 좌/우 버튼 추가 슬라이더
	// 자동 슬라이드 기능도 같이 동작함
	$('.main-slide > .side-btns > div').click(slider)

	window.addEventListener('load', function(){
		setMoveInterval()
	})
	
	// 모달 함수
	searchIcon.addEventListener('click', function(){
		modalOpen()
	})
	
	closeModal.addEventListener('click', function(){
		modalClose()
	})
	

</script>


</body>
</html>