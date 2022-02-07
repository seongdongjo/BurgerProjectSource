<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="board-area">
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


<div class="que-Detail">

	<div class="detail-question">
		<div class="detail-header">
			<div class="detail-title">${que.title }</div>
			<div class="detail-num">
				<div class="detail-regDate">${ que.regDate }</div>
			</div>
		</div>
		<hr class="detail-hr">
		<div class="detail-content">
			${que.content }
		</div>
	</div>
		
		
	<div class="reply-detail">
		<c:if test="${ rep == '댓글 작성 전 입니다' }">
			<p class="rep-none">${ rep }</p>	
		</c:if>
		<c:if test="${ rep != '댓글 작성 전 입니다' }">
			<div class="replt-title">
				<div>댓글</div>
			</div>
			<div class="reply-inner">	
				<div class="rep-content">${ rep.content }</div>
			</div>
		</c:if>
	</div>
	<div class="que-detail-btn">
		<a href="${ cpath }/board/question?page=1"><button class="news-list-btn">목록보기</button></a>
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
<%@ include file = "../footer.jsp" %>
<%@ include file ="../search-footer.jsp" %>
