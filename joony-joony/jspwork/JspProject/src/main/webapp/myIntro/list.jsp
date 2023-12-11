<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="model.myIntro.IntroDTO"%>
<%@page import="model.myIntro.IntroDAO"%>
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
<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
<%
	IntroDAO dao = new IntroDAO();
	Vector<IntroDTO> list = dao.selectIntro();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<input type="button" value="회원정보추가" class="btn btn-outline-info" onclick="location.href='AddForm.jsp'">
<table class="table table-bordered">
	<caption align="top"><h2>회원정보리스트</h2></caption>
	<tr class="table-warning">
		<th>번호</th>
		<th>이름</th>
		<th>혈액형</th>
		<th>핸드폰번호</th>
		<th>지역</th>
		<th>가입일</th>
		<th>수정/삭제</th>
	</tr>
	<%
		if(list.size()==0){
			%>
			<tr align="center">
				<td colspan="7"><h2>등록된 데이터가 존재하지 않습니다.</h2></td>
			<tr>
			<%
		}else{
			for(int i=0; i<list.size(); i++){
				IntroDTO dto = list.get(i);
				%>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="detailForm.jsp?num=<%=dto.getNum()%>"><%=dto.getName() %></a></td>
					<td><%=dto.getBlood() %></td>
					<td><%=dto.getHp() %></td>
					<td><%=dto.getCity() %></td>
					<td><%=sdf.format(dto.getGaipday()) %></td>
					<td>
						<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'" class="btn btn-warning">
						<input type="button" value="삭제" onclick="location.href='deleteAction.jsp?num=<%=dto.getNum()%>'" class="btn btn-danger">
					</td>
				</tr>
				<%
			}
		}
	%>
</table>
</body>
</html>