<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String jsonData="{\"uid\":\"a101\", \"name\":\"홍길동\"\"나이\":\"23\"\"addr\":\"김해\"}";
	
	out.print(jsonData);
%>