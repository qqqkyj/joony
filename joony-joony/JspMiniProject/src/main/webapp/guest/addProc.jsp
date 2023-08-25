<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.text.DefaultTextUI"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	//db에 저장할 아이디얻기
	String myid = (String)session.getAttribute("myid");

	//실제경로
	String realPath = getServletContext().getRealPath("/save");//내가 만든 save폴더에 업로드가 됨
	System.out.println(realPath);
	
	int uploadSize = 1024*1024*3;
	
	MultipartRequest multi = null;
	
	try{
		multi = new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		
		//주의: request가 아닌 multi변수로 모든 데이터를 읽어야 됨
		String content = multi.getParameter("content");
		String photoname = multi.getFilesystemName("photo");
		
		//dto에 저장
		GuestDto dto = new GuestDto();
		
		dto.setMyid(myid);
		dto.setContent(content);
		dto.setPhotoname(photoname);
		
		GuestDao dao = new GuestDao();
		dao.insertGuest(dto);
		
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>