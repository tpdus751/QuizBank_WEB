<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"  %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
	게시판 목록 서비스
	1. DB에서 t_board테이블의 레코드를 조회
	2. 조회된 레코드를 웹브라우저 출력
	3. DB연결 해제
 --%>    
 
<%
	BoardDAO boardDao = new BoardDAOImpl();
	List<BoardVO> boardList = boardDao.selectAll();

	// 공유영역 등록
	pageContext.setAttribute("boardList", boardList);
%>	
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/resources/css/board_layout.css">
<script src="/Mission-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>

	let doAction = function(boardNo) {
		<c:choose>
			<c:when test="${ empty userVO}">
				if(confirm('로그인 서비스가 필요합니다 \n로그인페이지로 이동하시겠습니까?')) {
					location.href = '/Mission-WEB/jsp/login/login.jsp'
				}
			</c:when>
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
	}

	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'writeForm.jsp'
		})
		
		
	})

/*
	window.onload = function() {
		let addBtn = document.getElementById("addBtn")
		addBtn.addEventListener('click', function() {
			location.href = './writeForm.jsp'
		})
	}
*/
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h1>전체게시글 조회</h1>
		<hr>
		<br>
		<table border="1" style="width:100%">
			<tr>
				<th width="8%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일 </th>
			</tr>
			<c:forEach items="${ boardList }" var="board">
				<tr>
					<td>${ board.no }</td>
					<td>
						<a href="javascript:doAction(${ board.no })">
							<c:out value="${ board.title }"/>
						</a>
					</td>
					<td>${ board.writer }</td>
					<td>${ board.regDate }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn">새글등록</button>
		</c:if>		
	</div>
	</section>
	<footer>
		
<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>