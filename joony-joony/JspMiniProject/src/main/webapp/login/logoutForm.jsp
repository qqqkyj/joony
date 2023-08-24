<%@page import="data.dao.MemberDao"%>
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
<%
	//세션으로부터 아이디를 얻기
	String myid = (String)session.getAttribute("myid");
	MemberDao dao = new MemberDao();
	
	//db에 있는 이름 가져오기
	String name = dao.getName(myid);
%>
<div style="margin: 100px 200px;">
	<img alt="" src="image/짱구/짱구4.PNG" width="150px;">
	<br><br>
	<b><%=name %></b>님이 로그인 하셨습니다.</b>
	<button type="button" class="btn btn-danger" onclick="location.href='login/logoutAction.jsp'">로그아웃</button>
</div>
</body>
</html>