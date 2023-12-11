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
		<form action="insert" method="post" enctype="multipart/form-data">"
			<table class="table table-bordered">
				<caption align="top"><b>회원전용 글쓰기</b></caption>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="form-control" required="required" autofocus="autofocus">
					</td>
				</tr>
				
				<tr>
					<th>파일업로드</th>
					<td>
						<input type="file" name="upload" class="form-control">
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea style="height: 150px;" name="content" class="form-control" required="required"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-info">등록</button>
						<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>