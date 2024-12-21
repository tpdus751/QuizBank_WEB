<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult {
		border: 1px solid red;
		width: 70%;
		height: 1030px;
	}
</style>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	let key = 'e7c5cab3da86c70a75d372061ed7da28'
	$(document).ready(function() {
		$("#searchBtn").click(function() {
			// 요청할 검색 날짜를 추출
			// let searchDate = $('#searchDate').val().replaceAll('-', '') // replace는 첫번째 나오는거만 바꿈
			let searchDate = $('#searchDate').val().split('-').join('')
			
			
			
			// 비동기 요청
			let params = {
				key: key,
				targetDt: searchDate
			}
			
			
			params = new URLSearchParams(params)
			fetch('http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?' + params)
			.then((response) => response.json())
			.then(callback)
			
			
			/*
			fetch('http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?' + params)
			.then(function(response) {
				return response.json()
			}).then(callback)
			
			
			function(aaa) {
				return p
			}
			
			(aaa) => p
			*/
		
			
			/*
			$.ajax({
				url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				type: 'get',
				data: {
					key: key,
					targetDt: searchDate
				},
				success: callback,
				error: function() {
					alert('error')
				} 
			})
			*/
		})
	})
	
	let callback = function(response) {
		
		$('#searchResult').empty()
		
		//console.log(response.boxOfficeResult.dailyBoxOfficeList)
		let boxOfficeList = response.boxOfficeResult.dailyBoxOfficeList
		//$("#searchResult").append(`검색날짜 : ${ param.targetDt }`)
		/*
		for (let i = 0; i < boxOfficeList.length; i++) {
			let movieInfo = boxOfficeList[i]
			let rank = movieInfo.rank
			let name = movieInfo.movieNm
			let audiCnt = movieInfo.audiCnt
			$("#searchResult").append('<h4>' + rank + "위</h4>")
			$("#searchResult").append(`<strong>\${name}</strong>(\${audiCnt}명)`)
			$("#searchResult").append("<hr>")	
		}
		*/
		
		/*
		for (let i in boxOfficeList) { // i는 인덱스
			let movieInfo = boxOfficeList[i]
			let rank = movieInfo.rank
			let name = movieInfo.movieNm
			let audiCnt = movieInfo.audiCnt
			
			$("#searchResult").append('<h4>' + rank + "위</h4>")
			$("#searchResult").append(`<strong>\${name}</strong>(\${audiCnt}명)`)
			$("#searchResult").append("<hr>")	
		}
		*/
		
		/*
		for (let movieInfo of boxOfficeList) { // 배열의 값 뽑기
			let rank = movieInfo.rank
			let name = movieInfo.movieNm
			let audiCnt = movieInfo.audiCnt
			$("#searchResult").append('<h4>' + rank + "위</h4>")
			$("#searchResult").append(`<strong>\${name}</strong>(\${audiCnt}명)`)
			$("#searchResult").append("<hr>")	
		}
		*/
		
		for (let movieInfo of boxOfficeList) { // 배열의 값 뽑기
			with(movieInfo) { // 변수를 객체안의 변수로 봄
				$("#searchResult").append('<h4>' + rank + "위</h4>")
				$("#searchResult").append(`<strong>\${movieNm}</strong>(\${audiCnt}명)`)
				$("#searchResult").append('<br><button>상세보기</button>')
				$("#searchResult").append("<hr>")	
			}
		}
	}
</script>
</head>
<body>
	<h2>일별 박스오피스 조회 서비스</h2>
	<div>
		검색일 : <input type="date" id="searchDate">
		<button id="searchBtn">검색</button>
	</div>
	<h3>검색 결과</h3>
	<div id="searchResult"></div>
</body>
</html>