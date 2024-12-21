<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 파라미터 추출
	2. DB에 해당 게시글 수정
	3. 상세게시글로 이동
 --%>
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("no"));	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setNo(no);
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO boardDao = new BoardDAOImpl();
	boardDao.update(board); %>
<script>
	alert('수정이 완료되었습니다.')
	location.href = "detail.jsp?no=${ param.no }"
</script>
<%--	
	response.sendRedirect(request.getContextPath() + "/jsp/board/detail.jsp?no=" + no);
--%>