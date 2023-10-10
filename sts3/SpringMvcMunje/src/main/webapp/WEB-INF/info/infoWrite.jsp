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
	이름:${dto.name }<br>
	좋아하는 색:${dto.color }<br>
	취미:
	
	<%-- <c:if test="${empty dto.hobby }">
		없음
	</c:if>
	<c:if test="${not empty dto.hobby }">
		<c:forEach var="h" items="{dto.hobby}">
			[${h}]
		</c:forEach>
	</c:if> --%>
	
	<c:choose>
		<c:when test="${not empty dto.hobby }">
			<c:forEach  var="hobby" items="${dto.hobby}">
				[${hobby }]&nbsp;
			</c:forEach>
		</c:when>
		<c:otherwise>
			없음
		</c:otherwise>
	</c:choose>
	<br>
	가장 좋아하는 언어:${dto.language }
	
</body>
</html>