<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	StringBuilder sb = new StringBuilder();
	for (Cookie cookie : cookies) {
		String cName = cookie.getName();
		String cValue = cookie.getValue();
		
		// decoding
		cName = URLDecoder.decode(cName, "utf-8");
		cValue = URLDecoder.decode(cValue, "utf-8");
		
		sb.append("쿠키이름 : " + cName + ", ");
		sb.append("쿠키값 : " + cValue + "<br>");
	}
	
	pageContext.setAttribute("cookieData", sb.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키 정보</h2>
	
	${ cookieData }
	
	<a href="makeForm.jsp">쿠키설정</a>
</body>
</html>