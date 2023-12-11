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
<div style="margin: 100px 50px;">
	<form action="update" method="post">
		<table class="table table-bordered" style="width: 350px;">
			<input type="hidden" name="num" value="${dto.num }">
			<tr>
				<th>자동차명</th>
				<td>
					<input type="text" name="carname" required="required" class="form-control" value="${dto.carname }">
				</td>
			</tr>
			<tr>
				<th>자동차가격</th>
				<td>
					<input type="text" name="carprice" required="required" class="form-control" value="${dto.carprice }">
				</td>
			</tr>
			<tr>
				<th>자동차색상</th>
				<td>
					<input type="color" name="carcolor" required="required" class="form-control" value="${dto.carcolor }">
				</td>
			</tr>
			<tr>
				<th>자동차구입일</th>
				<td>
					<input type="date" name="carguip" required="required" class="form-control" value="${dto.carguip}">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-outline-info" value="DB수정">
					<input type="button" class="btn btn-outline-success" onclick="location.href='list'" value="목록">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>