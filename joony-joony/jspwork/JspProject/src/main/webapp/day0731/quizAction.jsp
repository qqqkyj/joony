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
String sang=request.getParameter("sang");
String size=request.getParameter("size");
String [] col=request.getParameterValues("color");
String [] sang2=request.getParameterValues("plussang");


%>

상품명:<%=sang %><br>
사이즈:<%=size %><br>


	<%
	if(col==null)
	{%>
		 <b>선택 색상 없음</b>
	<%}else
	{%> 선택색상 :<br>
	<%
		for(int i=0;i<col.length;i++)
	{%> <b><%=col[i]%>&nbsp;</b>
   	<div style="background-color: <%=col[i]%>; width:50px; height:50px; border-radius:100px;"></div>
		
	<%}
	
	}

	if(sang2==null)
	{%>
		<b>선택 상품 없음</b>
	<%}else
	{%>	추가 상품:
		<%for(int i=0;i<sang2.length;i++)
		{%>
			[<%=sang2[i] %>]
		<%}%>
		
	<%}%>
	
	
</body>
</html>