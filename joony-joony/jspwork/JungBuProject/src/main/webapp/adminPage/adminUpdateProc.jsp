<%@page import="model.memberSawon.memberAdminDto"%>
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
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String position = request.getParameter("position");
	String department = request.getParameter("department");
	String addr = request.getParameter("addr");
	
	memberAdminDto dto = new memberAdminDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setPass(pass);
	dto.setHp(hp);
	dto.setPosition(position);
	dto.setDepartment(department);
	dto.setAddr(addr);
	
	
	memberAdminDao dao = new memberAdminDao();
	dao.updateMember(dto);
	
	response.sendRedirect("sawonInfo.jsp");
%>
</body>
</html>