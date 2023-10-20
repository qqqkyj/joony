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
<style type="text/css">
.box{
border: 1px solid white;
border-radius:50px;
width: 50px;
height: 50px;
}
</style>
</head>
<body>
 <div style="margin: 50px 100px; width: 800px;">
 
 <img alt="" src="../맹구.png" width="100px;">
 	<button class="btn btn-info" onclick="location.href='carform'">자동차정보입력</button>
 	<br><br>
 	<h5 class="alert alert-info">
 		<b>총${totalCount }개의 자동차 정보가 있습니다.</b>
 	</h5>
 	<table class="table table-bordered">
 		<tr>
 			<th width="60">번호</th>
 			<th width="100">자동차명</th>
 			<th width="100">색상</th>
 			<th width="160">가격</th>
 			<th width="220">구입일</th>
 			<th width="220">등록일</th>
 			<th width="200">편집</th>
 		</tr>
 		<c:forEach var="list" items="${list }" varStatus="i">
 		<tr>
 			<td>${ i.count}</td>
 			<td>${list.carname }</td>
 			<td align="center"><div class="box" style="background-color: ${list.carcolor}"></div></td>
 			<td><fmt:formatNumber value="${list.carprice }" type="currency"/> </td>
 			<td><fmt:formatDate value="${list.guipday }" pattern="yyyy-MM-dd"/> </td>
 			<td>${list.carguip }</td>
 			<td colspan="2" align="center">
 				<input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='updateForm?num=${list.num}'">
 				<input type="button" value="삭제" class="btn btn-outline-danger" onclick="location.href='delete?num=${list.num}'">
 			</td>
 		</tr>
 		</c:forEach>
 	</table>
 </div>
</body>
</html>