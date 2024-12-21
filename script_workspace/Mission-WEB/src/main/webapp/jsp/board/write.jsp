<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAOImpl"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	URL : write.jsp?title=test&writer=user&content=content..
	
	<작업순서>
	1. 전송된 데이터에서 제목, 작성자, 내용부로 각각 추출
	2. 추출된 데이터를 t_board 테이블에 삽입
	4. 게시판 목록 페이지(list.jsp) 이동
 --%>    

<%
	request.setCharacterEncoding("utf-8");

	// 1단계
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	// 2단계
	BoardDAO boardDao = new BoardDAOImpl();
	boardDao.insert(board);
%> 
<script>
	alert('새글등록을 완료하였습니다')
	location.href = 'list.jsp'
</script> 
 
 
 
 
 
 
 
 