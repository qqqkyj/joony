<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
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
<%--<%
	request.setCharacterEncoding("utf-8");

	String nick = request.getParameter("nick");
	String pass = request.getParameter("pass");
	String img = request.getParameter("img");
	String story= request.getParameter("story");
	
	SimpleGuestDto dto = new SimpleGuestDto();
	dto.setNick(nick);
	dto.setPass(pass);
	dto.setImage(img);
	dto.setStory(story);
	
	SimpleGuestDao dao = new SimpleGuestDao();
	dao.insertGuest(dto);
	
	response.sendRedirect("guestList.jsp");
	
  %>--%>
  
  <%
  	request.setCharacterEncoding("utf-8");
  %>
  <!--자바빈스로 변경하려면? 
  useBean은 new로 객체를 생성하는 것과  같다. -->
  <jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>
  <jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>
  <!-- 위에서 만든 id="dto"를 밑에서 name="dto"로 호출할 수 있고 property="*"은 dto의 멤버들을 알아서 set해줌
  		multi는 request로 각각 받아와서 사용해야 됨, 삼항연산자-->
  <jsp:setProperty property="*" name="dto"/>
  
  <%
  	//db에 insert
  	dao.insertGuest(dto);
  %>
  
  
  <%
  	//목록으로 이동
  	response.sendRedirect("guestList.jsp");
  %>
  
  
  
  
  
</body>
</html>