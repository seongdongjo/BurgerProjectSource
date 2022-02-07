<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="myPage-container">
	<div class="myPage-list">
		<h4 class="myPage-title">마이 페이지</h4>
		<hr>
		<ul class="myPage-navPath">
			<li><a href="${cpath }/myPage">주문 조회</a></li>
			<li><a href="${cpath }/history?page=1" >주문 내역</a></li>
			<li><a href="${cpath }/chkPw" style="text-decoration: underline; text-decoration-color: #f5bd43">회원 정보</a></li>
			<li class="deleteBtn"><a href="${ cpath }/chkDelete" >회원 탈퇴</a></li>
		</ul>
	</div>
	<div class="memberInfo-wrap">
		<div class="memberInfo-table">
			<div class="memberInfo-tableName">
				<h4>회원 정보</h4>
			</div>
			<form method="post">
				<table class="myPage-tableType01" border="0" cellpadding="15" cellspacing="10">
					<tbody>
						<tr>
							<th scope="row">아이디 :</th>
							<td><input type="text" name="userid" value="${member.userid }" required readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 :</th>
							<td>
<%-- 							<input type="password" name="userpw" maxlength="15" value="${update.userpw }" required> --%>
								<input id="userpass" type="password" name="userpw" placeholder="비밀번호를 입력해주세요" maxlength="15" required autocomplete="off">
            					<p class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</p>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인 :</th>
							<td>
<!-- 								<input type="password" name="userpw" maxlength="15"  required> -->
								<input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="15" autocomplete="off"/>
            					<span class="point successPwChk"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">성명 :</th>
							<td><input type="text" name="username" value="${member.username }" required></td>
						</tr>
						<tr>
							<th scope="row">성별 : </th>
							<td>
								<label>
									<input type="radio" name="gender" value="남성" ${member.gender == '남성' ? 'checked' : '' } required>남성
								</label> 
								<label>
									<input type="radio" name="gender" value="여성" ${member.gender == '여성' ? 'checked' : '' } required>여성
								</label>
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호 :</th>
							<td><input type="tel" name="phone" value="${member.phone }" required></td>
						</tr>
						<tr>
						<tr>
							<th scope="row">이메일 :</th>
							<td><input type="email" name="email" value="${member.email }" required></td>
						</tr>
						<tr>
							<th scope="row">주소 :</th>
							<td>
								<p>최종 배달주소</p>
								<div id="address-result">
									<span id="userAddress">${ member.address }</span>
									<hr> 				
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">변경할 주소 :</th>
							<td>
								<p>지역명</p> 
									<input id="addressInput" type="text" name="addressName" placeholder="도로명으로 입력해주세요" readonly>
								<hr>
								<p>상세주소</p>
									<input id="detailAddress" type="text" name="address" value="" required>
								<hr>
								<input id="userSubmit" type="submit" value="저장">
							</td>
						</tr>

					</tbody>
				</table>
			</form>
		</div>

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
</body>
</html>

	