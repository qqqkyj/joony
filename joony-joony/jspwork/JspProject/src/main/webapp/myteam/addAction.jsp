<%@page import="model.myteam.TeamDto"%>
<%@page import="model.myteam.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String driver=(request.getParameter("driver")==null)?"없음":"있음";
	String addr = request.getParameter("addr");
	
	TeamDto dto = new TeamDto();
	dto.setName(name);
	dto.setDriver(driver);
	dto.setAddr(addr);
	
	TeamDao dao = new TeamDao();
	dao.insertMyTeam(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>