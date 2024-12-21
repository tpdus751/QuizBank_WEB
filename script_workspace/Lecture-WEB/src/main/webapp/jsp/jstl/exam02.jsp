<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("tag", "<hr>");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${ tag }<br>
	<c:out value="${ tag }" escapeXml="true"  default="tag는 존재하지 않음" /><br>
	<c:out value="${ tag2 }" default="tag2는 존재하지 않음"/>
</body>
</html>







