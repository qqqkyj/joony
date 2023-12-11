<%@page import="model.myIntro.IntroDAO"%>
<%@page import="model.myIntro.IntroDTO"%>
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
	String blood=request.getParameter("blood");
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String city=request.getParameter("city");
	
	IntroDTO dto = new IntroDTO();
	dto.setName(name);
	dto.setBlood(blood);
	dto.setHp(hp);
	dto.setCity(city);
	
	IntroDAO dao = new IntroDAO();
	dao.insertIntro(dto);
	
	response.sendRedirect("list.jsp");
	
%>
</body>
</html>