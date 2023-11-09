<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="door.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
%>
username: <%= username%>
<br>

password:<%= password %>
db 값과 비교
<%
String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass= ?";
JDBConnect jdbc = new JDBConnect();
PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
pstmt.setString(1, username);
pstmt.setString(2, password);
ResultSet rs = pstmt.executeQuery();
boolean isLogin = false;
while(rs.next()) {
	String id = rs.getString(1);
	String pass = rs.getString(2);
	String name = rs.getString(3);
	java.sql.Date regiDate = rs.getDate("regidate");
	
	out.println(String.format("%s %s %s %s", id, pass, name, regiDate) + "</br>");
	isLogin = true;
	session.setAttribute("id", id);
}
%><a href="./login.jsp">로그인</a>
</body>
</html>