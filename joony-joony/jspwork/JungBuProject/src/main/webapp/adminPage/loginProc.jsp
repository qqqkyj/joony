<%@page import="model.memberSawon.memberAdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String radio = request.getParameter("radio");
	
	session.setAttribute("loginok", id); 
	
	if(radio.equals("admin")){
		if(id.equals("admin")&&pass.equals("admin")){
			session.setAttribute("adminLogin", "success");
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*60*1);//세션 1시간유지
			response.sendRedirect("adminForm.jsp");
		}else{
			%>
			<script type="text/javascript">
				alert("관리자의 아이디와 비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
			<%
		}
		
	}else{
		memberAdminDao dao = new memberAdminDao();
		boolean loginCheck = dao.loginCheck(id, pass);
		
		if(loginCheck){
			session.setAttribute("sawonLogin", "success");
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*60*1);//세션 1시간유지
			response.sendRedirect("../sawonPage/sawonForm.jsp");
		}else{
			%>
			<script type="text/javascript">
				alert("사용자의 아이디와 비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
			<%
		}
	}
	
%>

</body>
</html>