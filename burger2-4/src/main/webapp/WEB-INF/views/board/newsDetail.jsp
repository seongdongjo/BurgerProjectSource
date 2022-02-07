<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="board-area">
	<h1 class="board-title">새로운 소식</h1>
	<ul class="board-ul">
		<li>Home</li>
		<li>•</li>
		<li>Board</li>
		<li>•</li>
		<li>새로운 소식</li>
	</ul>
	<img src="${ cpath }/resources/src/board/board.jpg">
</div>

<%-- <p>${ dto }</p> --%>
<div class="detail-news">
	<div class="detail-header">
		<div class="detail-title">${dto.title }</div>
		<div class="detail-num">
<%-- 			<fmt:formatDate var="formatRegDate" value="${ dto.regDate }" pattern="yyyy-MM-dd"/> --%>
			<div class="detail-regDate">${ dto.regDate }</div>
			<div class="detail-cnt">&nbsp;<span>|</span> &nbsp;${dto.cnt }</div>
		</div>
	</div>
</div>
	<hr class="detail-hr">
	<div class="detail-content">
			<div class="detail-img"><img src="${ dto.fileName }"></div>
	</div>

	<!-- admin로그인 시 수정 삭제 가능  -->
	<c:if test="${not empty adminlogin }">
	<div class="btn-list">
		<button id="newsModify" data-seq="${dto.notice_seq }">수정</button>
		<button id="newsDelete" data-seq="${dto.notice_seq }">삭제</button>
<%-- 	<a href="${ cpath }/board/newsModify/${ dto.notice_seq }">수정</a> --%>
	</div>
	</c:if>
	
	<hr class="detail-hr1">
	<div class="btn-list1">
		<button class="prev-btn"></button>
		<a href="${ cpath }/board/news?page=1"><button class="news-list-btn">목록보기</button></a>
		<button class="next-btn"></button>
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
			<a href=""><img src="${ cpath }/resources/src/footer/fb.png"
				alt=""></a> <a href=""><img
				src="${ cpath }/resources/src/footer/insta.png" alt=""></a> <a
				href=""><img src="${ cpath }/resources/src/footer/youtube.png"
				alt=""></a>
		</div>
	</div>
</footer>

<script>
	const cpath = '${ cpath }'
	let seq = ${ dto.notice_seq }
	
	const detailTitle = document.querySelector('.detail-title')
	const detailRegDate = document.querySelector('.detail-regDate')
	const detailCnt = document.querySelector('.detail-cnt')
	const detailContent = document.querySelector('.detail-content')
	const prevBtn = document.querySelector('.prev-btn')
	const nextBtn = document.querySelector('.next-btn')
	const listBtn = document.querySelector('.news-list-btn')
	
	const detailImg = document.querySelector('.detail-img')
	
	const newsModify = document.getElementById('newsModify')
	const newsDelete = document.getElementById('newsDelete')
	
	console.log(detailTitle)
	console.log(detailRegDate)
	console.log(detailCnt)
	console.log(detailContent)
	console.log(prevBtn)
	console.log(nextBtn)
	
	nextBtn.onclick = function(event){
		event.preventDefault()
		const url = cpath + '/btnNewsDetail/' + (seq + 1)
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)

		
			detailTitle.innerText = ''
			detailTitle.innerText += json.title
			detailRegDate.innerText = ''
			detailRegDate.innerText += (json.regDate + ' | ')

			detailCnt.innerText = ''
			detailCnt.innerText += json.cnt
// 			detailContent.innerText = ''
// 			detailContent.innerText += json.content
			
		
			detailImg.innerHTML = ''
			detailImg.innerHTML += '<img src="'+ json.fileName +'">'
// 			detailContent.innertHTML += detailImg
		})
		seq++
	}
	
	prevBtn.onclick = function(event){
		event.preventDefault()
		const url = cpath + '/btnNewsDetail/' + (seq-1)
		const opt = {
			method : 'get'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			
		
			
			detailTitle.innerText = ''
			detailTitle.innerText += json.title
			detailRegDate.innerText = ''
			detailRegDate.innerText += (json.regDate + ' | ') 
			detailCnt.innerText = ''
			detailCnt.innerText += json.cnt
// 			detailContent.innerText = ''
// 			detailContent.innerText += json.content
			
			detailImg.innerHTML = ''
			detailImg.innerHTML += '<img src="'+ json.fileName +'">'
// 			detailContent.innertHTML += detailImg
		})
		seq--
	}
	listBtn.onclick = function(){
		location.href = cpath + '/board/news'
	}
	newsModify.onclick = function(event){
		let seq = parseInt(event.target.dataset.seq)
		location.href = cpath + '/board/newsModify/' + seq
	}
	newsDelete.onclick = function(event){
		let seq = event.target.dataset.seq
		if(confirm(seq + '번 게시글을 삭제하시겠습니까')){
			 location.href= cpath + '/board/newsDelete/' + seq
		}
	}
</script>
<%@ include file ="../search-footer.jsp" %>
</body>
</html>