<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("uid");
	String password = request.getParameter("pass");
	String name = request.getParameter("name");
	String birthdate = request.getParameter("birth");
	String[] hobbies = request.getParameterValues("hobby");
	String address = request.getParameter("addr");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<h3>post 요청 데이터 수신</h3>

	<p>
		아이디:<%=userid%><br>
		비밀번호:<%=password%><br> 
		이름:<%=name%><br>
		생일:<%=birthdate%><br>
		취미:<% 
            if (hobbies != null) {
                for (String hobby : hobbies) {
                    out.print(hobby + " ");
                }
            } else {
                out.print("선택된 취미 없음");
            }
        %><br>
        주소: <%= address %><br>
    </p>
    <a href="./1.request.jsp">뒤로가기</a>
	


</body>
</html>