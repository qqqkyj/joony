<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.simpleBoardDto"%>
<%@page import="db.simpleboard.simpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span.day{
		color: #ccc;
		font-size: 0.8pt;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	simpleBoardDao dao = new simpleBoardDao();
	simpleBoardDto dto = dao.getData(num);
	
	//조회수 증가
	dao.updateReadCount(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<div style="margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top"><b><%=dto.getSubject() %></b></caption>
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
					<%=dto.getStory().replace("\n", "<br>") %>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success" onclick="location.href='addform.jsp'"><i class="bi bi-pencil-square"></i>글쓰기</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='boardlist.jsp'"><i class="bi bi-list">목록</i></button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-card-list"></i>수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'"><i class="bi bi-trash">삭제</i></button>
				</td>
			</tr>
			
	</table>
</div>
</body>
</html>