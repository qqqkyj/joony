<%@page import="member.model.MemberDao"%>
<%@page import="member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String num = request.getParameter("num");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.getData(num);
%>
	<div style="margin: 50px; 100px;">
		<form action="updateProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px">
			<input type="hidden" name="num" value="<%=num %>">
				<caption align="top"><b>개인정보수정</b></caption>
				<tr>
					<td style="background-color: #66cdaa" width="120">아이디</td>
					<td>
						<b><%=dto.getId() %></b>
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">비밀번호</td>
					<td>
						<input type="password" name="pass" class="form-control" style="width: 120px"
						required="required" value="<%=dto.getPass()%>">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">이름</td>
					<td>
						<input type="text" name="name" class="form-control" style="width: 120px"
						required="required" value="<%=dto.getName() %>">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">사진</td>
					<td>
						<input type="file" name="uploadImage" class="form-control" style="width: 250px" value="<%=dto.getImage()%>">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">핸드폰</td>
					<td>
						<input type="text" name="hp" class="form-control" style="width: 200px"
						required="required" value="<%=dto.getHp()%>">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success" id="btnGaip">회원정보수정</button>
						<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function openId(){
			window.open("idCheck.jsp","e","left=500px, top=100px, width=500px, height=400px");
		}
	</script>
	
</body>
</html>