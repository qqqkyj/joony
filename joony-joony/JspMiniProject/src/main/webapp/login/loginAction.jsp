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
	String pass = request.getParameter("pass");
	String cbsave = request.getParameter("cbsave");//체크안하면 null
	
	MemberDao dao = new MemberDao();
	boolean check = dao.isIdPass(id, pass);
	
	//아이디와 비번이 맞으면 3개의 세션을 저장하고 로그인메인으로 이동
	if(check){
		session.setMaxInactiveInterval(60*60*3);//3시간
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		
		//로그인메인으로 이동
		response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
		<%
	}
	
%>
</body>
</html>