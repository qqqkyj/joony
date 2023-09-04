<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ShopDao"%>
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
	//업로드 경로
	String uploadPath = getServletContext().getRealPath("/shopsave");
	System.out.println(uploadPath);
	//업로드 사이즈
	int uploadSize = 1024*1024*5;
	
	MultipartRequest multi = null;
	
	try{
	
	multi = new MultipartRequest(request,uploadPath,uploadSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String category = multi.getParameter("category");
	String sangpum= multi.getParameter("sangpum");
	String photo = multi.getFilesystemName("photo");
	int price = Integer.parseInt(multi.getParameter("price"));
	String ipgoday = multi.getParameter("ipgoday");
	
	ShopDao dao = new ShopDao();
	ShopDto dto = new ShopDto();
	
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	dao.insertShop(dto);
	
	response.sendRedirect("addform.jsp");
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>