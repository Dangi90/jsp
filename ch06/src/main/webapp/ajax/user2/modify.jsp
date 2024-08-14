<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%
String uid = request.getParameter("uid");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax::user2</title>

<script>
		
		window.onload = function() {
			
			//주소 파라미터 파싱
			const params = location.href.split('?')[1];
			const value = params.split('=')[1];
			
			//문서객체 생성
			const form = document.getElementsByTagName('form')[0];
			const btnSubmit = form.submit;
			
			//수정하기 버튼 이벤트
			btnSubmit.onclick = (event) =>{
				
				event.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

				const jsonData ={
						"uid": form.uid.value,
	                    "name": form.name.value,
	                    "birth": form.birth.value,
	                    "addr": form.addr.value,
	                    						
				};
				
				fetch('./proc/modifyProc.jsp?uid=<%=uid%>', {
					method: 'POST',
					headers: {'Content-Type': 'application/json'},
					body: JSON.stringify(jsonData)
				})
					.then(res => res.json())
					.then(data =>{
						alert('수정 되었습니다.');
						location.href='./list.jsp';
					})
					.catch(err =>{
						console.log(err);
					})
			}
			//수정 데이터 요청하기
			fetch('./proc/getUser.jsp?uid='+value)
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					form.uid.value = data.uid;
					form.name.value = data.name;
					form.birth.value = data.birth;
					form.addr.value = data.addr;
					})
				.catch(err => {
					console.log(err);
				});
		}//onload end
		
	</script>
</head>
<body>
	<h3>user1 수정</h3>

	<a href="./list.jsp">목록이동</a>
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="" readonly /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="" /></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value="" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit"
					name="submit" value="수정하기" /></td>
			</tr>
		</table>

	</form>
</body>
</html>