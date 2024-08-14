<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="college.StudentVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.transform.Result"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//데이터베이스 처리
String host = "jdbc:mysql://127.0.0.1:3306/college";
String user = "root";
String pass = "1234";

List<StudentVO> students = new ArrayList<>();

try {
	//1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");

	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);

	//3단계 - sql실행 객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 - sql 실행
	String sql = "select * from `student`";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 - 결과처리
	while(rs.next()){
		StudentVO vo = new StudentVO();
		vo.setStdNO(rs.getString(1));
		vo.setStdName(rs.getString(2));
		vo.setStdHp(rs.getString(3));
		vo.setStdYear(rs.getInt(4));
		vo.setStdAddress(rs.getString(5));
		
		students.add(vo);
	}
	
	//6단계 - 데이터베이스 종료
	rs.close();
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
<script>
		window.onload = function(){
			
			const del = document.querySelectorAll('.del');
			
			// 목록에 '삭제' 링크가 여러개이기 때문에 문서객체 리스트를 반복하면서 이벤트 처리
			// 고전 문서객체 선택함수(getElement~)는 forEach 지원 안함
			del.forEach(function(item){
				
				item.onclick = function(e){

					const result = confirm('정말 삭제 하시겠습니까?');
					
					if(!result){
						e.preventDefault(); // 삭제 취소
					}
				}
			});
		}
	</script>
<title>Stuent List</title>
</head>
<body>
	<h3>학생 목록</h3>
	<a href="/ch06/2.DBCP.jsp">처음으로</a>
	<a href="./register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>학년</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		
		<% for(StudentVO vo : students){ %>
		<tr>
			<td><%= vo.getStdNO() %></td>
			<td><%= vo.getStdName() %></td>
			<td><%= vo.getStdHp() %></td>
			<td><%= vo.getStdYear() %></td>
			<td><%= vo.getStdAddress()%></td>
			<td>
				<a href="./modify.jsp?uid=<%= vo.getStdNO() %>">수정</a>
				<a href="./delete.jsp?uid=<%= vo.getStdNO() %>" class="del">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>