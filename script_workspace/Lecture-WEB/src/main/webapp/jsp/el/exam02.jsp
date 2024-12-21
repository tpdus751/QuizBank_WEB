<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	http://localhost:8080/Lecture-WEB/jsp/el/exam02.jsp
		?name=hong&age=24&hobby=music&hobby=movie 라고 요청했다 가정했을때
	name, age값을 추출
 --%>    
 <%
 	String name = request.getParameter("name");
 	String[] hobbies = request.getParameterValues("hobby");
 	if(hobbies == null) {
 		hobbies = new String[] {"날라오는 파라미터 없음"};	
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : <%= name %><br>
	name : <%= request.getParameter("name") %><br>
	name : ${ param.name }<br>
	age : <%= request.getParameter("age") %><br>
	age : ${ param.age }<br>
	<hr>
	첫번째 hobby : <%= hobbies[0] %><br>
	첫번째 hobby : ${ paramValues.hobby[0] }<br>
	첫번째 hobby : ${ empty param.hobby ? '파라미터 없음' : paramValues.hobby[0]}<br>
	<%-- 두번째 hobby : <%= hobbies[1] %><br>
	두번째 hobby : ${ paramValues.hobby[1] }<br> --%>
</body>
</html>



