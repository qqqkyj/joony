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
/* ul.menu{
	list-style: none;
}

ul.menu li{
	width: 120px;
	float: left;
	border: 1px solid gray;
	height: 60px;
	line-height: 60px;
	text-align: center;
	margin-right: 10px;
	font-size: 24px;
	font-family: 'Dongle';
	background-color: #ffc;
	cursor: pointer;
}

ul.menu a{
	text-decoration: none;
	color: black;
} */
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="menu">
	  <a href="/">Home</a>
	  <a href="${root }/ipgo/ipgoform">상품등록</a>
	  <a href="${root }/ipgo/list">상품목록</a>>
	  <a href="${root }/reboard/list">답변형게시판</a>
	  <a href="${root }/member/list">회원목록</a>
	  <a href="${root }/member/myinfo">나의정보</a>
	  <a href="${root }/memboard/list">회원게시판</a>
	  <%-- <a href="${root }/login/main">로그인</a> --%>
	  <a href="${root }/load/map">오시는 길</a>
	  <a href="${root }/daou/intro">다우기술</a>
	</div>
	<%-- <ul class="menu">
		<li>
			<a href="${root }">Home</a>
		<li>
			<a href="${root }/ipgo/ipgoform">상품등록</a>
		</li>
		<li>
			<a href="${root }/ipgo/list">상품목록</a>
		</li>
		<li>
			<a href="${root }/board/list">게시판</a>
		</li>
		<li>
			<a href="${root }/member/list">회원목록</a>
		</li>
		<li>
			<a href="${root }/member/form">회원가입</a>
		</li>
		<li>
			<a href="${root }/load/map">오시는 길</a>
		</li>
	</ul> --%>
</body>
</html>