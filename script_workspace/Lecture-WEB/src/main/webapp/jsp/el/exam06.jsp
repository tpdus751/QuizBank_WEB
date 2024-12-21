<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] names = {"홍길동", "임꺽정", "나길동"};
	
	List<String> nameList = new ArrayList<>();
	nameList.add("홍길동");
	nameList.add("임꺽정");
	nameList.add("나길동");

	pageContext.setAttribute("names", names);
	pageContext.setAttribute("nameList", nameList);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	첫번째 이름 : ${ names[0] }<br>
	두번째 이름 : ${ names[1] }<br>
	세번째 이름 : ${ names[2] }<br>
	네번째 이름 : ${ names[3] }<br>
	<hr>
	첫번째 이름 : ${ nameList[0] }<br>
	두번째 이름 : ${ nameList[1] }<br>
	세번째 이름 : ${ nameList[2] }<br>
	네번째 이름 : ${ nameList[3] }<br>
	네번째 이름 : ${ namelist[3] }<br>
</body>
</html>