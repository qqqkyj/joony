<%@page import="db.simpleguest.SimpleGuestDao"%>
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
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	SimpleGuestDao dao = new SimpleGuestDao();
	boolean passCheck = dao.isEqualPass(num, pass);
	
	if(passCheck){
		%>
		<jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>
		
		<jsp:setProperty property="*" name="dto"/>
		<%
			dao.updateGuest(dto);
		
			response.sendRedirect("guestList.jsp");
	}else{
		%>
		<script>
			alert("비밀번호가 틀렸습니다!!");
			history.back();
		</script>
		<%
	}
%>

</body>
</html>