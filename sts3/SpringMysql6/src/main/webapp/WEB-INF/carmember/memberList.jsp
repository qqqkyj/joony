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
<button class="btn btn-outline-info" onclick="location.href='addForm'">멤버등록</button>
<c:if test="${count==0 }">
	<h2 class="alert alert-info">등록된 고객정보가 없습니다.</h2>
</c:if>
<c:if test="${count>0 }">
	<h2 class="alert alert-info">총 ${count }명의 고객이 있습니다.</h2>
	
	<hr>

	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<th width="60">번호</th>
			<th width="100">이름</th>	
			<th width="200">핸드폰번호</th>	
			<th width="200">주소</th>	
			<th width="200">가입일</th>
			<th width="240">변경</th>	
		</tr>
	
	<c:forEach var="list" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${list.name }</td>
			<td>${list.hp }</td>
			<td>${list.addr }</td>
			<td>
				<fmt:formatDate value="${list.gaipday }" pattern="yyyy-MM-dd"/>
			</td>
			<td>
				<input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='updateForm?num=${list.num}'">
				<input type="button" value="삭제" class="btn btn-outline-danger" onclick="location.href='delete?num=${list.num}'">
			</td>
		</tr>
	</c:forEach>
	
	</table>

</c:if>

</body>
</html>