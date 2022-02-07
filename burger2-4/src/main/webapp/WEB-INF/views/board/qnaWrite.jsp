<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

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
        
        <!--  qna client 작성 form -->
        <div class="QnA-write-form">
	        <form method="post">
	        	<input type="hidden" name="writer" value="${ login.userid }" readonly>
	        	<input type="hidden" name="email" value="${ login.email }">
	        	<input type="hidden" name="phone" value="${ login.phone }">
	        	<div class="QnA-write-top">
		        	<span>제목&nbsp;</span><input class="QnA-write-title" name="title" required autofocus>
		        	<select name="qnaType">
		        		<option>질문유형</option>
		        		<option ${ param.qnaType == '매장' ? 'selected' : '' } value="매장">매장</option>
		        		<option ${ param.qnaType == '배달' ? 'selected' : '' } value="배달">배달</option>
		        		<option ${ param.qnaType == '주문' ? 'selected' : '' } value="주문">주문</option>
		        	</select>
	        	</div>
	        	<div class="QnA-write-content">
	        		<textarea class="QnA-write-content1" rows="5" cols="10" name="content" placeholder="문의하실 내용을 입력해주세요"></textarea>
	        		<p>0 /1000</p>
	        	</div>
	        	
	        	<!--  ipAddress controller에서 처리   -->
	<!--         	<input type="hidden" name="ipAddress" value=""> -->
				<input type="hidden" name="flag" value="n"> 
				<input type="submit" value="작성하기">
	        </form>
	        
	        <div class="QnA-write-backBtn"><a href="${ cpath }/board/question?page=1"><button class="QnA-write-backBtn1">Back</button></a></div>
        </div>
    </div>
<%@ include file="../footer.jsp" %>
<%@ include file ="../search-footer.jsp" %>
