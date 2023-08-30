<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.smartDto"%>
<%@page import="data.dao.smartDao"%>
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
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	smartDao dao = new smartDao();
	smartDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<div style=" margin: 30px 30px; width: 500px;">
	<table class="table table-bordered">
		<caption align="top">
			<b><h2><%=dto.getSubject() %></h2></b>
		</caption>
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %>
				&nbsp;&nbsp; 조회:<%=dto.getReadcount() %></span>
			</td>
		</tr>
		<tr height="50">
			<td>
				<%=dto.getContent() %>
			</td>
		</tr>
		<tr align="center">
		      <td>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num%>'+'&currentPage=<%=currentPage%>'">수정</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
		      </td>
      	</tr>
	</table>
</div>

<script type="text/javascript">
	function funcdel(num,currentPage) {
		//alert(num+","+currentPage);
		var a = confirm("삭제하려면 [확인]을 눌러주세요.");
		if(a){
			location.href="board/deleteAction.jsp?num="+num+"&currentPage="+currentPage;
		}
	}
</script>
</body>
</html>