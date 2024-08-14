<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 데이터 수신 처리
String uid = request.getParameter("uid");

// 데이터베이스 처리
String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String user = "root";
String pass = "1234";

try {
	// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 1단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);

	// 2단계 - SQL 실행 객체 생성
	// DELETE 문을 사용하여 레코드를 삭제함
	String sql = "DELETE FROM `user1` WHERE `uid` = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);

	// 3단계 - SQL 실행
	int rowsAffected = psmt.executeUpdate();

	// 4단계 - 결과 처리
	if (rowsAffected > 0) {
		// 삭제 성공 시
		out.println("<p>삭제가 완료되었습니다.</p>");
	} else {
		// 삭제 실패 시
		out.println("<p>삭제할 사용자 정보를 찾을 수 없습니다.</p>");
	}

	// 5단계 - 데이터베이스 종료
	psmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}

// 삭제 완료 후, 목록 페이지로 이동
response.sendRedirect("/ch06/user1/list.jsp?delete_success");
%>

