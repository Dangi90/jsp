<%@page import="ch03.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<title>5.session</title>
	<!-- 
		날짜 : 24/08/06
		이름 : 박준우
		내용 : session 내장객체 실습하기
	 -->
</head>
<body>
	<h3>5.session 내장객체</h3>
	
	<h4>session ID확인</h4>
	<%=session.getId() %>
	
	<h4>session 설정</h4>
	<%
		String agent = request.getHeader("User-Agent");
	
		if(agent.contains("Edg")){
			//엣지 브라우저
			UserVO user = new UserVO("a101", "김유신", 23);
			//세션저장
			session.setAttribute("user", user);
		}else{
			//크롬 브라우저
			UserVO user = new UserVO("a102", "김춘추", 33);
			//세션저장
			session.setAttribute("user", user);
		}
		
		//세션조회
		UserVO userVO = (UserVO) session.getAttribute("user");
	%>
	
	<p>
		아이디: <%=userVO.getUid() %><br>
		이름: <%=userVO.getName() %><br>
		나이: <%=userVO.getAge() %><br>
	
	</p>
</body>
</html>