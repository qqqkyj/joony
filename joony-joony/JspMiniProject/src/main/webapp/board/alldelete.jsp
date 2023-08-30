<%@page import="data.dao.smartDao"%>
<%@page import="java.util.StringTokenizer"%>
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
	String nums = request.getParameter("nums");

	//,로 분리
	String[] num=nums.split(",");
	//System.out.println(num[0]);
	
	//배열의 길이만큼 삭제하고 목록으로 가기
	smartDao dao = new smartDao();
	
	for(int i=0; i<num.length;i++){
		dao.deleteSmart(num[i]);
	}
	
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
%>
</body>
</html>