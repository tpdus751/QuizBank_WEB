<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> user = new HashMap<String, String>();
	user.put("name", "홍길동");
	user.put("age", "32");
	
	// pageContext 공유영역에 userVO로 객체 등록
	pageContext.setAttribute("userVO", user);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : <%= user.get("name") %><br>
	age : <%= user.get("key") %><br>
	<hr>
	el name : ${ userVO.name }<br>
	el name : ${ userVO["name"] }<br>
	el age : ${ userVO.age }<br>
	el id : ${ userVO.id }<br>
</body>
</html>