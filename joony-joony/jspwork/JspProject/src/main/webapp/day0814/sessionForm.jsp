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
		session.setAttribute("msg", "Happy!!");
		session.setMaxInactiveInterval(10);//default는 30분
	%>
	<h2>10초안에 눌러주세요</h2>
	<form action="sessionAction.jsp" method="post">
		<h2>가고 싶은 여행지</h2>
		<input type="radio" value="베트남 3박4일" name="travel" checked>베트남 3박4일 &nbsp;
		<input type="radio" value="일본 3박4일" name="travel">일본 3박4일 &nbsp;
		<input type="radio" value="미국 3박4일" name="travel">미국 3박4일 &nbsp;
		<input type="radio" value="태국 3박4일" name="travel">태국 3박4일 &nbsp;
		<input type="radio" value="중국 3박4일" name="travel">중국 3박4일 &nbsp;
		<input value="여행당첨" type="submit">
	</form>
</body>
</html>