<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../header.jsp" %>

<div class="board-container">
        <div class="board-area" >
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
        <div class="board-list">
        	<div class="board-list-title">
	        	<strong class="board-total">총 <span class="board-total-count" style="color: #da0000;">${ total }</span>의 게시글이 있습니다. </strong>
	        	<div class="board-search">
	        		<form>
	        			<input type="text" name="search" placeholder="검색어를 입력하세요." value="${ param.search }">
	        			<input class="hidden" type="number" name="page" value="1">
						<button class="board-searchIcon"></button>
<!-- 	        			<input type="submit" value="검색"> -->
					</form>	        	
	        	</div>
        	</div>
        	<div class="board-list-main">
        		<div class="board-notice">
	        		<c:forEach var="tls" items="${ topList }">
	        			<div class="board-notice-list">
		        			<div class="board-notice-icon"><img src="${ cpath }/resources/src/board/notice.png"></div>
		        			<strong class="board-notice-title"><a href="${ cpath }/board/newsDetail/${tls.NOTICE_SEQ}">${ tls.TITLE }</a></strong>
		        			<strong class="board-notice-date"><fmt:formatDate value="${tls.REGDATE}" pattern="yyyy-MM-dd"/></strong>
	        			</div>
	        		</c:forEach>
        		</div>
        		
        		<div class="board-post">
        			<!--  get  -->
		        	<c:forEach var="ls" items="${ list }"> 
						<div class="board-post-list">
				        	<strong class="board-post-number">${ ls.NOTICE_SEQ }</strong>
				        	<strong class="board-post-title" ><a href="${ cpath }/board/newsDetail/${ls.NOTICE_SEQ}">${ ls.TITLE }</a></strong>
				        	<strong class="board-post-date"><fmt:formatDate value="${ls.REGDATE}" pattern="yyyy-MM-dd"/></strong>
		        		</div>
		        	</c:forEach>
		        
	        
        		</div>
        	</div>
        	<c:if test="${not empty adminlogin}">
        		<a href="${cpath }/board/newsWrite"><button>글쓰기</button></a>
      		</c:if>
        </div>
       
        
        <!-- 페이징 처리  -->
        <div class="news-paging">
        	<c:if test="${ prev }">
        		<a href="${ cpath }/board/news?search=${param.search}&page=${ begin-1 }"><button class="news-prev-btn">이전</button></a>
        	</c:if>
        	<c:forEach var="i" begin="${ begin }" end="${ end }">
        		<a href="${ cpath }/board/news?search=${param.search}&page=${ i }"><button class="news-current-btn ${ param.page == i ? 'bold' : '' }">${ i }</button></a>
        	</c:forEach>
			<c:if test="${ next }">
				<a href="${ cpath }/board/news?search=${param.search}&page=${ end + 1 }"><button class="news-next-btn">다음</button></a>
			</c:if>
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
	const searchNews = document.getElementById('searchNews')
	const searchResult = document.querySelector('input[name="search"]')
	let searchResult1 = $('.search-result').val()
	console.log(searchResult1)
	console.log(searchNews)
	console.log(searchResult)
// 	console.log(searchResult.value)
	
// 	searchNews.onclick = function(){
// 		const url =  cpath + '/searchNews' 
// 		const opt = {
// 			method : 'POST',
// 			body : JSON.stringify({
// 				'page' : 1,
// 				'search' : searchResult1
// 			}),
// 			headers: {
// 				'Content-Type': 'application/json; charset=utf-8'
// 			}
// 		}
// 		fetch(url, opt)
// 		.then(resp => resp.json)
// 		.then(json => {
// 			console.log(json)
// 		})
// 	}
</script>
<%@ include file ="../search-footer.jsp" %>
</body>
</html>