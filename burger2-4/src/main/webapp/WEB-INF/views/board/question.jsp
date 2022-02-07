<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%-- <p>${ list }</p> --%>
<div class="board-container">
        <div class="board-area" >
            <h1 class="board-title">문의사항</h1>
            <ul class="board-ul">
                <li>Home</li>
                <li>•</li>
                <li>Board</li>
                <li>•</li>
                <li>문의사항</li>
            </ul>
            <img src="${ cpath }/resources/src/board/board.jpg">
        </div>
        
        <div class="QnA-top">
        	<div class="QnA-top-left">
	        	<div><a href="${ cpath }/board/qnaWrite"><button class="QnA-write">Q&A 작성하기</button></a></div>
	        	<div>
	        	<c:if test="${ not empty login }">
<!-- 	        	<form method="post"> -->
	        		<input class="hidden" type="number" name="page" value="1">
	        		<input type="hidden" name="writer" value="${ login.userid }">
	        		<button class="QnA-search">나의 Q&A 조회</button>
<!-- 	        	</form> -->
	        	</c:if>
	        	</div>
        	</div>
        	<div class="QnA-top-right">
<!--         		<div class="QnA-onOff-check"> -->
<!--         			<span>내Q&A보기</span> -->
<!--         		</div> -->
<!-- 	        	<div class="QnA-onOff"> -->
<!-- 		        	<input type="checkbox" id="onOffBox" name="onOff"> -->
<!-- 					<label for="onOffBox" id="boxLabel"><span></span></label> -->
<!-- 	        	</div> -->
	        	<div class="QnA-result">
	        		<form>
		        		<select name="result">
		        			<option>답변상태</option>
		        			<option ${param.result == 'n' ? 'selected' : '' } value="n">미답변</option>
		        			<option ${param.result == 'y' ? 'selected' : '' } value="y">답변완료</option>
		        		</select>
		        		<input class="hidden" type="number" name="page" value="1">
		        		<button class="result-search">검색</button>
	        		</form>
	        	</div>
        	</div>
        </div>
        
        <div class="QnA-content">
        	<div class="QnA-content-left">
        		<div class="QnA-content-result">답변상태</div>
        		<div class="QnA-content-title">제목</div>
        		<div class="QnA-content-writer">작성자</div>
        		<div class="QnA-content-regDate">작성일</div>
        	</div>
        	
        	<c:forEach var="ls" items="${ list }">        	
        		<div class="QnA-content-inner">
					<div class="QnA-inner-result">${ ls.RESULT == 'n' ? '미답변' : '답변완료' }</div>
					<div class="QnA-inner-title" data-idx="${ ls.QNA_SEQ }">
						<a href="${ cpath  }/board/questionDetail/${ ls.QNA_SEQ }">${ ls.CONTENT }</a> 
<%-- 						<button class="question" id="que-${ ls.qna_seq }"><span id="que-1-toggle">+</span><span>${ ls.title }</span></button>  --%>
<%-- 							<div class="QnA-answer" id="ans-${ ls.qna_seq }"></div> --%>
<%-- 					<div class="QnA-answer hidden" data-idx="${ ls.qna_seq }"></div>	 --%>
					</div>
					<div class="QnA-inner-writer">${ ls.WRITER }</div>
					<div class="QnA-inner-regDate"><fmt:formatDate value="${ ls.REGDATE }" pattern="yyyy-MM-dd"/></div>
				</div>
			</c:forEach>
        </div>
        
        <!-- 페이징 처리  -->
        <div class="news-paging">
        	<c:if test="${ prev }">
        		<a href="${ cpath }/board/question?page=${ begin-1 }&result=${ param.result }"><button class="news-prev-btn">이전</button></a>
        	</c:if>
        	<c:forEach var="i" begin="${ begin }" end="${ end }">
        		<a href="${ cpath }/board/question?page=${ i }&result=${ param.result }"><button class="news-current-btn ${ param.page == i ? 'bold' : '' }">${ i }</button></a>
        	</c:forEach>
			<c:if test="${ next }">
				<a href="${ cpath }/board/question?page=${ end + 1 }&result=${ param.result }"><button class="news-next-btn">다음</button></a>
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
	const inner = document.querySelectorAll('.QnA-content-inner')
	const innerTitle = document.querySelectorAll('.QnA-inner-title')
	const qnaAnswer = document.querySelector('.QnA-answer')
	
	// 추가
	const items = document.querySelectorAll('.question')
	
	console.log(items)
	console.log(qnaAnswer)
	console.log(innerTitle)
	
// 	innerTitle.forEach(dto => {
// 		dto.onclick = function(event){
// 			console.log("event target :", event.target)
// 			let ch = event.target.childNodes
// 			let target = event.target.parentNode.children[1]
// 			let pn = event.target.parentNode
			
// 			console.log("pn", pn)
// 			console.log("target", target)
// 			console.log("ch",ch)
			
// 			let idx = event.target.dataset.idx
// 			console.log(idx)
			
// 			const url = cpath + '/qnaReply/' + idx
// 			const opt = {
// 				method : 'get'
// 			}
// 			fetch(url, opt)
// 			.then(resp => resp.json())
// 			.then(json => {
// 				console.log(json)
// // 				console.log(json.dto)
				
// // 				console.log(ch[1].classList.contains('hidden'))
				
// 				if(json.msg){
// 					ch[1].innerText = json.msg
// 					target.style.height = '70px'
// 					target.style.transitionDuration = '0.3s'
// 					pn.style.maxHeight = '160px'
// 					ch[1].classList.remove('hidden')
// 				}
// 				else{
// 					ch[1].innerText = ''
// 					ch[1].innerText += json.dto.content
// 					ch[1].innerText += json.dto.writeDate
// 					target.style.height = '70px'
// 					target.style.transitionDuration = '0.3s'
// 					pn.style.maxHeight = '160px'
// 					ch[1].classList.remove('hidden')
// 				}
				
// // 				
// 			})
			
// 			if(ch[1].classList.contains('hidden') == false){
// 				console.log('hidden : false')
// 				console.log('childNodes ', event.target.childNodes[1])
// 				event.target.childNodes[1].style.display = 'none'
// 				event.target.childNodes[1].classList.add('hidden')
// 				event.target.childNodes[1].style.height = '60px'
// 				pn.style.maxHeight = '60px'
// 				event.target.childNodes[1].style.transitionDuration = '0.3s'	
// 			}
// 			else{
// 				console.log("hidden : true")
// 				console.log('childNodes ', event.target.childNodes[1])
// 				event.target.childNodes[1].style.display = 'block'
// 				event.target.childNodes[1].classList.remove('hidden')
// 				event.target.childNodes[1].style.height = '70px'
// 				pn.style.maxHeight = '160px'
// 				event.target.childNodes[1].style.transitionDuration = '0.3s'
// 			}
// 			console.log(ch[1].classList.contains('hidden'))
					
				
// 			}
// 		})

</script>
<%@ include file ="../search-footer.jsp" %>

</body>
</html>