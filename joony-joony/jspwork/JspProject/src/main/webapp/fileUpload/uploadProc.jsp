<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("/upload");
		
		System.out.println(realFolder);
		
		int fileSize=1024*1024*3;//3mega byte
		
		MultipartRequest multi = null;
		
		try{
		multi=new MultipartRequest(request, realFolder, fileSize, "utf-8" , new DefaultFileRenamePolicy());
		
		String writer = multi.getParameter("writer");
		String subject = multi.getParameter("subject");
		String uploadName = multi.getFilesystemName("uFile");
		String originalFileName = multi.getOriginalFileName("uFile");
		%>
		
		<table class="table table-bordered">
			<tr>
				<th>글쓴이</th>
				<td><%=writer %></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><%=subject %></td>
			</tr>
			
			<tr>
				<th>파일이미지</th>
				<td><img src="../upload/<%=uploadName%>"></td>
			</tr>
			
			<tr>
				<th>파일명</th>
				<td><%=originalFileName %></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input value="파일업로드" onclick="location.href='uploadForm.jsp'" class="form-control">
				</td>
			</tr>
			
		</table>
		
		<%
		}catch(Exception e){
			System.out.println("업로드 오류: "+e.getMessage());
			e.printStackTrace();
		}
		
	%>
</body>
</html>