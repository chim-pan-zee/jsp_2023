<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getMemberDTO(userId, userPwd);

dao.close();

if (dto.getId() != null) {
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("userName", dto.getName());
	response.sendRedirect("LoginForm.jsp");
} else {
	request.setAttribute("LogionErrMsg", "Login ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
	request.getRequestDispatcher("LogionForm.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

</html>