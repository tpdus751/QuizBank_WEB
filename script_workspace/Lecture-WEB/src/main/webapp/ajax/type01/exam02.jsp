<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let httpRequest = null
	let sendData = function(param) {
		httpRequest = new XMLHttpRequest()
		httpRequest.onreadystatechange = callback
		
		httpRequest.open('GET', 'param.jsp?name='+param, true)
		httpRequest.send(null)
	}
	
	let callback = function() {
		
		let monitor = document.querySelector('#monitor')
		
		if(httpRequest.readyState == 4 && httpRequest.status == 200) {
			monitor.value += '< 웹서버에서 정상적으로 수행완료 >\n'
			monitor.value += '실행결과 : ' + httpRequest.responseText + '\n'
		}
	}
</script>
</head>
<body>
	<textarea rows="8" cols="80" id="monitor"></textarea><br>
	<button type="button" onclick="sendData('hong, gil-dong')">영문인자호출</button>
	<button type="button" onclick="sendData('홍길동')">한글인자호출</button>
</body>
</html>