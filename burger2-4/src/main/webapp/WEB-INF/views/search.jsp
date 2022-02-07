<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="search-header">
	<h1 class="search-title">검색결과</h1>
	<ul class="search-ul">
		<li>Home</li>
		<li>•</li>
		<li>검색결과</li>
	</ul>
</div>
<div class="search-menu">
	<form action="${ cpath }/search">
		<select name="type">
			<option ${ param.type == 'burger' ? 'selected' : '' } value="burger">버거</option>
			<option ${ param.type == 'mcmorning' ? 'selected' : '' } value="mcmorning">맥모닝</option>
			<option ${ param.type == 'side' ? 'selected' : '' } value="side">사이드</option>
			<option ${ param.type == 'mccafe' ? 'selected' : '' } value="mccafe">맥카페</option>
			<option ${ param.type == 'drink' ? 'selected' : '' } value="drink">음료</option>
			<option ${ param.type == 'dessert' ? 'selected' : '' } value="dessert">디저트</option>
		</select> 
			<input name="search" placeholder="메뉴를 입력해주세요" value="${ param.search }"> 
			<input type="submit" value="검색하기">
	</form>
</div>
<div class="search-result">
	<p><span class="search-name">
	<c:if test="${ not empty param.search }">
		"${ param.search }"
	</c:if>
	<c:if test="${ empty param.search }">
		"${ param.type }"
	</c:if>
	</span>에 대해 총  ${ list.size() }건의 검색결과가 있습니다</p>
</div>
<hr class="search-hr">


<div class="search-content">
	<c:forEach var="ls" items="${ list }">
		<div class="search-content-inner">
			<c:if test="${ type == 'BURGER' }">
				<img src="${ ls.BURGER_IMG}">
				<div class="search-content-name">
					<span>${ ls.BURGER_NAME }</span>
				</div>
			</c:if>
			<c:if test="${ type == 'MCMORNING' }">
				<img src="${ ls.MCMORNING_IMG}">
				<div class="search-content-name">
					<span>${ ls.MCMORNING_NAME }</span>
				</div>
			</c:if>
			<c:if test="${ type == 'SIDE' }">  
				<img src="${ ls.SIDE_IMG}">
				<div class="search-content-name">
					<span>${ ls.SIDE_NAME }</span>
				</div>
			</c:if>
			<c:if test="${ type == 'MCCAFE' }">
				<img src="${ ls.MCCAFE_IMG}">
				<div class="search-content-name">
					<span>${ ls.MCCAFE_NAME }</span>
				</div>
			</c:if>
			<c:if test="${ type == 'DRINK' }">
				<img src="${ ls.DRINK_IMG}">
				<div class="search-content-name">
					<span>${ ls.DRINK_NAME }</span>
				</div>
			</c:if>
			<c:if test="${ type == 'DESSERT' }">
				<img src="${ ls.DESSERT_IMG }">
				<div class="search-content-name">
					<span>${ ls.DESSERT_NAME }</span>
				</div>
			</c:if>
			
			
		</div>
	</c:forEach>
</div>

   	<div class="menu-button">
		<button id="menuOpen"></button>
		<button id="menuClose" class="hidden" style="background-image: url(${ cpath}/resources/src/마이너스btn.png)"></button>
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
 <%@ include file="search-footer.jsp" %>
<script>
	const cnt = '${ list.size() }'
	const menuOpen = document.getElementById('menuOpen')
	const menuClose = document.getElementById('menuClose')
	const searchContent = document.querySelector('.search-content')
	
	let cnt1 = Math.ceil(cnt / 6)
	let cnt2 = 2
	
	menuOpen.onclick = function() {

		searchContent.style.maxHeight = cnt2 * 600 + 'px'

		console.log(cnt2)
		if (cnt1 == cnt2) {
			menuOpen.classList.add('hidden')
			menuClose.classList.remove('hidden')
			cnt2 = 1
		}
		cnt2++
	}

	menuClose.onclick = function() {
		searchContent.style.maxHeight = '600px'
		menuOpen.classList.remove('hidden')
		menuClose.classList.add('hidden')
	}
</script>

</body>
</html>