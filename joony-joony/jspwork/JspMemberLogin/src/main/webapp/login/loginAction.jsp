<%@page import="member.model.MemberDao"%>
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
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String save = request.getParameter("savechk");
	
	MemberDao dao = new MemberDao();
	boolean loginCheck = dao.isLogin(id, pass);
	
	if(loginCheck){
		session.setAttribute("loginSuccess", "success");
		session.setAttribute("idok", id);
		session.setAttribute("saveok", save);
		
		session.setMaxInactiveInterval(60*60*8);
		
		response.sendRedirect("../member/memberList.jsp");
		
	}else{
		%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다!");
			history.back();
		</script>
		<%
	}
%>
</body>
</html>