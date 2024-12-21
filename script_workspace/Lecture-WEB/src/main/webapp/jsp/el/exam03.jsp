<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	공유영역 객체 등록
	공유영역명.setAttribute("이름", "값")
	
	JSP 공유영역 : pageContext, request, session, application
 --%>    
 <%
 	// pageContext영역에 객체 등록
 	pageContext.setAttribute("msg", "pageContext영역에 등록");
 
 	String msg = (String)pageContext.getAttribute("msg");
 	
 	// request 공유영역에 이름이 "id", 값이 "홍길동"인 객체 등록
 	request.setAttribute("id", "홍길동");
 	
 	// request공유영역 msg객체 등록
 	request.setAttribute("msg", "request영역에 객체등록");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		EL 공유영역 : pageScope, requestScope, sessionScope, applicationScope
	 --%>
	msg : <%= msg %><br>
	msg : ${ msg }<br>
	id : ${ id }<br>
	
	request msg : ${ requestScope.msg }<br>
</body>
</html>