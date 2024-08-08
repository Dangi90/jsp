<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieCreate</title>
</head>
<body>
	<h3>cookieCreate Test page</h3>
	<%
	//전송데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	//쿠키 생성
	Cookie c1 = new Cookie("uid", uid);
	c1.setMaxAge(60 * 3); //3분

	Cookie c2 = new Cookie("pass", pass);
	c2.setMaxAge(60); //1분

	//쿠기 전송
	response.addCookie(c1);
	response.addCookie(c2);
	%>
	<!--
		- a태그는 GET 요청
		- 1분 후에 쿠키를 확인하면 pass 쿠키는 확인안됨.
	 -->
	<a href="./cookieResult.jsp">쿠키확인</a>


</body>
</html>