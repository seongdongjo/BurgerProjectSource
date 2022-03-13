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

<%@ include file = "../footer.jsp" %>
<%@ include file ="../search-footer.jsp" %>
