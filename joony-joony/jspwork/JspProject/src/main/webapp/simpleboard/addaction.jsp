<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="db.simpleboard.simpleBoardDto"/>
<jsp:useBean id="dao" class="db.simpleboard.simpleBoardDao"/>

<!-- dto의 멤버랑 같은 이름의 폼태그는 자동으로 읽어서 dto에 넣어준다. -->
<jsp:setProperty property="*" name="dto"/>

<%
	dao.insertBoard(dto);

	//response.sendRedirect("boardlist.jsp");
	
	//내용보기로 이동하려면?
	int num = dao.getMaxNum();//방금 insert된 num값을 알아야되기 때문에 
	response.sendRedirect("detailview.jsp?num="+num);
%>

</body>
</html>