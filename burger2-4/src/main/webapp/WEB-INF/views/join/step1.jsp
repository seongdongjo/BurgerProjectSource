<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="join-address-container">
        <ul class="join-address-ul">
            <li style="background-color: #BD0017">약관 동의</li>
            <li style="background-color: #ffc836">주소 입력</li>
            <li style="background-color: #264f36">정보 입력</li>
        </ul>
        <form class="join-address-form" action="${ cpath }/join/step2">
            <p>지역명</p>
            <input id="addressInput" type="text" name="addressName" placeholder="지번, 도로명, 건물명으로 입력해주세요" required>
            <hr>
            <p>상세주소</p>
            <input id="detailAddressInput" type="text" name="adressDetail" placeholder="나머지 주소를 입력해주세요" required>
            <hr>
            <p>최종 배달주소</p>
            <div id="address-result">
            	<span id="resultAddress"></span>
            </div>
            <hr>
            <input id="addressSubmit" type="submit" value="다음">
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
			li1.classList.add('transform-small')
			li2.classList.add('transform-big')
			li3.classList.add('transform-small')
		}
    </script>


	<script>
		const resultAddress = document.getElementById('resultAddress')
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
    	})
	</script>
	<%@ include file ="../search-footer.jsp" %>
</body>
</html>