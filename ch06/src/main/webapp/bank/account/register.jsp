<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<h3>등록</h3>

	<a href="../2.DBCP.jsp">처음으로</a>
	<a href="./list.jsp">목록</a>

	<form action="./registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>계좌번호</td>
				<td><input type="text" name="a_no" /></td>
			</tr>
			<tr>
				<td>계좌구분</td>
				<td><input type="text" name="a_item_list" /></td>
			</tr>
			<tr>
				<td>계좌이름</td>
				<td><input type="text" name="a_item_name" /></td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td><input type="text" name="a_c_no" /></td>
			</tr>
			<tr>
				<td>계좌현금</td>
				<td><input type="text" name="a_balance" /></td>
			</tr>
			<tr>
				<td>등록날짜</td>
				<td><input type="text" name="a_open_date" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="등록하기" />
				</td>
			</tr>

		</table>

	</form>
</body>
</html>