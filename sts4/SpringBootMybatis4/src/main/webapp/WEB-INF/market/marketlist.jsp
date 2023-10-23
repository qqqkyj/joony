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
<div class="alert alert-info">
	<c:if test="${totalCount==0 }">
		<b>저장된 상품정보가 없습니다.</b>
	</c:if>
	<c:if test="${totalCount>0 }">
		<b>총 ${totalCount }개의 상품정보가 있습니다.</b>
	</c:if>
</div>

<div class="container">
	<table class="table table-bordered" style="width: 1000px;" >
		<tr valign="center" align="center">
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>입고일자</th>
			<th>편집</th>
		</tr>
		<c:forEach var="mdto" items="${list }" varStatus="i">
			<tr valign="center" align="center">
				<td>${i.count }</td>
				<td>
					${mdto.sang }
					<c:if test="${mdto.photoname!='no'}">
						<c:forEach var="p" items="${mdto.photoname }">
							<img alt="" src="../save/${p }" width="80px;">
						</c:forEach>
					</c:if>					
				</td>
				<td>
					<fmt:formatNumber value="${mdto.price }" type="currency"/>
				</td>
				<td>
					<fmt:formatDate value="${mdto.ipgoday }" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					<button type="button" class="btn btn-outline-warning" onclick="location.href='updateform?num=${mdto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="location.href='delete?num=${mdto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div style="margin: 50px 100px;">
<button type="button" class="btn btn-info" onclick="location.href='writeform'">글쓰기</button>
</div>

</body>
</html>