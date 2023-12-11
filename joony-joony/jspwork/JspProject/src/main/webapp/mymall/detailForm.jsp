<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
	div{
		margin: 20px;
		text-align: center;
	}
	img{
		border-radius: 10px;
	}
</style>
</head>
<body>
<%
	String no = request.getParameter("no");
	MallDao dao = new MallDao();
	MallDto dto = dao.getdata(no);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
%>
<div>
	<img src="<%=dto.getPhoto()%>" width="500px">
<div>
<div>
	<table class="table table-bordered">
	<caption align="top"><b>상세내용</b></caption>
		<tr>
			<th>이름</th>
			<td><%=dto.getSangpum() %></td>
		</tr>
		
		<tr>
			<th>가격</th>
			<td><%=nf.format(Integer.parseInt(dto.getPrice())) %></td>
		</tr>
		
		<tr>
			<th>입고일</th>
			<td><%=dto.getIpgoday() %></td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td><%=sdf.format(dto.getWriteday()) %></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button class="btn btn-outline-info" onclick="location.href='list.jsp'">목록이동</button>
			</td>
		</tr>
	</table>
</div>
</body>
