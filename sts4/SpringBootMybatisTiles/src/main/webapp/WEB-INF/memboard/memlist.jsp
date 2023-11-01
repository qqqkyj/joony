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
<div class="container" style="margin: 50px;">
<c:if test="${sessionScope.loginok!=null }">
	<button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
</c:if>
<br><br>
<table class="table table-bordered" style="width: 1000px;">
	<tr class="table-secondary">
		<th width="60">번호</th>
		<th width="360">제목</th>
		<th width="160">작성자</th>
		<th width="100">조회</th>
		<th width="260">등록일</th>	
	</tr>
	<c:if test="${totalCount==0 }">
		<tr>
			<td colspan="5" align="center">
				<h4>등록된 글이 없습니다.</h4>
			</td>
		</tr>
	</c:if>
</table>
</div>
</body>
</html>