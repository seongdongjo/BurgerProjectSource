<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="join-address-container">
        <ul class="join-address-ul">
            <li style="background-color: #BD0017">정보 입력</li>
            <li style="background-color: #ffc836">주소 입력</li>
            <li style="background-color: #264f36">비회원 주문</li>         
        </ul> 
       
        <div class="required-inputs1">
        	<p>* ID는 임의로 발급됩니다(가입완료 시 알림창으로 띄워드립니다) </p>
        	<p><span class="required-input">*</span>&nbsp;: 필수입력</p>
       	</div>
       
        <form class="join-main-form" method="POST">
<%--         	<input type="hidden" name="address" value="${ param.addressName } ${ param.adressDetail }"> --%>
        	<input type="hidden" name="usergrade" value="비회원">
        	<input type="hidden" name="username" value="비회원">
        	<p>비밀번호 <span class="required-input">*</span></p>
            <input id="userpass" type="password" name="userpw" placeholder="비밀번호를 입력해주세요" maxlength="15" required autocomplete="off">
            <p class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</p>
            <p>비밀번호 확인</p>
            <input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="15" autocomplete="off"/>
            <p class="point successPwChk"></p>
        	
        	<p>휴대전화 번호 <span class="required-input">*</span></p>
            <input type="text" name="phone" placeholder="전화번호를 입력해주세요" required autocomplete="off">
            <p>성별 <span class="required-input">*</span></p>
            <label>
            	<input type="radio" name="gender" value="남성">남성
            	<input type="radio" name="gender" value="여성">여성
            </label>
            <p>이메일 <span class="required-input">*</span></p>
            <input type="email" name="email" placeholder="이메일을 입력해주세요" required autocomplete="off">
            <input id="mainBtn" type="button" value="인증번호발송">
            <p id="emailAuth"></p>
            <p>이메일 인증 <span class="required-input">*</span></p>      
            <input id= "authResult" type="text" name="authresult" placeholder="인증번호 입력">
  			<input id="authChkBtn" type="button" value="인증확인">
  			<p id="emailResult"></p>
            <p>지역명 <span class="required-input">*</span></p>
            <input id="addressInput" type="text" name="addressName" placeholder="지번, 도로명, 건물명으로 입력해주세요" readonly>
            <hr>
            <p>상세주소 <span class="required-input">*</span></p>
            <input id="detailAddressInput" type="text" name="adressDetail" placeholder="나머지 주소를 입력해주세요" required autocomplete="off">
            <hr>
            <p>최종 배달주소</p>
            <div id="address-result">
            	<span id="resultAddress"></span>
            </div>
            <hr>
  			<input id="addressSubmit" type="submit" value="주문하기">
        </form>
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
    	const li1 = document.querySelector('.join-address-ul>li:nth-child(1)')
		const li2 = document.querySelector('.join-address-ul>li:nth-child(2)')
		const li3 = document.querySelector('.join-address-ul>li:nth-child(3)')
		window.onload = function() {
    		li1.classList.add('transform-big')
			li2.classList.add('transform-small')
			li3.classList.add('transform-small')
    	}
    </script>
	
	<script>
		const cpath = '${ cpath }'
    	const mainBtn = document.getElementById('mainBtn')
    	const email = document.querySelector('input[name="email"]')
		const emailAuth = document.getElementById('emailAuth')
		const authChkBtn = document.getElementById('authChkBtn') 
    	const emailResult = document.getElementById('emailResult')
		const authInput = document.querySelector('input[name="authresult"]')
	
		const resultAddress = document.getElementById('resultAddress')
		
		const form = document.forms[1]
		
		console.log(resultAddress)
		
    	document.getElementById("addressInput").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("addressInput").value = data.address; // 주소 넣기
                
                resultAddress.innerText = document.getElementById("addressInput").value
                
                document.getElementById("detailAddressInput").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    	
    	$('#detailAddressInput').blur(function(){
    		resultAddress.innerText +=  (' ' + $('#detailAddressInput').val())
    		const address = document.createElement('input')
    		address.type = 'hidden'
    		address.name = 'address'
    		address.value = resultAddress.innerText
    		form.appendChild(address)
    	})
    	

    	
    	mainBtn.onclick = function(){
    		console.log(email.value)
    		
    		const url = cpath +'/mailto/' + email.value + '/'
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			emailAuth.innerText = json.message
    			emailAuth.style.color = json.status == 'OK' ? 'blue' : 'red'
    		})
    	}
    	
    	authChkBtn.onclick = function(){
    		const authResult = document.querySelector('input[name="authresult"]').value
    		console.log(authResult)
    		const url = cpath + '/ajaxAuth/' + authResult 
    		const opt = {
    			method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			
    			if(json.status == 'OK'){
    				emailResult.innerText = json.message
    				emailResult.style.color = 'blue'
//     				email.disabled = 'disabled'
    				authInput.disabled = 'disabled'
    				const emailAuth = document.createElement('input')
    				emailAuth.name = 'emailAuth'
    				emailAuth.type = 'hidden'
    				emailAuth.value = 'y'
    				form.appendChild(emailAuth)
    			}
    			else{
    				emailResult.innerText = json.message
    				emailResult.style.color = 'red'
    				email.select()
    			}
    		})
    	}
    	
        $('#userpass').blur(passchk1) 
    	
    	$("#userpasschk").blur(passchk2) 
    	
    	
	</script>
<%@ include file ="../search-footer.jsp" %>
</body>
</html>