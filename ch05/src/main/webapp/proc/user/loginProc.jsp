<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sub1.UserVO" %>

    
<%
	//전송 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String auto	= request.getParameter("auto"); //auto 값은 체크 시:1 , 체크x: null 값 가짐
	
	// 데이터베이스 작업 생략(1~6단계)
	
	// 회원 abc123/1234 라고 가정
	// 자바에서 문자열 비교는 .eqauls 사용
	if(uid.equals("abc123")  && pass.equals("1234")){
		//회원이 맞을 경우 --> 사용자 객체 생성 후 세션 저장
		
		if(auto!= null){
				
			Cookie autoCookie = new Cookie("auto", uid);
			autoCookie.setMaxAge(60 * 3);
			autoCookie.setPath("/ch05"); // 쿠키경로 : 해당경로 하위에서 쿠키 참조 가능
			response.addCookie(autoCookie);
		}
		
		UserVO userVO = new UserVO();
		userVO.setUid("abc123");
		userVO.setPass("1234");
		userVO.setName("박준우");
		userVO.setHp("010-1223-1123");
		
		session.setAttribute("sessUser", userVO);
		
		// 성공페이지 이동
		response.sendRedirect("./loginSuccess.jsp");
		
		
	}else {
		//회원이 아닐 경우
		response.sendRedirect("./login.jsp?success=fail");
		
	}
	
%>
