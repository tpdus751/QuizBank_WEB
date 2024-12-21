<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/resources/css/board_layout.css">
<script src="/Mission-WEB/resources/js/jquery-3.7.1.min.js"></script>
<script src="/Mission-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		
		let id = document.loginForm.id
		let password = document.loginForm.password
		
		if (checkBlank(id, 'ID를 입력하세요'))
			return false
		
		if (checkBlank(password, 'PASSWORD를 입력하세요'))
			return false
		
		return true;
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
			<h2>로그인</h2>
			<hr>
			<br>
			<form name="loginForm" action="loginProcess.jsp" method="post" onsubmit="return checkForm()">
				<table>
					<tr>
						<th width="15%">ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>
							<input type="password" name="password">
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="로그인">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>