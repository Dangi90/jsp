<%@page import="com.google.gson.Gson"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<User1VO> users = new ArrayList<>();
try {
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본환경

	// 2단계 - 데이터베이스 접속
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();

	// 3단계 - SQL실행 객체 생성
	Statement stmt = conn.createStatement();

	// 4단계 - SQL실행
	String sql = "select * from `user1`";
	ResultSet rs = stmt.executeQuery(sql);

	// 5단계 - 결과처리
	while (rs.next()) {
		User1VO vo = new User1VO();
		vo.setUid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setBirth(rs.getString(3));
		vo.setHp(rs.getString(4));
		vo.setAge(rs.getInt(5));

		users.add(vo);
	}

	// 6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}

//System.out.println(users);

//JSON 생성 (page 지시자 contetentType 꼭 application/json 설정)
Gson gson = new Gson();
String jsonData = gson.toJson(users);

out.print(jsonData);
%>
