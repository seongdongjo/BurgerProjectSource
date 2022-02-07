<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="find-form">
	<p>ID찾기 - 이메일 입력하기</p>
	<input name="email" placeholder="이메일을 입력해주세요">
	<input id="findPwBtn" type="button" value="입력하기">
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
		const findPwBtn = document.getElementById('findPwBtn')
		const email = document.querySelector('input[name="email"]')
		
		findPwBtn.onclick = function(){
    		console.log(email.value)
    		
    		const url = cpath + '/mailChk/' + email.value + '/'
    		const opt = {
    			method : 'get'
    		}
    		fetch(url,opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			if(json.status == 'OK'){
    				const url1 = cpath + '/mailtoFindId/' + email.value + '/'
    				const opt1 = {
    						method : 'get'
    				}
    				fetch(url1, opt1)
    				.then(resp => resp.json())
    				.then(json => {
    					if(json.status == 'OK'){
    						alert('고객님의 이메일로 ID가 발송되었습니다')
    						location.href = cpath + '/login'
    					}
    				})
    			}
    			else{
    				alert('등록되지 않은 이메일 입니다. \n 이메일을 확인해주세요.')
    				email.select()
    			}
    			
    		})
    		
//     		const url = cpath +'/mailtoFindId/' + email.value + '/'
//     		const opt = {
//     			method : 'get'
//     		}
//     		fetch(url, opt)
//     		.then(resp => resp.json())
//     		.then(json => {
//     			if(json.status == 'OK') {
//     				alert('고객님의 ID가 발송되었습니다')
//     				location.href = cpath + '/login'
//     			}
//     			else {
//     				alert('이메일을 확인해주세요.')
//     			}
//     		})
    	}
		
		
	</script>
</body>
</html>