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
	<table class="table table-bordered"> 
		<c:forEach var="dto" items="${list }">
			<tr>
				<td rowspan="6" align="center">
					<img alt="" src="../membersave/${dto.photo }" style="width: 200px; height: 200px;">
				</td>
				<td>
					${dto.name }
				</td>
			</tr>
			
			<tr>
				<td>
					${dto.id }
				</td>
			</tr>
			<tr>
				<td>
					${dto.hp }
				</td>
			</tr>
			<tr>
				<td>
					${dto.addr }
				</td>
			</tr>
			<tr>
				<td>
					${dto.email }
				</td>
			</tr>
			<tr>
				<td>
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
					<input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='updateform?num=${dto.num}'">	
					<input type="button" value="삭제" class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}'">	
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>