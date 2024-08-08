<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1.Scriplet</title>
<%--
	날짜 : 24/08/05
	이름 : 박준우
	내용 : JSP 기본문법 실습하기 
 --%>
</head>
<body>
	<h3>1.스크립트 요소</h3>

	<h4>스크립트 릿</h4>
	<%
		//주석도 자바주석 사용 가능
		int var1 = 10;
		boolean var2 = true;
		double var3 = 3.141592;
		String var4 = "Hello World!";
		
		out.println("<p>val: "+var1+"</p>");
		out.println("<p>va2: "+var2+"</p>");
		
	%>
	
	<h4>표현식</h4>
	
	<p><%= var3 %></p>
	<p><%= var4 %></p>
	
</body>
</html>