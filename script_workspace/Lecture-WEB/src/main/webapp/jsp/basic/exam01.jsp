<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		JSP 주석 : 서블릿으로 변환되지 않으므로 화면에 출력이 되지 않음
	 --%>
	 
	 <!--
	 	컨텐트 주석 : 서블릿으로 변환되어 클라이언트 웹브라우저에 전송되지만
	 	           웹브라우저가 해석하지 않아 화면에 출력되지 않음 
	  -->
	  화면에 주석문에 보이나요????
	  <%
	  	out.println("<h4>코드를 추가해보자</h4>");
	  %>
</body>
</html>







