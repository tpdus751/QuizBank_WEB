<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/resources/css/board_layout.css">
<script src="/Mission-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#listBtn').click(function() {
			location.href = 'list.jsp'
		})
	})
	
	let checkForm = function() {
		
		let form = document.inputForm
		
		if(form.title.value == '') {
			alert('제목을 입력하세요')
			form.title.focus()
			return false
		}
		
		if(form.writer.value == '') {
			alert('작성자를 입력하세요')
			form.writer.focus()
			return false
		}
		
		if(form.content.value == '') {
			alert('내용을 입력하세요')
			form.content.focus()
			return false
		}
		
		return true
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h1>게시글 등록폼</h1>
		<hr>
		<br>
		<form action="write.jsp" method="post" name="inputForm"
			  onsubmit="return checkForm()">
			<input type="hidden" name="writer" value="${ userVO.id }">
			<table border="1" style="width:80%">
				<tr>
					<th width="23%">제목</th>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<%-- <input type="text" name="writer" id="writer" value="${ userVO.id }" readonly> --%>
						<c:out value="${ userVO.id }" />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="80" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">새글등록</button>
			<button type="button" id="listBtn">취소</button>
		</form>
	</div>
	</section>
	<footer>
		
<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>






