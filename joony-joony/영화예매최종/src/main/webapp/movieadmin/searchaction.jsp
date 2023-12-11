<%@page import="Dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%

MovieDao dao=new MovieDao();
String search=request.getParameter("search");
List<MovieDto> list=dao.getmovie(search);

System.out.println(list.size());

response.sendRedirect("../index.jsp?main=movieadmin/searchresult.jsp&list="+list);
%>
</body>
</html>