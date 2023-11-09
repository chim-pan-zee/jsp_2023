<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
if (list == null) {
	out.println("null");
	return;
}
for (String str : list) {
	out.print(str + "<br />");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sesssssssssssssssssion</title>
</head>
<body>
	<h2>페ㅔ이지이동세셔ㅑㄴ영역속성일깅</h2>
</body>
</html>