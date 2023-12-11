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
<body style="background-color: black">

<div class="container" style="margin-top: 100px; padding: 50px;">
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<tr>
				<th>영화제목</th>
				<td>
					<input type="text" name="mv_title" class="form-control" required="required" style="width: 120px;">
				</td>	
			</tr>
			<tr>
				<th>감독</th>
				<td>
					<input type="text" name="mv_director" class="form-control" required="required" style="width: 120px;">
				</td>	
			</tr>
			<tr>
				<th>개봉일자</th>
				<td>
					<input type="date" name="mv_opendate" class="form-control" required="required" style="width: 120px;">
				</td>	
			</tr>
			<tr>
				<th>포스터</th>
				<td>
					<input type="file" name="upload" class="form-control">
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장" class="btn btn-outline-success">
					<input type="button" value="목록" class="btn btn-outline-success" onclick="location.href='list'">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>