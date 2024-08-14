<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String 	xml = "<user>";	
			xml += "<uid>a101</uid>";
			xml += "<name>김유신</name>";
			xml += "<hp>010-1234-5678</hp>";
			xml += "<age>23</age>";
			xml += "</user>";
	
	out.print(xml);

%>