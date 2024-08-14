<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//데이터 수신처리
String a_no = request.getParameter("a_no");
String a_item_list = request.getParameter("a_item_list");
String a_item_name = request.getParameter("a_item_name");
String a_c_no = request.getParameter("a_c_no");
String a_balance = request.getParameter("a_balance");
String a_open_date = request.getParameter("a_open_date");

//데이터베이스 처리

try {
	
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본환경

	//2단계 - 커넥션 풀에서 커넥션 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
	Connection conn = ds.getConnection();
	
	//2단계-SQL실행객체 생성
	String sql = "insert into `bank_account` values (?,?,?,?,?,?)";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, a_no);
	psmt.setString(2, a_item_list);
	psmt.setString(3, a_item_name);
	psmt.setString(4, a_c_no);
	psmt.setString(5, a_balance);
	psmt.setString(6, a_open_date);
	
	//3단계-SQL실행
	psmt.executeUpdate();

	//4단계-결과처리(SELECT일 경우)

	//5단계-데이터베이스 종료
	psmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}

//목록이동
response.sendRedirect("./list.jsp?register_success");
%>