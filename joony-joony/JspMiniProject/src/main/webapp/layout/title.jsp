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
	//절대경로잡기
	String root = request.getContextPath();
%>
</body>
<a href="<%=root%>" style="color: black; text-decoration: none;">
JSP & JQuery Mini Project</a>
<div style="float: right; margin-right: 50px;">
<%
	String loginok = (String)session.getAttribute("loginok");
	String myid = (String)session.getAttribute("myid");
	MemberDao dao = new MemberDao();
	String name = dao.getName(myid);
	if(loginok==null){
		%>
		<input type="button" value="로그인" class="btn btn-outline-success" onclick="location.href='<%=root%>/index.jsp?main=login/loginForm.jsp'">
		<%
	}else{
		%>
		<span style="font-size: 0.7em;"><%=name %>님</span>&nbsp;
		<input type="button" value="로그아웃" class="btn btn-outline-danger" onclick="location.href='<%=root%>/index.jsp?main=login/logoutForm.jsp'">
		<%
	}
%>
</div>
</html>