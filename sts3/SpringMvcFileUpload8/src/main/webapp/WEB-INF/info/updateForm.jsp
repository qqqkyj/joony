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
<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }">
	<table class="table table-bordered" style="width: 400px;">
		<caption align="top"><b>개인정보 수정</b>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value="${dto.name }" class="form-control" style="width: 120px;" required="required">
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr" value="${dto.addr }" class="form-control" style="width: 250px;" required="required">
			</td>
		</tr>
		
		<tr>
			<th>사진</th>
			<td>
				<input type="file" name="upload" class="form-control" style="width: 200px;" value="${dto.photo }">
			</td>
		</tr>
		
		<tr>
			<th>운전면허</th>
			<td>
				<input type="radio" name="driver" value="있음" ${dto.driver=="있음"?"checked":"" }>있음&nbsp;&nbsp;
				<input type="radio" name="driver" value="없음" ${dto.driver=="없음"?"checked":"" }>없음
				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success">수정</button>
				<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
			</td>
		</tr>
		</caption>
	</table>
</form>
</body>
</html>