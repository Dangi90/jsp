<%@page import = "sub1.Account"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4.Directive</title>
</head>
<body>
	<h3>4.지시자</h3>
	<h4>page 지시자</h4>
	<%
		Account kb = new Account("국민은행", "102-12-1001", "김유신", 10000);
		Account wr = new Account("우리은행", "102-12-1002", "김춘추", 10000);
	%>
	<p><%=kb %></p>
	<p><%=wr %></p>
	
	<%@ include file="./inc/header.jsp" %>
	<%@ include file="./inc/footer.jsp" %>
	
</body>
</html>