<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<script type="text/javascript">
	$(function() {
		$(".btndelete").click(function(){
			var num = $(this).attr("num");
			//alert(num);
			
			var ans = confirm("정말 탈퇴하시겠습니까?");
			
			if(ans){
				location.href="member/deleteme.jsp?num="+num;
			}
		})
	})
</script>
</head>
<body>
<div>
	<img alt="" src="../image/짱구/짱구4.PNG">
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<table	class="table table-bordered">
		<%
			for(MemberDto dto:list){
				if(dto.getId().equals(id)){
				%>
				<tr>
						<td rowspan="6" width="300px;" align="center">
								<img alt="" src="image/짱구/짱구4.PNG" width="250px;">
						</td>
						
					<tr>
						<th>이름</th>
						<td><%=dto.getName() %></td>
					</tr>				
					<tr>
						<th>아이디</th>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td><%=dto.getHp() %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=dto.getAddr() %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=dto.getEmail() %></td>
					</tr>
					</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">
						<input type="button" value="탈퇴" class="btn btn-outline-danger btndelete" num=<%=dto.getNum() %>>
					</td>
				</tr>
				<%
				}
			}
		%>
	</table>
</div>
</body>
</html>