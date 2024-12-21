<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${ param.id == 'admin' }"	>    
		<%
			response.sendRedirect("admin.jsp");
		%>
		</c:when>
		<c:otherwise>
		<%--
			response.sendRedirect("user.jsp?id=" + request.getParameter("id"));
		--%>
		<c:redirect url="user.jsp">
			<c:param name="id" value="${ param.id }"/>
		</c:redirect>
		</c:otherwise>
	</c:choose>
</body>
</html>