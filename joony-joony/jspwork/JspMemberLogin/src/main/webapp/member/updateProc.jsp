<%@page import="member.model.MemberDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="member.model.MemberDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String realPath = getServletContext().getRealPath("/upload");
	
	//업로드 허용되는 크기지정
	int uploadSize=1024*1024*3;//3mega byte
	MultipartRequest multi = null;
	
	try{
	multi = new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	String num = multi.getParameter("num");
	String pass = multi.getParameter("pass");
	String name = multi.getParameter("name");
	String image = multi.getFilesystemName("uploadImage");
	String hp = multi.getParameter("hp");

	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setPass(pass);
	dto.setName(name);
	dto.setHp(hp);
	
	MemberDao dao = new MemberDao();
	
	if(image==null){
		//사진을 선택하지 않은 경우: 기존에 있던 이미지를 유지
		String photo=dao.getData(num).getImage();
		dto.setImage(photo);
		
	}else{
		dto.setImage("upload/"+image);//사진을 선택한 경우	
	}
		
	dao.updateMember(dto);
	
	response.sendRedirect("memberList.jsp");
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>