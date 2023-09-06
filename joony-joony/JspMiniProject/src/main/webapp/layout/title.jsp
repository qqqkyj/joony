<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
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
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	div.cart{
		float: right;
		cursor: pointer;
	}
	.count{
		width: 30px;
		height: 30px;
		float: right;
		background-color: red;
		border-radius: 100px;
		text-align: center;
		line-height:30px;
		z-index: 10;
		position: relative;
		left: -25px;
		top: 15px;
		color: white;
	}
</style>
<script>
$(function(){
   
   $("div.cart").click(function(){
   
      location.href="index.jsp?main=shop/mycart.jsp";
      
   });
   
});

</script>
</head>
<body>
<%
	//절대경로잡기
	String root = request.getContextPath();
	//로그인세션
	String loginok = (String)session.getAttribute("loginok");
	//아이디얻기
	String myid = (String)session.getAttribute("myid");
	//dao에서 이름얻기
	MemberDao dao = new MemberDao();
	String name = dao.getName(myid);
%>
</body>
<a href="<%=root%>" style="color: black; text-decoration: none;">
JSP & JQuery Mini Project</a>
<div style="float: right; margin-right: 50px;">
<%
	if(loginok==null){
		%>
		<input type="button" value="로그인" class="btn btn-outline-success" onclick="location.href='<%=root%>/index.jsp?main=login/loginForm.jsp'">
		<%
	}else{
		%>
		<span style="font-size: 0.7em;"><%=name %>님</span>&nbsp;
		<input type="button" value="로그아웃" class="btn btn-outline-danger" onclick="location.href='login/logoutAction.jsp'">
		
		<div class="cart">
			<%
				ShopDao sdao = new ShopDao();
				//카트개수
				int cartSize = sdao.getCartList(myid).size();
			%>
			
			<i class="bi bi-cart4 carticon" style="font-size: 1.2em;"></i>
			<div class="count"><%=cartSize %></div>
		</div>

		<%
	}
%>

</div>
</html>