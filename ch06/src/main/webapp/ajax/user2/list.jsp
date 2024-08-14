<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax::user2</title>
	<script>
	
		window.onload = function(){
			
			const table = document.getElementsByTagName('table')[0];
			
			// 사용자 데이터 요청
			fetch('./proc/getUsers.jsp')
				.then(response=>response.json())
				.then(data => {
					console.log(data);
					
					for(const user of data){
						console.log(user.uid);
						
						const row = `<tr>
			                            <td>\${user.uid}</td>
			                            <td>\${user.name}</td>
			                            <td>\${user.birth}</td>
			                            <td>\${user.addr}</td>
			                            <td>
			                            	<a href='#' class='modify'>수정</a>
			                            	<a href='#' class='delete'>삭제</a>
			                            </td>
			                        </tr>`;
							
						table.insertAdjacentHTML('beforeend', row);
						
					}
				})
				.catch(err => {
					console.log(err);
				});
			
			
			document.body.addEventListener('click',async function(e){
				
				
				// 삭제 클릭 이벤트(동적 이벤트 연결을 위해 body태그에 이벤트 처리를 위임)
				if(e.target.classList.contains('delete')){
					e.preventDefault();

					
					const tr = e.target.closest('tr');
					const uid = tr.children[0].innerText;
					
					// 삭제 요청
					
					    try {
					        // fetch로 서버에 삭제 요청을 보냅니다. (응답을 받을 때까지 기다립니다.)
					        const response = await fetch('./proc/deleteProc.jsp?uid=' + uid);
					        
					        // 응답을 JSON으로 파싱합니다. (파싱이 완료될 때까지 기다립니다.)
					        const data = await response.json();
					        
					        console.log(data);
					        
					        // 결과가 0보다 크면 삭제가 성공했다는 의미입니다.
					        if (data.result > 0) {
					            alert('삭제 했습니다.');
					            tr.remove();  // 해당 행을 DOM에서 제거합니다.
					        }
					    } catch (err) {
					        // 오류가 발생한 경우, 해당 오류를 콘솔에 출력합니다.
					        console.log(err);

						}				
				}
				
				// 수정 클릭 이벤트
				if(e.target.classList.contains('modify')){
			        e.preventDefault();  // 기본 동작 방지
					
					const tr = e.target.closest('tr');
					const uid = tr.children[0].innerText;
					
					location.href = './modify.jsp?uid='+uid;
				}
			});
		}// onload end
		
	</script>
</head>
<body>
	<h3>user2 목록</h3>
	
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
	</table>
	
</body>
</html>