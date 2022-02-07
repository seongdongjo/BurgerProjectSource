<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="menu-container">
        <div class="menu-top"></div>
	
		<div class="menu-list">
			<div class="menu-total"><p>•</p>${ cnt } Products</div>
			<div class="menu-product-list"></div> 
		</div>
	
		<div class="menu-button">
			<button id="menuOpen"></button>
			<button id="menuClose" class="hidden" style="background-image: url(${ cpath}/resources/src/마이너스btn.png)"></button>
		</div>
	</div>


<!-- <div class="menu-list-inner"> -->

<!-- </div> -->

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
	// 메뉴 클릭
		const cpath = '${ cpath }'
		const table = '${ table }'
		
// 		let table = table1.toUpperCase() + '_TABLE'
		
		const cnt = '${ cnt }'
		const itemHeight = 600
		
		const topList = document.querySelector('.menu-top')
		const menuList = document.querySelector('.menu-product-list')
		const menuLink = document.querySelectorAll('.top-menu-li:nth-child(1) a')
		const detail = document.querySelectorAll('.menu-product-list div')

		console.log(topList)
		if(table == '') { table = 'burger_table' }
	
		getJson(table)
			
		
		const menuOpen = document.getElementById('menuOpen')
		const menuClose = document.getElementById('menuClose')
		
		let cnt1 = Math.ceil(cnt / 6)
		let cnt2 = 2
		console.log(cnt1)
		console.log(cnt2)
		menuOpen.onclick = function(){

				
				menuList.style.maxHeight = cnt2  * 600 + 'px'
				
				console.log(cnt2)
				if(cnt1 == cnt2){
					menuOpen.classList.add('hidden')
					menuClose.classList.remove('hidden')
					cnt2 = 1
				}
				cnt2++
			}
		
		menuClose.onclick = function(){
			menuList.style.maxHeight = '600px'
			menuOpen.classList.remove('hidden')
			menuClose.classList.add('hidden')
		}
	
		// table의 이름을 판별해서 burger나 mcmorning이면 dom을 다르게 불러오기
		// 그럼 한페이지 안에서 처리가능할듯
		

    </script>
	<%@ include file ="../search-footer.jsp" %>
</body>
</html>