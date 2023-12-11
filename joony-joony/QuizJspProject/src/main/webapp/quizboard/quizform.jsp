<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div style="margin: 30px 30px; width: 400px;">
		<form action="quizaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<caption align="top"><b><i class="bi bi-vector-pen"></i>글쓰기</b></caption>
				
				<tr>
					<th style="background-color: #d3d3d3">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control"
						required="required" autofocus="autofocus" style="width: 150px">
					</td>
				</tr>
				
				<tr>
					<th style="background-color: #d3d3d3">제목</th>
					<td>
						<input type="text" name="title" class="form-control"
						required="required" autofocus="autofocus" style="width: 270px">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea style="width: 390px; height: 150px;" class="form-control"
						required="required" name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="file" name="imgname" class="form-control">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-outline-success" value="전송">
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>