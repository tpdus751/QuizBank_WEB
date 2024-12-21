<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let httpRequest = null
	
	let sendData = function(method, param) {
		let msg = '===================================================================\n'
		msg += method + " /Lecture-WEB/ajax/type01/param.jsp?name=" + param + '\n'
		monitorTrace(msg)
		
		httpRequest = new XMLHttpRequest()
		httpRequest.onreadystatechange = callback
		
		let url = 'param.jsp'
		let params = 'name=' + param
		method = method.toUpperCase()
		if(method == 'GET') {
			httpRequest.open(method, url + '?' + params, true)
			httpRequest.send(null)
		} else if(method == 'POST') {
			httpRequest.open(method, url, true)
			httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded')
			httpRequest.send(params)
		}
		
	}
	
	let callback = function() {
		let msg = ''
		
		if(httpRequest.readyState == 4 && httpRequest.status == 200) {
			msg += '< 웹서버에서 정상적으로 수행완료 >\n'
			msg += '실행결과 : ' + httpRequest.responseText + '\n'
		}
		
		monitorTrace(msg)
	}
	
	let monitorTrace = function(msg) {
		let monitor = document.getElementById("monitor")
		monitor.value += msg
	}
	
</script>
</head>
<body>
	<textarea rows="8" cols="80" id="monitor"></textarea><br>
	<button type="button" onclick="sendData('GET', 'hong, gil-dong')">GET방식 영문인자호출</button>
	<button type="button" onclick="sendData('GET', '홍길동')">GET방식 한글인자호출</button>
	<button type="button" onclick="sendData('POST', 'hong, gil-dong')">POST방식 영문인자호출</button>
	<button type="button" onclick="sendData('POST', '홍길동')">POST방식 한글인자호출</button>
</body>
</html>