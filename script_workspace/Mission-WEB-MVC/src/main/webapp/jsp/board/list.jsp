<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 목록 서비스</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${ boardList }" var="boardVO">
			<tr>
				<td>${ boardVO.no }</td>
				<td><c:out value="${ boardVO.title }" /></td>
				<td><c:out value="${ boardVO.writer }" /></td>
				<td><c:out value="${ boardVO.regDate }" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>