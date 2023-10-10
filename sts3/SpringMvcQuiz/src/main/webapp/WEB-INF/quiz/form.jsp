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
	<form action="result1" class="form-control">
		<input type="text" name="msg">
		<input type="submit" value="result1전송" class="btn btn-outline-success">
	</form>
	
	<form action="result2" method="get" class="form-control">
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>학교</th>
				<td>
					<input type="text" name="school">
				</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<input type="text" name="grade">
				</td>
			</tr>
			<tr>
				<th>학교주소</th>
				<td>
					<input type="text" name="addr">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="result2전송" class="btn btn-outline-success">
				</td>
			</tr>
		</table>
	</form>
	
	<form action="result3" method="post" class="form-control">
		<table class="table table-bordered">
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="sang">
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<input type="text" name="category">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="price">
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td>
					<input type="text" name="color">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="result3전송" class="btn btn-outline-success">
				</td>
			</tr>
		</table>
	</form>
	
	<form action="result4" method="post" class="form-control">
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age">
				</td>
			</tr>
			<tr>
				<th>혈액형</th>
				<td>
					<input type="text" name="blood">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="result4전송" class="btn btn-outline-success">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>