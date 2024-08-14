<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1.ELTest</title>
	<!-- 
		날짜 : 24/08/13
		이름 : 박준우
		내용 : 표현언어 실습하기
	 -->
</head>
<body>
	<h3>1.표현언어</h3>
	<%
		int num1 = 1;
		int num2 = 2;
		
		String str1 = "hello";
		String str2 = "welcome";
		String str3 = "";
		String str4 = null;
		
		// 표현언어 출력을 위해 내장객체 스코프 설정 
		pageContext.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		session.setAttribute("str1", str1);
		application.setAttribute("str2", str2);
		request.setAttribute("str3", str3);
		request.setAttribute("str4", str4);
		
	%>
	
	<h4>표현식</h4>
	<p>
		num1 : <%=num1 %><br>
		num2 : <%=num2 %><br>
		str1 : <%=str1 %><br>
		str2 : <%=str2 %><br>
		str3 : <%=str3 %><br>
		str4 : <%=str4 %><br>
	</p>
	
	<h4>표현언어</h4>
	<p>
		num1 : ${num1}<br>
		num2 : ${num2}<br>
		
		str1 : ${str1}<br>
		str2 : ${str2}<br>
		str3 : ${str3}<br>
		str4 : ${str4}<br> <!-- 표현언어는 NULL 값 출력 x -->
	</p>
		
	<h4>표현언어 내장객체</h4>
	<p>
		num1 : ${pageScope.num1}<br>
		num2 : ${requestScope.num2}<br>
		
		str1 : ${sessionScope.str1}<br>
		str2 : ${applicationScope.str2}<br>
		str3 : ${str3}<br>
		str4 : ${str4}<br> <!-- 표현언어는 NULL 값 출력 x -->
	</p>
	
	<h4>표현언어 연산자</h4>
	<p>
		num1 + num2 = ${num1 + num2}<br>
		num1 - num2 = ${num1 - num2}<br>
		num1 * num2 = ${num1 * num2}<br>
		num1 / num2 = ${num1 / num2}<br>
		num1 % num2 = ${num1 % num2}<br><br>
		
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		num1 + num2 = $(num1 + num2)<br>
		
		
	</p>
	</body>
</html>