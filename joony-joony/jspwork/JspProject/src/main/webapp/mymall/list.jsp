<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="java.util.Vector"%>
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
<%

	MallDao dao = new MallDao();
	Vector<MallDto> list = dao.selectMall();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
%>
<style type="text/css">
	img{
		width:100px;
		height:100px;
		border-radius: 10px
	}
</style>
</head>
<body>
<button type="button" onclick="location.href='addForm.jsp'" class="btn btn-info">데이터추가</button>
	<table class="table table-bordered">
	<caption align="top"><h2>상품목록</h2></caption>
		<tr>
			<th>번호</th>
			<th>상품이름</th>
			<th>사진</th>
			<th>가격</th>
			<th>입고일</th>
			<th>작성일</th>
			<th>수정/삭제</th>
		</tr>
		
		<%
		if(list.size()==0){
			%>
			<tr>
				<td colspan="6" align="center" valign="middle">
					<h5>등록된 상품이 없습니다.</h5>
				</td>
			</tr>
			<%
		}else{
		
			for(int i=0; i<list.size(); i++){
				MallDto dto = list.get(i);
				%>
				<tr>
					<td align="center"><%=i+1 %></td>
					<td align="center" valign="middle"><%=dto.getSangpum() %></td>
					<td align="center" valign="middle"><img src="<%=dto.getPhoto()%>" onclick="location.href='detailForm.jsp?no=<%=dto.getNo()%>'"></td>
					<td align="center" valign="middle"><%=nf.format(Integer.parseInt(dto.getPrice()))%></td>
					<td align="center" valign="middle"><%=dto.getIpgoday() %></td>
					<td align="center" valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
					<td align="center" valign="middle">
						<input type="button" value="수정" class="btn btn-warning" onclick="location.href='updateForm.jsp?no=<%=dto.getNo()%>'">
						<input type="button" value="삭제" class="btn btn-danger" onclick="location.href='deleteMall.jsp?no=<%=dto.getNo()%>'">
					</td>
				</tr>
				<%
			}
		}
		%>
	</table>
</body>
</html>