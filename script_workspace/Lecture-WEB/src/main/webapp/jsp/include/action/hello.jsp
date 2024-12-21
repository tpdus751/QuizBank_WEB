<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setAttribute("age", 25);
	request.setAttribute("addr", "서울특별시 서초구");
%>
<hr>
param name : ${ param.name }<br>
addr : ${ addr }<br>
phone : ${ phone }<br>
age : ${ age }<br>
id : ${ param.id }<br>
<h3>Hello JSP</h3>
<h3>Hello JSP</h3>
<h3>Hello JSP</h3>
<h3>Hello JSP</h3>
<h3>Hello JSP</h3>
<hr>
