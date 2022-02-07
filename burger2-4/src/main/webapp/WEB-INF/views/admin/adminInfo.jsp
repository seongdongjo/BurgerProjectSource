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

<div class="adminInfo-wrap">
		<div class="memberInfo-table">
			<div class="memberInfo-tableName">
				<h4>관리자 정보</h4>
			</div>
			<form method="post">
				<table class="myPage-tableType01" border="0" cellpadding="15" cellspacing="10">
					<tbody>
						<tr>
							<th scope="row">아이디 :</th>
							<td><input type="text" name="adminid" value="${adminlogin.adminid }" required readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 :</th>
							<td>
<%-- 							<input type="password" name="userpw" maxlength="15" value="${update.userpw }" required> --%>
								<input id="userpass" type="password" name="adminpw" placeholder="비밀번호를 입력해주세요" maxlength="15" required autocomplete="off">
            					<span class="point2">※ 비밀번호는 총 8자에서 15자까지 입력가능</span>
							</td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인 :</th>
							<td>
<!-- 								<input type="password" name="userpw" maxlength="15"  required> -->
								<input id="userpasschk" type="password" name="adminpwchk" placeholder="동일하게 입력해주세요." required maxlength="15" autocomplete="off"/>
            					<span class="point successPwChk"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">관리자이름 :</th>
							<td><input type="text" name="adminname" value="${adminlogin.adminname }" required></td>
						</tr>
						<tr>
							<th scope="row">스토어이름 :</th>
							<td><input type="text" name="storename" value="${adminlogin.storename }" required></td>
						</tr>
						<tr>
						<tr>
							<th scope="row">스토어지역 :</th>
							<td><input type="text" name="storeregion" value="${adminlogin.storeregion }" required></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

	</div>
</div>
<%@ include file="../footer.jsp" %>
<%@ include file ="../search-footer.jsp" %>
