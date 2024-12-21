<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"홍길동", "강길동", "나길동", "윤길동"};
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("namesLength", names.length);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		${ loop.first } : ${ loop.last } : ${ loop.index } : ${ loop.count }<br>
	</c:forEach>
	<hr>
	
	<c:forEach items="${ names }" var="name" varStatus="loop">
		${ name }
		<c:if test="${ not loop.last }">
			,
		</c:if>
	</c:forEach>
	<hr>
	<c:forEach items="${ names }" var="name" varStatus="loop">
		<c:if test="${ not loop.first }">
			,
		</c:if>
		${ name }
	</c:forEach>
	<hr>
	<c:set var="i" value="1" />
	<c:forEach items="${ names }" var="name">
		<c:if test="${ i ne 1 }">
			,
		</c:if>
		${ name }
		<c:set var="i" value="${ i+1 }" />
	</c:forEach>
	<c:remove var="i" scope="page" />
	<hr>
	<c:forEach var="i" begin="0" end="${ fn:length(names) - 1 }">
		${ names[i] }
	</c:forEach>
	<hr> 
	<c:forEach var="i" begin="0" end="${ namesLength - 1 }">
		<c:if test="${ i != 0 }">
		,
		</c:if>
		${ names[i] }
	</c:forEach> 
	<h2>1 ~ 10사이의 정수 출력</h2>
	<c:forEach begin="1" end="10" var="i">
		${ i }<br>
	</c:forEach>
	
	<c:forEach begin="1" end="3" var="i">
		<h3>Hello ${ i }</h3>
	</c:forEach>
	
	년도 : <select>
		<c:forEach begin="1960" end="2024" var="year">
			<option>${ year }</option>
		</c:forEach>
	</select>
</body>
</html>







