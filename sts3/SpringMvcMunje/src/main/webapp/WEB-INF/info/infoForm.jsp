<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="result" method="post">
	<table class="table table-bordered" style="width: 300px;">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" class="form-control" style="width: 100px;">
		</td>
	</tr>
	<tr>
		<th>좋아하는 색</th>
		<td>
			<input type="color" name="color" class="form-control" style="width: 100px;">
		</td>
	</tr>
	<tr>
		<th>취미</th>
		<td>
			<input type="checkbox" name="hobby" value="웨이트"  style="width: 100px;" checked="checked">웨이트
			<input type="checkbox" name="hobby" value="복싱"  style="width: 100px;">복싱
			<input type="checkbox" name="hobby" value="테니스"  style="width: 100px;">테니스
			<input type="checkbox" name="hobby" value="골프"  style="width: 100px;">골프
			<input type="checkbox" name="hobby" value="주짓수"  style="width: 100px;">주짓수
		</td>
	</tr>
	<tr>
		<th>가장 좋아하는 언어</th>
		<td>
			<select name="language" class="form-control">
				<option value="java">java</option>
				<option value="html">html</option>
				<option value="oracle">oracle</option>
				<option value="jsp">jsp</option>
				<option value="spring">spring</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송" class="form-control">
		</td>
	</tr>
	</table>
	
</form>
</body>
</html>