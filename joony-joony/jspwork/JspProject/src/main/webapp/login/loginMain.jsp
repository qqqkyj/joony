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
	String loginok = (String)session.getAttribute("loginok");
	
	if(loginok==null || loginok.equals("")){//로그아웃상태(즉, 로그인이 필요)
	%>
		<jsp:include page="loginForm.jsp"/>
	<%
	}else{//로그인상태(즉, 로그아웃을 할 수 있어야됨)
		%>
		<jsp:include page="logoutForm.jsp"></jsp:include>
		<%
	}
%>
</body>
</html>