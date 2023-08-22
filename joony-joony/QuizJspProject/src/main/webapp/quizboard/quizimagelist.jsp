<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
   <style type="text/css">
 a{
 	text-decoration: none;
 	color: black;
 }

  div.btns{
 	margin: 30px;
 }
 </style>
</head>
<body>
<%
	QuizBoardDao dao = new QuizBoardDao();
	List<QuizBoardDto> list = dao.selectBoard();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<div class="btns">
	<button onclick="location.href='quizform.jsp'" class="btn btn-outline-success"><i class="bi bi-pencil"></i>글작성</button>
	<button onclick="location.href='quizlist.jsp'"  class="btn btn-outline-success"><i class="bi bi-list"></i>목록</button>
</div>
<h2>전체글 보기</h2>
<%=list.size() %>개의 글
<hr>
<table class="table table-bordered">
	<tr>
	<%
	int imgNum=0;
		for(int i=0; i<list.size(); i++){
			QuizBoardDto dto = list.get(i);
			
				if(!dto.getImgname().equals("../image/noImg.PNG")){//db에서 null일 경우 제외 후 출력
						imgNum++;
					%>
						<td>
							<a href="contentview.jsp?num=<%=dto.getQ_num()%>">
							<img src="<%=dto.getImgname()%>" width="150px"><br>
							작성자:<%=dto.getWriter() %><br>
							제목:<%=dto.getTitle() %><br>
							작성일:<%=sdf.format(dto.getWriteday()) %>
							</a>
						</td>
						<%
						if(imgNum%5==0){
							%>
							</tr>
							<tr>
							<%
						}
						
				}
					
		}
	%>
	</tr>
</table>
</body>
</html>