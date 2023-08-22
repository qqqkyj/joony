<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	//톰캣에 업로드된 프로젝트 경로 구하기
	ServletContext context = getServletContext();
	//프로젝트의 upload의 실제경로 구하기
	String realFolder=context.getRealPath("/upload");
	
	System.out.println(realFolder);
	
	//업로드 허용되는 크기지정
	int uploadSize=1024*1024*5;//5mega byte
	MultipartRequest multi = null;
	
	try{
		multi = new MultipartRequest(request,realFolder,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		
		String writer = multi.getParameter("writer");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String imgname = multi.getFilesystemName("imgname");
		
		QuizBoardDao dao = new QuizBoardDao();
		QuizBoardDto dto = new QuizBoardDto();
		
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		if(imgname==null){
			dto.setImgname("../image/noImg.PNG");
		}else{
			dto.setImgname("../upload/"+imgname);
		}
		
		dao.insertBoard(dto);
		
		response.sendRedirect("quizlist.jsp");
		
		
	}catch(Exception e){
		System.out.println("업로드 오류: "+e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>