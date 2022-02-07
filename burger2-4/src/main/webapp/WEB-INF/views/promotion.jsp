<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

    <div class="promotion-container">
        <div class="visual-area">
            <img src="${ cpath }/resources/src/promotion/promotion-main.jpg">
            <div class="visual-title">맥도날드 프로모션</div>
                <ul class="visual-ul">
                    <li>Home</li>
                    <li>•</li>
                    <li>What's New</li>
                    <li>•</li>
                    <li>맥도날드 프로모션</li>
                </ul>
        </div>
        
        <div class="promotion-imageList">   
        </div>
    </div>

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
 	    
 	    // 모달
 	   	const searchIcon = document.querySelector('.search-icon')
 	   	const closeModal = document.getElementById('closeModal')
 	   	const overlay = document.querySelector('.overlay')
 	   	const modal = document.querySelector('.modal')
 	    
 		const promotionImageList = document.querySelector('.promotion-imageList')
 		console.log(promotionImageList)
		
 		window.addEventListener('load', function(){
 			promotionAjax()
 		})
 		
 		// 모달 함수
		searchIcon.addEventListener('click', function(){
			modalOpen()
		})
	
		closeModal.addEventListener('click', function(){
			modalClose()
		})
    </script>
 <%@ include file="search-footer.jsp" %>
</body>
</html>