<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookieTest</title>
	<!--
		날짜: 24/08/07
		이름: 박준우
		내용: cookie 실습하기 
	 -->
</head>
<body>
	<h3>1.cookieTest</h3>
	<form  action="./proc/cookieCreate.jsp" method="post">
		<input type="text" name="uid" placeholder="아이디 입력"/><br>
		<input type="text" name="pass" placeholder="비밀번호 입력"/><br>
		<input type="submit" value="로그인"/>
	
	</form>

</body>
</html>