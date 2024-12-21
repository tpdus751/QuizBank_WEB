<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
	1. 수정할 게시물번호 추출
	2. DB에서 게시물 조회
	3. 화면 출력
--%>
<%
	BoardVO board = null;
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO boardDao = new BoardDAOImpl();
	board = boardDao.selectByNo(no);

	pageContext.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#clearBtn').click(function() {
			//history.go(-1)
			location.href = 'detail.jsp?no=${ param.no }'
		})
	})
</script>
</head>
<body>
	<div align="center">
		<br>
		<hr>
		<h1>게시글 등록폼</h1>
		<hr>
		<br>
		<form action="modify.jsp" method="post" name="inputForm">
		<input type="hidden" name="no" value="${ board.no }" />
			<table border="1" style="width:80%">
				<tr>
					<th width="23%">제목</th>
					<td>
						<input type="text" name="title" value="${ board.title }">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="writer" id="writer" value="${ board.writer }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="80" name="content"><c:out value="${ board.content }" /></textarea>
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">수정</button>
			<button type="button" id="clearBtn">취소</button>
		</form>
	</div>
</body>
</html>