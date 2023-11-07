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
<div class="main">
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<img alt="" src="${root }/image/상점1.PNG" ">
	<img alt="" src="${root }/image/상점2.PNG" ">
	<img alt="" src="${root }/image/상점3.PNG" ">
	<img alt="" src="${root }/image/상점4.PNG" ">
	<img alt="" src="${root }/image/상점5.PNG" ">
	<h2>Main Page 입니다.</h2>
</div>
</body>
</html>