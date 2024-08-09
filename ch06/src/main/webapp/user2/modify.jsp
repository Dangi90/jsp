<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="ch06.User2VO"%>
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

List<User2VO> users = new ArrayList<>();
User2VO vo = null;

try {
	// 1단계 - JDBC 드라이버 로드 
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계 - SQL실행 객체 생성
	String sql = "select * from `user2` where `uid`=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	// 4단계 - SQL실행
	pstmt.setString(1, uid);  // SQL 쿼리의 첫 번째 `?` 자리에 uid 값을 대입
	ResultSet rs = pstmt.executeQuery();
	// 5단계 - 결과처리
	if (rs.next()) {
		
		vo = new User2VO();
		vo.setUid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getString(3));
		vo.setAddr(rs.getString(4));
		
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

	<form action="/ch06/user2/registerProc.jsp" method="post">
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
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr()%>"/></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정하기" />
				</td>
			</tr>

		</table>

	</form>

</body>
</html>