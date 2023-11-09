<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
<title>JDBCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCClqk</title>
<body>
	<h2>회원추가테스트 executeupdate 사용</h2>
	<%
	DBConnPool jdbc = new DBConnPool();
	
	String id = "test1"; 
	String pass = "1234";
	String name = "test";
	
	String sql = "INSERT INTO member VALUES (?, ?, ?, system)";
	PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	
	int inResult = pstmt.executeUpdate();
	out.println(inResult + " 행이 입력 됨..");
	
	jdbc.close();
	%>
</body>
</head>
</html>