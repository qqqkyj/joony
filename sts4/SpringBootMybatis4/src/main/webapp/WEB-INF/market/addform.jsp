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
<div class="container">
	<form action="add" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 800px;">
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="sang" width="120px;" required="required" class="form-control">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="price" width="120px;" required="required" class="form-control">
				</td>
			</tr>
			<tr >
				<th>상품이미지</th>
				<td>
					<input type="file" name="upload" width="200px;" class="form-control" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				 	<input type="submit" value="저장" class="form-control">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>