<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
 String irum=request.getParameter("irum");
 String size=request.getParameter("size");
 String [] col=request.getParameterValues("color");
 String [] plus=request.getParameterValues("plus");

%>

<table class="table table-bordered" style="width:500px;">
	<tr>
		<th>상품명: </th>
		<td><%=irum %></td>
	</tr>
	<tr>
		<th>사이즈: </th> 
		<td><%=size %></td>
	</tr>
	<tr>
		<th>색상 선택: </th>
		<td>
		<% if(col==null)
		{%>
			색상을 선택하지 않을 시 랜덤으로 발송됩니다.
		<%}else
		{
			for(int i=0;i<col.length;i++)
			{ %>
				<%=col[i] %>
				<div style="background-color: <%=col[i] %>; 
				border-radius: 100px; width:50px; height:50px"></div>
			<%}
			
		}%>
		</td>
	</tr>
	<tr>
		<th>추가 상품:</th>
		<td>
		<%if(plus==null)
			{%>
				추가로 선택하신 상품이 없습니다.
			<%}else
			{
				for(int i=0;i<plus.length;i++)
				{%>
					[<%=plus[i] %>]&nbsp;
				<%}
			}%>
			
		</td>
	</tr>
</table>

</body>
</html>