<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div class="chk-pw">
	   	<div class="myPage-list">
	       <h4 class="myPage-title">마이 페이지</h4>
	       <hr>
			<ul class="myPage-navPath">
				<li><a href="${cpath }/myPage">주문 조회</a></li>
				<li><a href="${cpath }/history?page=1">주문 내역</a></li>
				<li><a href="${ cpath }/chkPw" style="text-decoration: underline; text-decoration-color: #f5bd43">회원 정보</a></li>
				<li class="deleteBtn"><a href="${ cpath }/chkDelete"  >회원 탈퇴</a></li>
				
			</ul>
	   	</div>


		<div class="chk-pw-form">
			<form method="post">
			<h3 class="myPage-privacy">비밀 번호 확인</h3>
			<h4 class="myPage-privacy2">비밀번호 확인 후 접속 가능한 페이지 입니다.</h4>
				<input type="password" name="userpw" placeholder="비밀번호를 입력하세요" required>
				<input type="submit" value="입력">
			</form>
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
    
   <%@ include file="search-footer.jsp" %>
</body>
</html>