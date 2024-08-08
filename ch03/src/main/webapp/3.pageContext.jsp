<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.pageContext</title>
	<!-- 
		날짜 : 24/08/06
		이름 : 박준우
		내용 : pageContext 내장객체 실습하기
	-->
</head>
<body>
	<h3>3.pageContext</h3>
	
	<h4>include</h4>
	<%@ include file="./inc/header.jsp" %>
	<%
		pageContext.include(".inc/footer.jsp");
	%>
	
	<h4>forward</h4>
	<a href="./proc/forwrad1.jsp">포워드1 페이지</a>
	<a href="./proc/forwrad1.jsp">포워드2 페이지</a>
	
</body>
</html>