<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<table border="1">
	<tr>
		<td rowspan="2">
			<a href="/Mission-WEB">
				<img src="/Mission-WEB/resources/images/KakaoTalk_logo.svg" style="width: 160px; height:45px;">
			</a>
		</td>
		<td align="right">
			<c:if test="${ not empty userVO }">
				[${ userVO.name }(${ userVO.id })님 로그인중...]</td>	
			</c:if>	
	</tr>
	<tr>
		<td>
			<nav>
				<a href="/Mission-WEB">
					HOME
				</a> |
			<c:if test="${ userVO.type eq 'S' }">
				회원관리 |
			</c:if>
				<a href="/Mission-WEB/jsp/board/list.jsp">
					게시판
				</a> |
		<c:choose>
			<c:when test="${ empty userVO }">
				회원가입 |
				<a href="/Mission-WEB/jsp/login/login.jsp">
				로그인 
				</a> |
			</c:when>
			<c:otherwise>
				마이페이지 |
				<a href="/Mission-WEB/jsp/login/logout.jsp">
				로그아웃
				</a> |
			</c:otherwise>
		</c:choose>
		
				
			</nav>
		</td>
	</tr>
</table>