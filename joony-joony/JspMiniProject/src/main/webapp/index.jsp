<%@page import="java.nio.charset.MalformedInputException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
 <style type="text/css">
 	div.layout{
 		border: 0px solid gray;
 		position:absolute;
 	}
 	
 	div.title{
 		width: 100%;
 		height: 80px;
 		line-height: 80px;
 		font-size: 30px;
 		font-family: 'Dongle';
 		text-align: center;
 	}
 	
 	div.menu{
 		width: 100%;
 		height: 80px;
 		line-height: 80px;
 		font-family: 'Dongle';
 		text-align: center;
 		top: 80px;
 	}
 	
 	div.info{
 		width: 180px;
 		height: 500px;
 		line-height: 10px;
 		font-family: 'Dongle';
 		left: 30px;
 		top: 300px;
 		padding: 20px 10px;
 		border: 0px groove gray;
 		border-radius: 30px;
 	}
 	
 	div.main{
 		width: 1200px;
 		height: 1000px;
 		font-size: 13pt;
 		font-family: 'Gaegu';
 		left: 300px;
 		top: 200px;
 		padding-left: 100px;
 	}
 	
 </style>
</head>
<%
	//절대경로잡기
	String root = request.getContextPath();
	String mainPage = "layout/main.jsp";//기본페이지

	//url을 통해서 main값을 얻어서 메인웹페이지에 출력
	if(request.getParameter("main")!=null){
		mainPage = request.getParameter("main");
	}
%>
<body>
<div class="layout title">
	<jsp:include page="layout/title.jsp"></jsp:include>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"></jsp:include>
</div>
<div class="layout info">
	<jsp:include page="layout/info.jsp"></jsp:include>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"></jsp:include>
</div>
</body>
</html>