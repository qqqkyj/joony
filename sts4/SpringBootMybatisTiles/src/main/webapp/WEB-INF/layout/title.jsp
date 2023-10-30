
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
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<a href="/"><img alt="" src="${root }/image/맹구.PNG" style="width: 150px;"> 
<b><!-- SpringBoot+Mybatis+Titles -->
	짱구는 못말려 상점
</b></a>
<c:if test="${sessionScope.loginok!=null }">
	<b style="font-size: 1.2em; float:right; ">${sessionScope.myid }님</b>
	<button type="button" onclick="location.href='${root}/login/logoutprocess'" class="btn btn-danger"
style="float: right; margin-right: 100px;">Logout</button>
</c:if>
<c:if test="${sessionScope.loginok==null }">
	<button type="button" onclick="location.href='${root}/login/main'" class="btn btn-success"
style="float: right; margin-right: 100px;">Login</button>
</c:if>

</body>
</html>