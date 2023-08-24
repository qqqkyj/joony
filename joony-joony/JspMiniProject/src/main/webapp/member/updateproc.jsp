<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<jsp:useBean id="dao" class="data.dao.MemberDao"/>

<%
	request.setCharacterEncoding("utf-8");
	
	dto.setNum(request.getParameter("num"));
	dto.setName(request.getParameter("name"));
	dto.setPass(request.getParameter("pass"));
	dto.setHp(request.getParameter("hp"));
	dto.setAddr(request.getParameter("addr"));
	dto.setEmail(request.getParameter("email1")+"@"+request.getParameter("email2"));
	
	dao.updateMember(dto);
	response.sendRedirect("../index.jsp?main=member/myinfo.jsp?id="+dto.getId());
%>
</body>
</html>