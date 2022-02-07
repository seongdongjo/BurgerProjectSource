<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="myPage-container">
	<div class="myPage-list">
	       <h4 class="myPage-title">마이 페이지</h4>
	       <hr>
			<ul class="myPage-navPath">
				<li><a href="${cpath }/myPage">주문 조회</a></li>
				<li><a href="${cpath }/history?page=1" style="text-decoration: underline; text-decoration-color: #f5bd43">주문 내역</a></li>
				<li><a href="${cpath }/chkPw">회원 정보</a></li>
				<li class="deleteBtn"><a href="${ cpath }/chkDelete" >회원 탈퇴</a></li>
				
			</ul>
	   </div>
	<div class="myPage-contents">

		<div class="myPage-History">
			<div class="myPage-HistoryName"><h4>주문 내역</h4></div>
	<!-- 		<div class="myPage-HistoryDate"><h4>주문 일자 : </h4></div> -->
			<table class="myPage-tableType01" border="1" cellpadding="15" cellspacing="0">
				<thead>
					<tr>
						<th scope="col">주문 번호 :</th>
						<th scope="col">배달 시간/날짜</th>
						<th scope="col">주소</th>
						<th scope="col">메뉴</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.orderDate}-${dto.orderSeq }</td>
						<td>${dto.deliveryTime }</td>
						<td>${dto.orderAddress } </td>
						<td class="tdName">
							<dl class="myPage-menus">
								<dd>${fn:replace(dto.menus,' // ','</dd><dd>') }</dd>
							</dl>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		 <!-- 페이징 처리  -->
        <div class="news-paging">
        	<c:if test="${ prev }">
        		<a href="${ cpath }/history?page=${ begin-1 }"><button class="news-prev-btn">이전</button></a>
        	</c:if>
        	<c:forEach var="i" begin="${ begin }" end="${ end }">
        		<a href="${ cpath }/history?page=${ i }"><button class="news-current-btn ${ param.page == i ? 'bold' : '' }">${ i }</button></a>
        	</c:forEach>
			<c:if test="${ next }">
				<a href="${ cpath }/history?page=${ end + 1 }"><button class="news-next-btn">다음</button></a>
			</c:if>
        </div>
	</div>
</div>
 <%@ include file="search-footer.jsp" %>
<%@ include file="footer.jsp" %>