<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Lecture-WEB/jquery/lib/jquery-3.7.1.min.js"></script>
<script src="httpRequest.js"></script>
<script>
	let sendOnClick = function(method) {
		sendProcess('GET', 'sample.xml', null, callback)
	}
	
	let callback = function() {
		if(httpRequest.readyState == 4 && httpRequest.status == 200) {
			let response = httpRequest.responseXML
//			console.log(response, typeof(response))

			let memberList = response.querySelectorAll('member')
			//let memberList = $(response).find('member')
			let msg = '회원수 : ' + memberList.length + '명\n'
			for(let i = 0; i < memberList.length; i++) {
				let member = memberList[i]
				let id = member.querySelector('id').innerHTML
				let name = member.querySelector('name').innerHTML
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