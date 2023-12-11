<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
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
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("num");
	QuizBoardDao dao = new QuizBoardDao();
	QuizBoardDto dto = dao.getBoard(num);
	
	dao.updateReadCount(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><b><%=dto.getTitle()%></b></caption>
			<tr>
				<td>
					<b>작성자: <%=dto.getWriter() %></b><br>
					<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					&nbsp;&nbsp;&nbsp;조회:<%=dto.getReadcount() %>
				</td>
			</tr>
			
			<tr height="150">
				<td>
				<!-- pre태그안에 쓰거나 replace()이용한다:db저장시 br태그가 \n으로 저장된다.
					그러므로 출력시 다시 br로 변환 -->
					<%=dto.getContent().replace("\n", "<br>") %>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success" onclick="location.href='quizform.jsp'"><i class="bi bi-pencil-square"></i>글쓰기</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='quizlist.jsp'"><i class="bi bi-list">목록</i></button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='quizupdateform.jsp?num=<%=dto.getQ_num()%>'"><i class="bi bi-card-list"></i>수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='quizdeleteform.jsp?num=<%=dto.getQ_num()%>'"><i class="bi bi-trash">삭제</i></button>
				</td>
			</tr>
			
	</table>
</div>

</body>
</html>