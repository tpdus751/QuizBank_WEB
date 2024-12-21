<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	session.removeAttribute("userVO");
%>
<%-- <c:remove var="${ userVO }" scope="session" />--%>
<script>
	location = "/Mission-WEB"
</script>