<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="find-form">
	<p>PW찾기 - 이메일 입력하기</p>
	<input name="email" placeholder="이메일을 입력해주세요">
	<input id="findIdBtn" type="button" value="입력하기">
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
		const cpath = '${cpath}'
		const findIdBtn = document.getElementById('findIdBtn')
		const email = document.querySelector('input[name="email"]')
		
		findIdBtn.onclick = function(){
    		console.log(email.value)
    		
    		const url = cpath +'/mailtoFindPw/' + email.value + '/'
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			if(json.status == 'OK') {
    				alert('임시 비밀번호가 발송되었습니다')
    				location.href = cpath + '/login'
    			}
    			else {
    				alert('등록되지 않은 이메일입니다.\n이메일을 확인해주세요.')
    			}
    		})
    	}
		
		
	</script>
</body>
</html>