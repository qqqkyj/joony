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
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	String name=dao.getName(id);
%>

<div style="margin: 200px 200px">
	<img alt="" src="../image/짱구/짱구2.PNG">
	<%=name %>님 회원가입이 완료되었습니다.<br>
</div>

<button class="btn btn-outline-success" onclick="location.href='index.jsp?main=login/loginForm.jsp'" style="width: 100px;">로그인</button>
<button class="btn btn-outline-success" onclick="location.href='index.jsp'" style="width: 100px;">메인으로 이동</button>
</body>
</html>