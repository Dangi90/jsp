<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseFile</title>
</head>
<body>
	<h3>파일 다운로드</h3>
	
	<%
		response.setHeader("Content-Type", "application/octet-stream");
	%>
</body>
</html>