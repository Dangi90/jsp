<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 데이터 수신 처리
String A_no = request.getParameter("A_no");

try {
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본환경

	//2단계 - 커넥션 풀에서 커넥션 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
	Connection conn = ds.getConnection();

	// DELETE 문을 사용하여 레코드를 삭제함
	String sql = "DELETE FROM `bank_account` WHERE `a_no` = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, A_no);

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
response.sendRedirect("./list.jsp?delete_success");
%>

