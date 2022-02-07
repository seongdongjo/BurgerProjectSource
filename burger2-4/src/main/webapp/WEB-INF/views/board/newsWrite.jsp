<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="newswrite-form">
	<form method="POST" enctype="multipart/form-data">
		<table border="1" cellpadding="7" cellspacing="0">
			<tr>
				<th>제목</th>
				<td><input class="border-zero" type="text" name="title"
					placeholder="제목을 입력해주세요" required autofocus></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="border-zero" type="text" name="writer"
					value="${ adminlogin.adminid }" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="border-zero"
						style="width: 600px; height: 300px; padding: 0; resize: none;"
						name="content"></textarea></td>
			</tr>
			<tr>
				<th>업로드</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<th>카운트</th>
				<td><input class="border-zero" type="number" name="cnt"
					value="1" required></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="radio" name="flag" value="top" required>top
					<input type="radio" name="flag" value="bottom" required>bottom</td>
			</tr>
		</table>
		<div style="display: flex; justify-content:flex-end; width: 685px;">
		<p><input class="newswrite-submit" type="submit" value="게시글 작성"><p>
		</div>
	</form>
</div>

<%@ include file="../footer.jsp"%>
<%@ include file ="../search-footer.jsp" %>

</body>
</html>