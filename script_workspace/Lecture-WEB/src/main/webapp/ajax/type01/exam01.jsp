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
<script>
	let requestMsg = function() {
		// 1. XMLHttpRequest 객체 생성
		let httpRequest = new XMLHttpRequest()
		
		// 2. callback 함수 설정
		httpRequest.onreadystatechange = function() {
			//alert('readyState : ' + httpRequest.readyState)
			// 4. 서버에서 응답완료
			if(httpRequest.readyState == 4) {
				//alert('staus : ' + httpRequest.status)
				// 5. 응답성공일 경우
				if(httpRequest.status == 200) {
					// 6. 응답결과를 화면에 출력
					// console.log(httpRequest.responseText)
					let msgView = document.getElementById("msgView")
					msgView.innerHTML += httpRequest.responseText
				}
			}
		}
		
		// 3. 비동기통신 요청
		httpRequest.open('GET', 'hello.jsp', true)
		httpRequest.send(null)
	}
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<button type="button" onclick="requestMsg()">서버에 자료 요청</button>
</body>
</html>