<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="join-main-container">
	<div class="required-inputs"><span class="required-input">*</span>&nbsp;: 필수입력 </div>
    <form class="join-main-form" method="POST">
            <p>ID <span class="required-input">*</span></p>
            <input class="username_input" type="text" name="adminid" placeholder="ID를 입력해 주세요" check_result="fail" required autofocus autocomplete="off">
            <input id="idChkBtn" type="button" value="중복확인">
            <p id="idChkResult"></p>
            <p>비밀번호 <span class="required-input">*</span></p>
            <input id="userpass" type="password" name="adminpw" placeholder="비밀번호를 입력해주세요" required maxlength="15" autocomplete="off">
            <p class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</p>
            <p>비밀번호 확인</p>
            <input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="15" autocomplete="off"/>
            <p class="point successPwChk"></p>
            <p>관리자 이름 </p>
            <input id="nameInput"type="text" name="adminname" placeholder="관리자 이름을 입력해주세요">
            <hr>
            <input id="mainSubmit" type="submit" value="가입">
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
		const cpath = '${ cpath }'
    	const idchk = document.getElementById('idChkBtn')
    	const adminid = document.querySelector('input[name="adminid"]')
    	const adminpw = document.querySelector('input[name="adminpw"]')
    	const userpwchk = document.querySelector('input[name="sm_pw_chk"]')
    	const adminname = document.querySelector('input[name="adminname"]')
    	const msg = document.getElementById('idChkResult')
		// 헤더에 form으로 검색을 해서 이렇게 선택자로 들어와야 함
		const form = document.querySelector('.join-main-form')
    	
		idchk.onclick = function(){
    		if(adminid.value == ''){
    			alert('ID를 입력해주세요')
    			adminid.select()
    			return
    		}
    		const url = cpath + '/ajaxIdChk2/' + adminid.value
    		const opt = {
    				method : 'get'
    		}
    		fetch(url, opt)
    		.then(resp => resp.json())
    		.then(json => {
    			console.log(json)
    			
    			msg.innerText = json.msg
    			msg.style.color = json.color
    			msg.style.fontWeight = 'bold'
    			if(json.color == 'blue') {
    				$('.username_input').attr("check_result", "success");
    			}
    			
    			document.querySelctor('input[name="'+ json.focus +'"]').select()
    		})
    	}
    	
    	mainSubmit.onclick = function(event) {
    		event.preventDefault()
    		if ($('.username_input').attr("check_result") == "fail"){
    		    alert("아이디 중복체크를 해주시기 바랍니다.");
    		    $('.username_input').focus();
    		    return false;
    		 }
    		else if(adminpw.value == '') {
    			adminpw.focus();
    			return false;
    		}
    		else if(userpwchk.value == '') {
    			userpwchk.focus();
    			return false;
    		}  		
    		else if(adminname.value == '') {
    			adminname.focus();
    			return false;
    		}  		
    		else {
    			form.submit();
    			return true;
    		}
    	}
    		
        $('#userpass').blur(passchk1) 
    	
    	$("#userpasschk").blur(passchk2) 
    	
    	
    	
    	
    </script>
   <%@ include file ="../search-footer.jsp" %>
   
</body>
</html>