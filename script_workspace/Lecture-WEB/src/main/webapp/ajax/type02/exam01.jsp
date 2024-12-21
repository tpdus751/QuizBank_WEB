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
//		sendProcess('GET', 'sample.jsp', {name:'홍길동', age:28, addr:'경기도 성남시'}, callback)

		let f = document.inputForm
		let name = f.name.value
		let age = f.age.value
		let addr = f.addr.value
		let params = {
			name : name
			, age: age
			, addr: addr
		}

		sendProcess(method, 'sample.jsp', params, callback)
	}
	
	let callback = function() {
		if(httpRequest.readyState == 4 && httpRequest.status == 200) {
			let response = httpRequest.responseText
			//console.log(response)
			let monitor = document.querySelector('#monitor')
			monitor.value += response
			monitor.value += '\n----------------------------------\n'
		}
	}
</script>
</head>
<body>
	<h2>AJAX 데이터 전송테스트</h2>
	<textarea rows="8" cols="60" id="monitor"></textarea>
	<form name="inputForm">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		주소 : <input type="text" name="addr"><br>
		<button type="button" onclick="sendOnClick('GET')">GET서버에서 자료전송</button>
		<button type="button" onclick="sendOnClick('POST')">POST서버에서 자료전송</button>
	</form>
</body>
</html>