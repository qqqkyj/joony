<%@page import="db.simpleboard.simpleBoardDto"%>
<%@page import="db.simpleboard.simpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="db.simpleboard.simpleBoardDto"/>
<jsp:useBean id="dao" class="db.simpleboard.simpleBoardDao"/>

<jsp:setProperty property="num" name="dto"/>
<jsp:setProperty property="writer" name="dto"/>
<jsp:setProperty property="subject" name="dto"/>
<jsp:setProperty property="story" name="dto"/>

<%
	dao.updateBoard(dto);
	response.sendRedirect("detailview.jsp?num="+dto.getNum());
%>
</body>
</html>