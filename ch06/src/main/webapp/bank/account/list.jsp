<%@page import="bank.AccountVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<AccountVO> accounts = new ArrayList<>();

try {
	//1단계 - JNDI 서비스 객체 생성
	Context initCtx = new InitialContext();
	Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본환경

	//2단계 - 커넥션 풀에서 커넥션 가져오기
	DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
	Connection conn = ds.getConnection();

	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();

	//4단계 - SQL 실행
	ResultSet rs = stmt.executeQuery("select * from bank_account");

	//5단계 - 결과처리
	while (rs.next()) {
		AccountVO vo = new AccountVO();
		vo.setA_no(rs.getString(1));
		vo.setA_item_list(rs.getString(2));
		vo.setA_item_name(rs.getString(3));
		vo.setA_c_no(rs.getString(4));
		vo.setA_balance(rs.getInt(5));
		vo.setA_open_date(rs.getString(6));

		accounts.add(vo);
	}

	//6단계 - 커넥션 반납
	stmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer::list</title>
</head>
<body>
	<h3>고객목록</h3>
	<a href="/ch06/2.DBCP.jsp">처음으로</a>
	<a href="./register.jsp">등록</a>

	<table border="1">
		<tr>
			<th>고객번호</th>
			<th>고객계약번호</th>
			<th>고객계약명</th>
			<th>계좌번호</th>
			<th>계좌금액</th>
			<th>계좌개설날짜</th>
			<th>관리</th>
		</tr>
		<%
		for (AccountVO vo : accounts) {
		%>
		<tr>
			<td><%=vo.getA_no()%></td>
			<td><%=vo.getA_item_list()%></td>
			<td><%=vo.getA_item_name()%></td>
			<td><%=vo.getA_c_no()%></td>
			<td><%=vo.getA_balance()%></td>
			<td><%=vo.getA_open_date()%></td>
			<td><a href="./modify.jsp?uid=<%=vo.getA_no()%>">수정</a> <a
				href="./delete.jsp?A_no=<%=vo.getA_no()%>" class="del">삭제</a></td>
			<%
			}
			;
			%>
		</tr>
	</table>
</body>
</html>