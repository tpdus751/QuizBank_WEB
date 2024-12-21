<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	/*
		if (session.getAttribute("userVO") == null) {
			response.sendRedirect("/Mission-WEB/jsp/login/login.jsp")
		}
	*/
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO boardDao = new BoardDAOImpl();
	BoardVO board = boardDao.selectByNo(no);
	System.out.println(board);
	
	pageContext.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/resources/css/board_layout.css">
<script>
	let clickBtn = function(type) {
		switch(type) {
			case 'L':
				location.href = 'list.jsp'
				break
			case 'U':
				location.href = 'modifyForm.jsp?no=${param.no}'
				break
			case 'D':
				if (confirm('${ param.no }번 게시물을 삭제하시겠습니까?')) {
					location.href = 'delete.jsp?no=${param.no}'
				}
				break
		}
	} 
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
	<hr>
	<h2>상세게시글 조회</h2>
	<hr>
	<br>
	<table border="1" style="width: 80%;">
		<tr>
			<th width="25%">번호</th>
			<td>${ board.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${ board.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${ board.writer }"/>
		</tr>
		<tr>
			<th>내용</th>
			<td>${ board.content }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${ board.viewCnt }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${ board.regDate }</td>
		</tr>
	</table>
	<br>
	<button onclick="clickBtn('U')">수정</button>
	<button onclick="clickBtn('D')">삭제</button>
	<button onclick="clickBtn('L')">목록</button>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>