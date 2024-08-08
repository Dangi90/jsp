<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--
	날짜 : 24/08/05
	이름 : 박준우
	내용 : JSP 기본문법 실습하기 
 --%>
<title>3.Loop</title>
</head>
<body>
	<h3>3.반복문</h3>

	<h4>for</h4>
	<%
	for (int i = 1; i <= 3; i++) {
		out.println("<p>i : " + i + "</p>");
	}
	%>

	<%
	for (int j = 1; j <= 3; j++) {
	%>
	<p>
		j:
		<%=j%>
	</p>
	<%
	}
	%>

	<h4>while</h4>
	<%
	int k = 1;
	while (k <= 3) {
	%>
	<p>
		k :
		<%=k%>
	</p>
	<%
	k++;
	}
	%>
	<h4>구구단</h4>
	<table border="1">
		<tr>
			<th>2단</th>
			<th>3단</th>
			<th>4단</th>
			<th>5단</th>
			<th>6단</th>
			<th>7단</th>
			<th>8단</th>
			<th>9단</th>
		</tr>
		</tr>
		<%
		for (int i = 2; i <= 9; i++) {
		%>
		<td>
			<%
			for (int j = 1; j <= 9; j++) {
			%><%=i%>x<%=j%> = <%=i * j%>
		</td>
		<%
		}
			%></tr><%
		}
		%>

	</table>
</body>
</html>