<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAOImpl"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		작업순서
		1. 파라미터(id, password) 추출
		2. DB에 해당 id, password에 맞는 회원 존재 여부를 판단 -> MemberDAO
		3. 로그인을 성공시 메인페이지로 이동, 로그인 실패시 로그인 입력페이지로 이동
	*/
	
	request.setCharacterEncoding("utf-8");
		
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberVO member = new MemberVO(id, password);
	
	MemberDAO memberDao = new MemberDAOImpl();
	
	MemberVO user = memberDao.login(member);
	
	String msg = null;
	String url = null;
	// 로그인 실패
	if (user == null) {
		// response.sendRedirect("login.jsp");
		msg = "로그인을 실패했습니다.";
		url = "login.jsp";
	} else {
		// 로그인 성공
		//response.sendRedirect("/Mission-WEB");
		msg = "로그인을 성공했습니다.";
		url = "/Mission-WEB";
		
		// 세션에 등록
		session.setAttribute("userVO", user);
	}
	
	// 공유영역에 등록
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>
<script>
	alert('${ msg }')
	location.href = '${ url }'
</script>
	<!--  <c:redirect url="${ url }" /> -->