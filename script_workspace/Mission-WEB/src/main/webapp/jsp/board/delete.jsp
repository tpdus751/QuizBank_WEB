<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	http://localhost:8080/Mission-WEB/jsp/board/delete.jsp?no=83
	
	1. 파라미터 추출(no)
	2. 해당 게시글 삭제(BoardDAO)
	3. 목록페이지 이동
 --%>
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	BoardDAO boardDao = new BoardDAOImpl();
 	boardDao.deleteByNo(no);
 %>
<script>
	alert('${ param.no }번 게시물을 삭제하였습니다.')
	location.href = 'list.jsp'
</script>