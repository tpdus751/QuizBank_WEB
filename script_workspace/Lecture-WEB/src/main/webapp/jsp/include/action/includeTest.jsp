<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%
	pageContext.setAttribute("addr", "경기도 성남시 수정구");
	request.setAttribute("phone", "010-1111-2222");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	msg : <%= msg %><br>
	name : ${ param.name }<br>
	addr : ${ addr }<br>
	phone : ${ phone }<br>
	age : ${ age }<br>
	<h2>인클루드전</h2>
	<jsp:include page="hello.jsp">
		<jsp:param name="id" value="honghong!!" />
	</jsp:include>
	<h2>인클루드후</h2>
	age : ${ age }<br>
	addr : ${ addr }<br>
	request addr : ${ requestScope.addr }<br>
</body>
</html>