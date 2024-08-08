<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 해제(세션정보 초기화)
	// session.removeAttribute("sessUser"); -->아래 invalidate로 한번에 처리
	session.invalidate();
	
	//자동 로그인 쿠키 삭제
	Cookie autoCookie = new Cookie("auto", null);
	autoCookie.setMaxAge(0);
	autoCookie.setPath("/ch05"); // 쿠키경로 : 해당경로 하위에서 쿠키 참조 가능
	response.addCookie(autoCookie);
	
	response.sendRedirect("./login.jsp?login.success");
	
%>