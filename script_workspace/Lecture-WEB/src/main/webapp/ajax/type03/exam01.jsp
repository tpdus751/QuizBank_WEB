<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	let sendOnClick = function(method) {
		sendProcess('GET', 'sample.jsp', null, callback)
	}
	
	let callback = function() {
		if(httpRequest.readyState == 4 && httpRequest.status == 200) {
			let response = httpRequest.responseText
//			console.log(response, typeof(response))
//			let memberList = eval(response)
			let memberList = JSON.parse(response)
			let msg = '회원수 : ' + memberList.length + '명\n'
			for(let i = 0; i < memberList.length; i++) {
				let member = memberList[i]
				let id = member.id
				let name = member.name
				msg += id + '(' + name + ')\n'
			}
			monitorTrace(msg)
		}
	}
	
	let monitorTrace = function(msg) {
		let monitor = document.getElementById("monitor")
		monitor.value += msg
	}
</script>
</head>
<body>
	<h2>AJAX 데이터 전송테스트</h2>
	<textarea rows="8" cols="60" id="monitor"></textarea><br>
	<button type="button" onclick="sendOnClick()">서버에 자료요청</button>
</body>
</html>