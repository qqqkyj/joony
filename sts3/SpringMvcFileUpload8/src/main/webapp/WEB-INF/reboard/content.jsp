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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>게시판 상세페이지</title>
</head>
<body>
<div class="container">
<table class="table table-bordered">
	<tr>
		<td>
			<b>${dto.subject }</b><br>
			<i class="bi bi-person-circle"></i>
			${dto.writer }
			<small style="float: right; margin-right: 150px;">작성일:<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;조회수:${dto.readcount }</small>			
		</td>
	</tr>
	<tr>
		<td>
			<c:forEach var="p" items="${dto.photo }">
				<c:if test="${p=='no' }">
					<img alt="" src="../photo/noimg.png">
				</c:if>
				<c:if test="${p!='no' }">
					<img alt="" src="../upload/${p}">
				</c:if>			
			</c:forEach>
			${dto.content }
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" value="목록" onclick="location.href='list?currentPage=${currentPage}'" class="btn btn-outline-success">
		</td>
	</tr>
</table>
</div>
</body>
</html>