<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String cName = request.getParameter("cName");
	String cValue = request.getParameter("cValue");
	String cAge = request.getParameter("cAge");
	
	System.out.println("cAge : " + cAge);
	
	// encoding
	cName = URLEncoder.encode(cName, "utf-8");
	cValue = URLEncoder.encode(cValue, "utf-8");
	
	// 쿠키 생성
	Cookie cookie = new Cookie(cName, cValue);
	
	// 유효시간 설정
	if (cAge != null && cAge.trim().length() != 0) {
		cookie.setMaxAge(Integer.parseInt(cAge.trim()) * 60);
	}
	
	// path 설정
	cookie.setPath("/Lecture-WEB/jsp/cookie");
	
	// 쿠키 전송
	response.addCookie(cookie);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 생성 완료</h2>
	
	<a href="get.jsp">설정된 쿠키 확인</a>
</body>
</html>