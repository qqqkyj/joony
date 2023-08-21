<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.util.Vector"%>
<%@page import="model.myteam.TeamDao"%>
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
<%
	TeamDao dao = new TeamDao();
	ArrayList<TeamDto> list = dao.getAllMyTeams();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<script>
		function deleteClick(num){
			if(!(confirm("취소하시겠습니까?"))){
				location.href='list.jsp';
			}else{
				location.href='teamdelete.jsp?num='+num;
			}
	}
</script>
</head>
<body>
<a href="addForm.jsp">팀원추가</a>
<table class="table table-bordered">
	<tr align="center" class="table-warning">
		<th>번호</th>
		<th>이름</th>
		<th>운전면허</th>
		<th>주소</th>
		<th>작성일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<%
	
	for(int i=0; i<list.size(); i++){
		TeamDto dto =list.get(i);		
		%>
			<tr>
				<td><%=i+1%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getDriver()%></td>
				<td><%=dto.getAddr()%></td>
				<td><%=sdf.format(dto.getWriteday())%></td>
				<td><input type="button" class="btn btn-warning btn-sm" onclick="location.href='updateForm.jsp?num=<%=dto.getNum() %>'" value="수정"></td>
				<td><input type="button" class="btn btn-danger btn-sm" onclick="deleteClick(<%=dto.getNum() %>)" value="삭제"></td>
				
			</tr>
		<%
	}
	
%>
	
</table>

</body>
</html>