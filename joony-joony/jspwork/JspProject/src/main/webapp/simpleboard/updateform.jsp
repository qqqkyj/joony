<%@page import="db.simpleboard.simpleBoardDto"%>
<%@page import="db.simpleboard.simpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num = request.getParameter("num");
	simpleBoardDao dao = new simpleBoardDao();
	simpleBoardDto dto = dao.getData(num);
%>
<body>
	<div style="margin: 30px 30px; width: 400px;">
		<form action="updateaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
			<table class="table table-bordered">
				<caption align="top"><b><i class="bi bi-vector-pen"></i>글수정</b></caption>
				
				<tr>
					<th style="background-color: #d3d3d3">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" value="<%=dto.getWriter() %>"
						required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #d3d3d3">비밀번호</th>
					<td>
						<input type="password" name="pass" class="form-control"
						required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #d3d3d3">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" value="<%=dto.getSubject() %>"
						required="required" autofocus="autofocus" style="width: 270px">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea style="width: 390px; height: 150px;" class="form-control"
						required="required" name="story"><%=dto.getStory() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<!-- type이 image이거나 submit이면 기본이 submit입니다. -->
						<input type="image" src="../image/submit_button_img.PNG" style="width: 70px;">
						<input type="image" src="../image/list_button_img.PNG" style="width: 70px;"
						onclick="location.href='boardlist.jsp';return false;">
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>