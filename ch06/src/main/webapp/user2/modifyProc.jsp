<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 데이터 수신 처리
String uid = request.getParameter("uid"); // 수정하려는 사용자의 ID
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String addr = request.getParameter("addr");


// 데이터베이스 처리
String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String dbUser = "root";
String pass = "1234";

try {
	// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 1단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, dbUser, pass);

	// 2단계 - SQL 실행 객체 생성
	// UPDATE 문을 사용하여 기존 데이터를 수정함
	String sql = "UPDATE `user2` SET `name`=?, `birth`=?, `addr`=? WHERE `uid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);   // 새 이름
	psmt.setString(2, birth);  // 새 생년월일
	psmt.setString(3, addr);   // 새 주소
	psmt.setString(4, uid);    // 수정하려는 사용자의 ID

	// 3단계 - SQL 실행
	psmt.executeUpdate();

	// 4단계 - 결과 처리 (UPDATE는 처리할 결과가 없으므로 생략)

	// 5단계 - 데이터베이스 종료
	psmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}

// 수정 완료 후, 목록 페이지로 이동
response.sendRedirect("/ch06/user2/list.jsp?update_success");
%>
