<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#msgView {
		border: 1px solid red;
		height: 600px;
		width: 500px; 
	}
</style>
<script src="/Lecture-WEB/jquery/lib/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('button').click(function() {
		/*
			url		:  요청주소(string)
			type	:  메소드(string)
			data	:  파라미터(string, object)
			success :  수신성공(function)
			error   :  수신실패(function)
		*/
			$.ajax({
				url: 'hello.jsp'
				, success: function(response) {
					//alert('성공')
					//console.log(response)
					$('#msgView').append(response)
				}
			})
		})
	})
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<button type="button">서버에 자료 요청</button>
</body>
</html>