<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		http://localhost:8080/Lecture-WEB/jsp/jstl/exam03.jsp?type=S
		http://localhost:8080/Lecture-WEB/jsp/jstl/exam03.jsp?type=U
	 --%>
	 
	 <c:if test="${ param.type == 'S' }">
	 	<h2>수퍼관리자님 환영합니다</h2>
	 </c:if>
	 <c:if test="${ param.type == 'U' }">
	 	<h2>일반사용자님 환영합니다</h2>
	 </c:if>
</body>
</html>







