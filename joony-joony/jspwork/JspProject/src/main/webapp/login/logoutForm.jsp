<%@page import="idx.model.IdxDao"%>
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
	//세션으로 부터 idok
	String id =(String)session.getAttribute("idok");
	
	//아이디에 해당하는 이름을 dao로부터 얻기
	IdxDao dao = new IdxDao();
	String name = dao.getName(id);
%>
<br><br>
<b style="color: gray"><%=name %></b>님이 로그인중~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="로그아웃" class="btn btn-outline-danger" onclick="location.href='logoutAction.jsp'"><br>
<img src='../image/연예인사진/10.jpg' width="200">

</body>
</html>