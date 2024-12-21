<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Lecture-WEB/jquery/lib/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('button').click(function() {
			
			fetch('param.jsp', {
				method: 'post',
				body: new URLSearchParams({ // 파라미터 형식으로 변환하는 함수 (Form 데이터 형태로 날라감)
					name: 'hong',
					phone: '010-2222-3333'
				})
			}).then(function(response) {
				return response.text();
			}).then(function(data) {
				$('#monitor').val(data)
			})
			
			/*
			$.post('param.jsp', {name: '홍길동'}, function(response) { // POST방식의 비동기통신 json형태의 data
				//console.log(response)
				$("#monitor").val(response)
			})
			*/
			
			/*
			$.post('param.jsp', "name=hong", function(response) { // POST방식의 비동기통신
				//console.log(response)
				$("#monitor").val(response)
			})
			*/
			
		/*
			$.ajax({
				url: 'param.jsp'
				, type: 'post'
				//, data: 'name=hong, gil-dong'
				, data: {
					name: '홍길동'
				}
				, success: function(response) {
					alert('성공')
					$('#monitor').val(response)
				}, error: function(error) {
					alert('오류코드 : ' + error.status)
				}
			})
		*/
		})
	})
</script>
</head>
<body>
	<textarea rows="8" cols="80" id="monitor"></textarea><br>
	<button type="button" >서버호출</button>
</body>
</html>



