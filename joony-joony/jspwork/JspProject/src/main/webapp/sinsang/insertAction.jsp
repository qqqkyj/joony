<%@page import="model.sinsang.SinsangDAO"%>
<%@page import="model.sinsang.SinsangDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<%
		String name=request.getParameter("name");
		String addr=request.getParameter("addr");
		
		//입력데이터를 DTO로 묶어서
		SinsangDTO dto = new SinsangDTO();
		
		dto.setName(name);
		dto.setAddr(addr);
		
		//insert메서드 전달
		SinsangDAO dao = new SinsangDAO();
		dao.insertSinsang(dto);
		
		//출력 jsp로 이동.. url이 바뀜
		response.sendRedirect("list.jsp");
		
	%>
</body>
</html>