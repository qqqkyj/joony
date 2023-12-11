<%@page import="model.sinsang.SinsangDTO"%>
<%@page import="model.sinsang.SinsangDAO"%>
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
<%
	String num = request.getParameter("num");
	SinsangDAO dao = new SinsangDAO();
	SinsangDTO dto = dao.getData(num);
%>
<body>
<form action="updateAction.jsp" method="post">
<!-- hidden은 위치상관없이 폼안에만 있으면 됨, 시퀀스 번호를 숨겨서 넘겨준다. -->
<input type="hidden" name="num" value="<%=num%>">
	<table class="table table-bordered" style="width: 400px;">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" size="7" value="<%=dto.getName() %>" required="required" class="form-control">
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr" size="7" value="<%=dto.getAddr() %>" required="required" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정" class="btn btn-warning">
				<input type="button" value="목록" onclick="location.href='list.jsp'"
				class="btn btn-success">
			</td>
		</tr>
	</table>
</form>
</body>
</html>