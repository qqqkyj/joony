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
<body style="background-color: black;">
<div class="container" style="margin-top: 200px;">
				<table class="table table-bordered">
						<tr>
							<td rowspan="3" align="center" valign="center">
								<img alt="" src="../moviephoto/${dto.mv_poster }" style="width: 100px;">
							</td>
							<td>
								제목: ${dto.mv_title }
							</td>
							<td>
								감독: ${dto.mv_director }
							</td>
							<td>
								개봉일: ${dto.mv_opendate }
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<button class="btn btn-outline-success" onclick="location.href='update?mv_num=${dto.mv_num}'">수정</button>
								<button class="btn btn-outline-success" onclick="location.href='delete?mv_num=${dto.mv_num}'">삭제</button>
								<button class="btn btn-outline-success" onclick="location.href='list'">목록</button>
								<button class="btn btn-outline-success" onclick="location.href='writeform'">글쓰기</button>
							</td>
						</tr>
				</table>
			</div>
</body>
</html>