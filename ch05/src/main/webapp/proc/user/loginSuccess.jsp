<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sub1.UserVO"%>
<%
UserVO sessUser = (UserVO) session.getAttribute("sessUser");

if (sessUser == null) {
	response.sendRedirect("./login.jsp?success=101");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginSuccess</title>
</head>
<body>
	<h3>로그인 성공</h3>
	<p>
		<%
		String userName = sessUser.getName();
		String userHp = sessUser.getHp();

		out.print(userName);
		%>
		님 반갑습니다.<br>
		휴대폰 번호는 
		<%
		out.print(userHp);
		%>
		입니다.<br> 
		
		<a href="./logout.jsp">로그아웃</a>
	</p>
</body>
</html>