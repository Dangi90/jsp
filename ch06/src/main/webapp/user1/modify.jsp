<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//데이터 수신
String uid = request.getParameter("uid");

String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String user = "root";
String pass = "1234";

List<User1VO> users = new ArrayList<>();
User1VO vo = null;

try {
	// 1단계 - JDBC 드라이버 로드 
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계 - SQL실행 객체 생성
	String sql = "select * from `user1` where `uid`=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	// 4단계 - SQL실행
	pstmt.setString(1, uid);  // SQL 쿼리의 첫 번째 `?` 자리에 uid 값을 대입
	ResultSet rs = pstmt.executeQuery();
	// 5단계 - 결과처리
	if (rs.next()) {
		
		vo = new User1VO();
		vo.setUid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getString(3));
		vo.setHp(rs.getString(4));
		vo.setAge(rs.getInt(5));

		users.add(vo);
	}else {
		return;
	}

	// 6단계 - 데이터베이스 종료
	pstmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수정</h3>

	<a href="/ch6/1.JDBC.jsp">처음으로</a>
	<a href="/ch6/1.JDBC.jsp">목록</a>

	<form action="/ch06/user1/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%=vo.getUid()%>" readonly/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName()%>"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth" value="<%=vo.getBirth()%>"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=vo.getHp()%>"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="<%=vo.getAge()%>"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정하기" />
				</td>
			</tr>

		</table>

	</form>

</body>
</html>