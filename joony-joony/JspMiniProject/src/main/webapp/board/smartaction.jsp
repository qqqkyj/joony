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
%>
<jsp:useBean id="dto" class="data.dto.smartDto"/>
<jsp:useBean id="dao" class="data.dao.smartDao"/>

<jsp:setProperty property="*" name="dto"/>
<%
	//db에 insert
	dao.insertSmart(dto);

	//maxNum, 최근에 추가한 num의 값을 얻어옴
	int num=dao.getMaxNum();

	//목록으로 이동
	//response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	
	//디테일페이지로 이동
	response.sendRedirect("../index.jsp?main=board/contentview.jsp?num="+num);
	
%>
</body>
</html>