<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="menu-container">

	<div class="menu-top">
		<c:choose>
			<c:when test="${table eq 'mcmorning'}">
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.MCMORNING_TABLE_BACKGROUND});">
						<h1 class="menu-title">맥모닝</h1>
						<p class="menu-text">${top.MCMORNING_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>맥모닝</li>	
						</ul>
					</div>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'burger'}">
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.BURGER_TABLE_BACKGROUND});">
						<h1 class="menu-title">버거</h1>
						<p class="menu-text">${top.BURGER_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>버거</li>
						</ul>
					</div>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'side'}">
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.SIDE_TABLE_BACKGROUND});">
						<h1 class="menu-title">사이드</h1>
						<p class="menu-text">${top.SIDE_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>사이드</li>
						</ul>
					</div>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'mccafe'}">
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.MCCAFE_TABLE_BACKGROUND});">
						<h1 class="menu-title">맥카페</h1>
						<p class="menu-text">${top.MCCAFE_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>맥카페</li>
						</ul>
					</div>
				</c:forEach>
			</c:when>
			<c:when test="${table eq 'drink'}">
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.DRINK_TABLE_BACKGROUND});">
						<h1 class="menu-title">음료</h1>
						<p class="menu-text">${top.DRINK_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>음료</li>
						</ul>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="top" items="${tList}">
					<div class="menu-top-background" style="background-image: url(${top.DESSERT_TABLE_BACKGROUND});">
						<h1 class="menu-title">디저트</h1>
						<p class="menu-text">${top.DESSERT_TABLE_DESCRIPTION}</p>
						<ul class="menu-ul">
							<li><a href="${cpath}">Home</a></li>
							<li>•</li>
							<li>Menu</li>
							<li>•</li>
							<li>디저트</li>
						</ul>
					</div>
				</c:forEach>
			</c:otherwise>		
		</c:choose>	
	</div>
	
	<div class="menu-detail">
		<div class="menu-detail-name"></div>
		<div class="menu-detail-img"></div>
		<div class="menu-detail-desc"></div>
		<div class="menu-detail-time"></div>
		<div class="menu-detail-info">
			<div class="menu-detail-nutrition">
				<div class="menu-nutrition-info">
					<h4>영양정보</h4> 
					<button class="menu-btn-plus">+</button>
					<button class="menu-btn-minus hidden">-</button>
				</div>
				<table class="nutri-table hidden" border="0" cellpadding="15" cellspacing="0">
					<thead>
						<tr>
							<th>영양소</th>
							<th>중량(g)</th>
							<th>중량(ml)</th>
							<th>열량</th>
							<th>당</th>
							<th>단백질</th>
							<th>포화지방</th>
							<th>나트륨</th>
							<th>카페인</th>
						</tr>
					</thead>
					<tbody>
						<tr class="nutrition-content"></tr>
						<tr class="nutrition-thresholds"></tr>
					</tbody>
				</table>
			</div>
			
			<div class="menu-allergy-info">
				<h4>알레르기 정보</h4>
				<button class="allery-btn-puls">+</button>
				<button class="allery-btn-minus hidden">-</button>
			</div>
			<div class="menu-detail-allergy hidden"></div>
		</div>
	</div>
	
</div>
	<div class="detail-btn">
		<button class="detail-prev-btn"></button>
		<button class="detail-next-btn"></button>
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
	const cpath = '${cpath}'
	const table = '${table}'
	const seq = '${sequence}'
	const name = document.querySelector('.menu-detail-name')
	const img = document.querySelector('.menu-detail-img')
	const desc = document.querySelector('.menu-detail-desc')
	const time = document.querySelector('.menu-detail-time')
	const con = document.querySelector('.nutrition-content')
	const thres = document.querySelector('.nutrition-thresholds')
	const aller = document.querySelector('.menu-detail-allergy')
	
	getDetailJson(table,seq)
	
	const nutriBtn1 = document.querySelector('.menu-btn-plus')
	const nutriBtn2 = document.querySelector('.menu-btn-minus')
	const allergyBtn1 = document.querySelector('.allery-btn-puls')
	const allergyBtn2 = document.querySelector('.allery-btn-minus')
	const nutriTable = document.querySelector('.nutri-table')
	
	const detailPrev = document.querySelector('.detail-prev-btn')
	const detailNext = document.querySelector('.detail-next-btn')
	
	let btnSeq = ${sequence}
	
	detailPrev.addEventListener('click',function(){
		event.preventDefault()
		getPrev(table,btnSeq)
	})
	
	detailNext.addEventListener('click',function(){
		event.preventDefault()
		getNext(table,btnSeq)
	})
	
		// 2022-01-30 추가 
		nutriBtn1.onclick = function(){
			nutriTable.classList.remove('hidden')
			nutriBtn2.classList.remove('hidden')
			nutriBtn1.classList.add('hidden')
		}
		nutriBtn2.onclick = function(){
			nutriTable.classList.add('hidden')
			nutriBtn1.classList.remove('hidden')
			nutriBtn2.classList.add('hidden')
		}
		allergyBtn1.onclick = function(){
			aller.classList.remove('hidden')
			allergyBtn2.classList.remove('hidden')
			allergyBtn1.classList.add('hidden')
		}
		allergyBtn2.onclick = function(){
			aller.classList.add('hidden')
			allergyBtn1.classList.remove('hidden')
			allergyBtn2.classList.add('hidden')
		}
	
</script>
	<%@ include file ="../search-footer.jsp" %>
</body>
</html>