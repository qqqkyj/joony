<%@page import="model.memberSawon.memberAdminDao"%>
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
	String num = request.getParameter("num");
	memberAdminDao dao = new memberAdminDao();
	dao.deleteMember(num);
	response.sendRedirect("sawonInfo.jsp");
%>
</body>
</html>