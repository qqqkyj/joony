<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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

	request.setCharacterEncoding("utf-8");


	MallDto dto = new MallDto();
	
	String no = request.getParameter("no");
	String sangpum = request.getParameter("sangpum");
	String photo = request.getParameter("photo");
	String price = request.getParameter("price");
	String ipgoday = request.getParameter("ipgoday");
	
	dto.setNo(no);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);

	MallDao dao = new MallDao();
	dao.updateMall(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>