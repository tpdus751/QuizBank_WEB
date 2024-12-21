<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = request.getParameter("id");
	request.setAttribute("id", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>ForwardTest.jsp의 페이지!!!</h2>
	<c:if test="${ param.id eq 'admin' }">
		<jsp:forward page="admin.jsp" />
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<jsp:forward page="user.jsp">
			<jsp:param name="id" value="${ param.id }" />
		</jsp:forward>
	</c:if>
	<h2>ForwardTest.jsp 끝!!!</h2>
</body>
</html>