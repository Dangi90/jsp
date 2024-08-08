<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 장애.</title>
</head>
<body>
	<h3>서버에 문제가 생겼습니다.</h3>
	<p>
		일시적으로 서버에 문제가 생겼습니다.<br>
		고객센터에 문의 해주세요.<br>
		장애 종류: <%=exception.getClass().getName() %><br>
		장애 내용: <%=exception.getMessage() %><br>
				
		<a href="../6.exception.jsp">뒤로가기</a>
	</p>
</body>
</html>