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
<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
  <!-- 로그인 안하면 기본사진,로그인 하면 자기사진으로 변경 -->
  <c:if test="${sessionScope.loginok==null }">
     <img alt="" src="${root }/image/b8.png" style="width: 80px;  border-radius:30px;"><br>
  </c:if>
  
  <c:if test="${sessionScope.loginok!=null }">
     <img alt="" src="${root }/membersave/${sessionScope.loginphoto}" style="width: 80px;  border-radius:30px;"><br>
  </c:if>
  	<i class="bi bi-envelope-paper-heart"></i>&nbsp;bitcamp@gmail.com<br>
	<i class="bi bi-person-square" style="font-size:26px"></i>&nbsp; 네이버 재직<br>
	<i class="bi bi-telephone-inbound" style="font-size:26px"></i>&nbsp;02-2333-4545<br>
	<a href="https://www.instagram.com/illusomina/"  >
	<img alt="" src="../image/instar.PNG" style="width: 30px;"></a>

</body>
</html>