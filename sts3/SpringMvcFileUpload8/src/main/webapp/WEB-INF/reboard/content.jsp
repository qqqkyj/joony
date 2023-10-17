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
<div class="container" style="margin: 100px 100px;">
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
			<c:if test="${dto.photo!='no' }">
				<c:forTokens var="p" items="${dto.photo }" delims=",">
					<img alt="" src="../upload/${p}" style="width: 100px; height: 100px; border: 2px solid green; border-radius: 20px;" >
				</c:forTokens>
			</c:if>			
			<br><br>
			<pre>${dto.content }</pre>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="button" value="글쓰기" onclick="location.href='writeform'" class="btn btn-outline-success">
			<input type="button" value="답글" onclick="location.href='writeform?num=${dto.num}&regroup=${ dto.regroup}&restep=${ dto.restep}&relevel=${dto.relevel }&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="수정" onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="삭제" onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="목록" onclick="location.href='list?currentPage=${currentPage}'" class="btn btn-outline-success">
		</td>
	</tr>
</table>
</div>
</body>
</html>