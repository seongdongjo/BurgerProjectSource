<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="adminPage-container">
	<div class="myPage-list">
	       <h4 class="myPage-title">Admin 페이지</h4>
	       <hr>
			<ul class="myPage-navPath">
				<li><a href="${cpath }/admin/adminInfo">관리자 정보</a></li>
				<li><a href="${cpath }/admin/qnaCheck?page=1">Q&A 확인</a></li>
				<li><a href="${cpath }/board/news?page=1">새로운 소식 수정</a></li>
			</ul>
	</div>
	
	<div>
		<p>관리자 페이지 입니다</p>
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
		const detailAddress = document.getElementById('detailAddress')
	
    	document.getElementById("addressInput").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("addressInput").value = data.address // 주소 넣기
                
                detailAddress.value = data.address
                
                document.getElementById("detailAddressInput").focus() //상세입력 포커싱
            }
        }).open()
    })
    
    $('#userpass').blur(passchk1) 
    	
    $("#userpasschk").blur(passchk2) 
    
    	
	</script>
	<%@ include file ="../search-footer.jsp" %>
	
</body>
</html>
