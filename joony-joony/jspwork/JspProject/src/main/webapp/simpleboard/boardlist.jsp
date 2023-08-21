<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.eclipse.jdt.internal.compiler.util.SimpleLookupTable"%>
<%@page import="java.util.List"%>
<%@page import="db.simpleboard.simpleBoardDao"%>
<%@page import="db.simpleboard.simpleBoardDto"%>
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
	body *{
		font-family: 'Gaegu';
	}
	
	a:link, a:visited{
		text-decoration: none;
		color:black;
	}
	
	a:hover{
		text-decoration: underline;
		color: gray;
	}
</style>
</head>
<%
	simpleBoardDao dao = new simpleBoardDao();
	List<simpleBoardDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin:30px; 30px; width:800px;">
   <button type="button" class="btn btn-outline-info"
   onclick="location.href='addform.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
   
   <br>
   <h6><b>총 <%=list.size() %>개의 게시글이 있습니다.</b></h6>
   <table class="table table-bordered">
   	<caption><b>간단 게시판 목록</b></caption>
   	<tr>
   		<th width="60">번호</th>
   		<th width="360">제목</th>
   		<th width="100">작성자</th>
   		<th width="60">작성일</th>
   		<th width="60">조회</th>
   	</tr>
   	
   	<%
   		if(list.size()==0){
   			%>
   			<tr>
   				<td colspan="5" align="center">
   					<h6><b>등록된 게시글이 없습니다.</b></h6>
   				</td>
   			</tr>
   			<%
   		}else{
   			for(int i=0; i<list.size(); i++){
   				simpleBoardDto dto = list.get(i);
   				%>
   				<tr>
   					<td align="center"><%=list.size()-i %></td>
   					<td><a href="detailview.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
   					<td><%=dto.getWriter() %></td>
   					<td><%=sdf.format(dto.getWriteday()) %></td>
   					<td><%=dto.getReadcount() %></td>
   				</tr>
   				<%
   			}
   		}
   	%>
   	
   </table>
</div>
</body>
</html>