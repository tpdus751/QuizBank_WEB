<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	5 + 5 = <%= 5 + 5 %><br>
	5 + 5 = ${ 5 + 5 }<br>
	12 % 5 = ${ 12 % 5 }<br>
	12 mod 5 = ${ 12 mod 5 }<br>
	12 > 19 = ${ 12 > 19 }<br>
	12 gt 19 = ${ 12 gt 19 }<br>
	
	empty str :  ${ empty str }<br>
	not empty str : ${ not empty str }<br>
	not empty str : ${ ! empty str }<br>
	
	5 >= 3 && 12 < 29 : ${ 5 >= 3 && 12 < 29 }<br>
	5 ge 3 and 12 lt 29 : ${ 5 ge 3 and 12 lt 29 }<br>
	
	11 짝/홀수 판단 : ${ (11 mod 2 eq 0) ? "짝수" : "홀수" }
	
</body>
</html>






