<%@page import="kr.ac.kopo.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO user = new UserVO();
	user.setName("홍길동");
	user.setAge(32);
	
	// pageContext영역에 userVO이름으로 등록
	pageContext.setAttribute("userVO", user);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : <%= user.getName() %><br>
	age : <%= user.getAge() %><br>
	<br>
	el name : ${ userVO.name }<br>
	el name : ${ userVO["name"]}<br>
	el age : ${ userVO.age }<br>
	<%-- el id : ${ userVO.id }<br> --%>
</body>
</html>




