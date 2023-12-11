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
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String currentPage = request.getParameter("currentPage");
%>
<jsp:useBean id="dto" class="data.dto.smartDto"/>
<jsp:useBean id="dao" class="data.dao.smartDao"/>

<jsp:setProperty property="*" name="dto"/>

<%
	dao.updateSmart(dto);
	response.sendRedirect("../index.jsp?main=board/contentview.jsp?num="+dto.getNum()+"&currentPage="+currentPage);
%>
</body>
</html>