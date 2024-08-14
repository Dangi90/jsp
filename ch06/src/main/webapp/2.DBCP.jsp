<%@page import="shop.CustomerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2.DBCP</title>
<!-- 
		날짜 : 24/08/09
		이름 : 박준우
		내용 : jsp 데이터베이스 DBCP 실습하기
	 -->
</head>
<body>
	<h3>2.DBCP</h3>

	<h4>shop 데이터베이스 CRUD</h4>
	<a href="/ch06/shop/customer/list.jsp">shop-customer</a>
	<br>
	<a href="/ch06/shop/product/list.jsp">shop-product</a>
	<br>

	<h4>bank 데이터베이스 CRUD</h4>
	<a href="/ch06/bank/customer/list.jsp">bank-customer</a>
	<br>
	<a href="/ch06/bank/account/list.jsp">bank-account</a>
	<br>

	<h4>college 데이터베이스 CRUD</h4>
	<a href="/ch06/college/student/list.jsp">college-student</a>
	<br>
	<a href="/ch06/college/lecture/list.jsp">college-lecture</a>
	<br>

	<h4>theater 데이터베이스 CRUD</h4>
	<a href="/ch06/theater/movies/list.jsp">theater-movies</a>
	<br>
	<a href="/ch06/theater/customers/list.jsp">theater-customers</a>
	<br>
</body>
</html>