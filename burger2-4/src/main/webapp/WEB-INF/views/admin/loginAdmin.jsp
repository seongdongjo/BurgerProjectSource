<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

	<div class="login-form">
	       <a href="${ cpath }/admin/loginAdmin"><button class="admin-login">관리자로그인</button></a>
        <form method="POST">
            <p class="login-p"><input class="login-input" type="text" name="adminid" placeholder="ID" style="width : 240px;"></p>
            <p class="login-p"><input class="login-input" type="password" name="adminpw" placeholder="PW" style="width : 240px;" ></p>
            <div class="find-btn">	
            	<p><input name="auto" type="checkbox">자동로그인</p>
            </div>
            <input class="login-submit" type="submit" value="로그인">
        </form>
        <p class="login-p"><a href="${ cpath }/join/adminJoin"><button class="join-button">회원가입</button></a></p>
    </div>
 <%@ include file="../search-footer.jsp" %>
<%@ include file="../footer.jsp" %>
