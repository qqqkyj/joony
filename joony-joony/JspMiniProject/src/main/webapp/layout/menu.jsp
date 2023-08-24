<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//절대경로잡기
	String root = request.getContextPath();
%>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
 <link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=root %>/menu/css/menu.css">   
<script type="text/javascript" src="<%=root %>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root %>/menu/js/function.js"></script>
</head>

<body>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="http://www.freshdesignweb.com"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="#">Home</a></li>
					<li class="parent">
						<a href="#">about 회원</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=login/loginForm.jsp"><i class="icon-wrench"></i> 로그인</a></li>
							<li><a href="<%=root%>/index.jsp?main=member/memberform.jsp"><i class="icon-credit-card"></i>  회원가입</a></li>
							<%
								String loginok = (String)session.getAttribute("loginok");
								String myid = (String)session.getAttribute("myid");
								
								MemberDao dao = new MemberDao();
								String num = dao.IdNum(myid);
								
								if(loginok!=null){
									if(myid.equals("admin")){
										%>
										<li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i class="icon-gift"></i> 회원목록</a></li>
										<%
									}else{
										%>
										<li><a href="<%=root%>/index.jsp?main=member/myinfo.jsp?num=<%=num%>"><i class="icon-gift"></i> 나의정보</a></li>
										<%
									}
								}
							
							%>
						</ul>
					</li>
					<li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a></li>
					<li class="parent">
						<a href="#">고객의 소리</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=board/boardlist.jsp">회원게시판</a></li>
							<li><a href="#">스마트 게시판</a></li>
						</ul>
					</li>
					<li><a href=href="#">찾아오시는길</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>   
<%-- <a href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">Shop</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>
</body>
</html>