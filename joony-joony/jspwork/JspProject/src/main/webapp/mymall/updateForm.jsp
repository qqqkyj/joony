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
</head>
<body>
<%
	String num = request.getParameter("no");
	MallDao dao = new MallDao();
	MallDto dto = dao.getdata(num);
%>
<form action="updateAction.jsp" method="post">
<input type="hidden" value="<%=dto.getNo()%>" name="no">
	<table class="table table-bordered">
	<caption align="top"><h2>상품수정</h2></caption>
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="sangpum" value="<%=dto.getSangpum() %>" required="required"></td>
		</tr>
		<tr>
			<th>사진경로</th>
			<td>
				<select name="photo">
					<option value="../image/쇼핑몰사진/20.jpg" <%=(dto.getPhoto().equals("../image/쇼핑몰사진/20.jpg")?"selected":"") %>>단화</option>
					<option value="../image/쇼핑몰사진/25.jpg" <%=(dto.getPhoto().equals("../image/쇼핑몰사진/25.jpg")?"selected":"") %>>원피스</option>
					<option value="../image/쇼핑몰사진/24.jpg" <%=(dto.getPhoto().equals("../image/쇼핑몰사진/24.jpg")?"selected":"") %>>바지</option>
					<option value="../image/쇼핑몰사진/22.jpg" <%=(dto.getPhoto().equals("../image/쇼핑몰사진/22.jpg")?"selected":"") %>>반지</option>
					<option value="../image/쇼핑몰사진/34.jpg" <%=(dto.getPhoto().equals("../image/쇼핑몰사진/34.jpg")?"selected":"") %>>반바지</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text"  name="price" value="<%=dto.getPrice() %>" required="required"></td>
		</tr>
		<tr>
			<th>입고일</th>
			<td><input type="date" name="ipgoday" value="<%=dto.getIpgoday() %>" required="required"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="상품수정">
			</td>
		</tr>
	</table>
</form>
</body>
</html>