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
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
  <div style="margin: 50px 100px;">
  	<b>${name }님</b>&nbsp;&nbsp;&nbsp;&nbsp;
     <button type="button" class="btn btn-danger"
     style="width: 100px;" onclick="location.href='logoutprocess'">로그아웃</button>
     <br><br>
     <img alt="" src="${root }/image/K-060.png" width="500" align="left" hspace="20">
    
     
  </div>
</body>
</html>