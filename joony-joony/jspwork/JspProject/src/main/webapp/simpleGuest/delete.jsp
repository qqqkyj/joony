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
	String num = request.getParameter("num");
	String check = request.getParameter("check");
%>

<jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>

<%
	boolean checkPass = dao.isEqualPass(num, check);
	if(checkPass){
		dao.deleteGuest(num);
		response.sendRedirect("guestList.jsp");
	}else{
		%>
			<script>
				alert("비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
		<%
	}
%>

</body>
</html>