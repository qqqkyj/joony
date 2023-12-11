<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.myIntro.IntroDTO"%>
<%@page import="model.myIntro.IntroDAO"%>
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
	IntroDAO dao = new IntroDAO();
	IntroDTO dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<table class="table table-bordered">
	<caption align="top"><b>회원상세정보</b></caption>
	<tr>
		<th>이름</th>
		<td><%=dto.getName() %></td>
	</tr>
	
	<tr>
		<th>혈액형</th>
		<td><%=dto.getBlood() %></td>
	</tr>
	
	<tr>
		<th>핸드폰번호</th>
		<td><%=dto.getHp() %></td>
	</tr>
	
	<tr>
		<th>지역</th>
		<td><%=dto.getCity() %></td>
	</tr>

	<tr>
		<th>가입일</th>
		<td><%=sdf.format(dto.getGaipday()) %></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="button" onclick="location.href='list.jsp'" value="회원리스트" class="btn btn-outline-info">
		</td>
	</tr>
</table>
</body>
</html>