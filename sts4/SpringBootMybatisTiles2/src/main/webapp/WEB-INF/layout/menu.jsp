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
  ul.menu{
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
    background-color: #ffebcd;
    cursor: pointer;
    border-radius: 20px;
    font-family: 'Noto Serif KR';
	font-size: 17px;
  }
  
  ul.menu li a{
    text-decoration: none;
    color: black;
  }
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
  <ul class="menu">
    <li>
      <a href="/">Home</a>
    </li>
    <li>
      <a href="${root }/smart/list">스마트샵</a>
    </li>
    <li>
      <a href="${root }/ipgo/list">상품목록</a>
    </li>
    <li>
      <a href="${root }/reboard/list">답변형게시판</a>
    </li>
    <li>
      <a href="${root }/member/list">회원목록</a>
    </li>
    <li>
      <a href="${root }/member/myinfo">나의정보</a>
    </li>
    <li>
      <a href="${root }/memboard/list">회원게시판</a>
    </li>
    <li>
      <a href="${root }/load/map">오시는길</a>
    </li>
  </ul>
</body>
</html>