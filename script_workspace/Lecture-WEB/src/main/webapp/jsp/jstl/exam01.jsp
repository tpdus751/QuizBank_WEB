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
	정수 1을 저장하는 변수 cnt를 pageContext영역에 저장<br>
	<c:set var="cnt" value="1" />
	공유영역에 저장된 변수 cnt값을 출력<br>
	cnt : ${ pageScope.cnt }<br>
	cnt변수에 1을 증가<br>
	<c:set var="cnt" value="${ cnt + 1 }" scope="request" />
	cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
	
	변수 cnt 삭제<br>
	<c:remove var="cnt" scope="page"/>
	cnt : ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
</body>
</html>

<%--
				< 공유영역 4가지 >
		JSP		pageContext		request			session			application
		EL		pageScope		requestScope	sessionScope	applicationScope
		JSTL	page			request			session			application
 --%>




