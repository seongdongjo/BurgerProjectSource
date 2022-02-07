<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath">${ pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coded Burger</title>
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/join.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/promotion.css">

<!-- 추가  -->
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/store.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/adminPage.css">
<link rel="stylesheet" type="text/css" href="${ cpath }/resources/css/menuDetail.css">

</head>
<body>
<script src="${ cpath }/resources/js/main.js"></script>

<script src="${ cpath }/resources/js/step2.js"></script>
<script src="${ cpath }/resources/js/promotion.js"></script>
<script src="${ cpath }/resources/js/store.js"></script>

<!-- 혜린 추가  -->
<script src="${ cpath }/resources/js/menu.js"></script>
<script src="${ cpath }/resources/js/menudetail.js"></script>

<!-- 메인 슬라이더 jquery  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--  주소 API   -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- step2(회원가입) blur사용  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- jquery 사용 / 주소,지도 관련 jquery 및 서비스키 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<!-- 프로젝트용 서비스 키  -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe8cb756f9e4d1d6a624a436989632fd&libraries=services"></script>

<!--  배포용 서비스 키  -->
<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e67782597f5cc169d077bada55a98a1&libraries=services"></script> -->

    <header>
        <div class="header">
            <div class="top-left">
                <div>
                    <a href="${ cpath }"><img class="main-logo" src="${ cpath }/resources/src/픽셀 버거2.png"></a>
                </div>
                <nav class="top-menu">
                    <ul>
                        <li class="top-menu-li">
                            <a href="${ cpath }/menu/list/burger">Menu</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
									<!-- 혜린 추가 -->
                                    <li><a href="${ cpath }/menu/list/mcmorning">맥모닝</a></li>
                                    <li><a href="${ cpath }/menu/list/burger">버거</a></li>
                                    <li><a href="${ cpath }/menu/list/side">사이드</a></li>
                                    <li><a href="${ cpath }/menu/list/mccafe">맥카페</a></li>
                                    <li><a href="${ cpath }/menu/list/drink">음료</a></li>
                                    <li><a href="${ cpath }/menu/list/dessert">디저트</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/store">Store</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
                                    <li><a href="${ cpath }/store">매장찾기</a></li>
                                    <li><a href="${ cpath }/order">주문하기</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/promotion">Promotion</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner">
                                    <li><a href="${ cpath }/promotion">프로모션</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="top-menu-li">
                            <a href="${ cpath }/board/news?page=1">Board</a>
                            <div class="top-menu-submenu">
                                <ul class="top-menu-inner"> 
                                   	<!--혜린 추가 내용  -->
                                    <li><a href="${ cpath }/board/news?page=1">새로운소식</a></li>
                                    <li><a href="${ cpath }/board/question?page=1">문의사항</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="top-right">
                <ul>
                    <li>
                    	<c:if test="${ empty login && empty adminlogin}">
 							<a href="${ cpath }/join">회원가입</a>                   	
                    	</c:if>
                    	<c:if test="${ not empty login || not empty adminlogin}">
                    		<a href="${ cpath }/logout">로그아웃</a>
                    	</c:if>
                    </li>
                    <li><a href="${ cpath }/order">주문하기</a></li>
                    
                    <li>
                    <c:if test="${ empty login && empty adminlogin }">
                        <a href="${ cpath }/login">로그인</a>
                    </c:if>
                    <c:if test="${ not empty login }">
                    	<a href="${ cpath }/myPage">마이페이지</a>
                    </c:if>
                    <c:if test="${ not empty adminlogin }">
                    	<a href="${ cpath }/admin/adminPage">관리자페이지</a>
                    </c:if>
                    </li>
                    <li>
                    	<img class="search-icon" src="${ cpath }/resources/src/검색아이콘.png" alt="">
                    	<div class="modal hidden">
                    		<div class="overlay"></div>
                    		<div class="modal-content">
                    			<form action="${ cpath }/search">
                    				<select name="type">
                    					<option value="burger">버거</option>
                    					<option value="mcmorning">맥모닝</option>
                    					<option value="side">사이드</option>
                    					<option value="mccafe">맥카페</option>
                    					<option value="drink">음료</option>
                    					<option value="dessert">디저트</option>                    				
                    				</select>
	                    			<input name="search" placeholder="메뉴를 입력해주세요">
	                    			<input type="submit" value="검색하기">
                    			</form>
	                    			<p><button id="closeModal">X</button></p>
                    		</div>
                    	</div>
                    </li> 
                </ul>
            </div>
        </div>
    </header>
