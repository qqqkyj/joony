<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
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
</head>
<body>
<%
   String id = request.getParameter("email");//네이버의 메일주소를 3cine의 아이디로 사용
   String email = request.getParameter("email");
   String name = request.getParameter("name");
   String gender = request.getParameter("gender");
   
   System.out.println(email+","+name+","+gender);
   
   MemberDao dao = new MemberDao();
   
   if(dao.naverGetId(id)){
      //로그인 성공
      System.out.print("로그인 성공");
      session.setMaxInactiveInterval(60*60*3); //3시간
      session.setAttribute("loginok", "yes");
      session.setAttribute("myid", id);
      
      %>
      <!-- //로그인메인으로 이동 -->
      <!-- <script>
      window.opener.location.href = "../index.jsp";
      window.close();      
      </script> -->
      <%
      /* response.sendRedirect("../index.jsp"); */
      
      
      
   }else{
      //없는 회원이면 멤버추가 후 로그인
      MemberDto dto = new MemberDto();
      dto.setMem_id(email);
      dto.setMem_email(email);
      dto.setMem_name(name);
      dto.setMem_gender(gender);

      dao.naverInsert(dto);
      //로그인 성공
      System.out.print("디비 insert 성공");
      
      session.setMaxInactiveInterval(60*60*3); //3시간
      session.setAttribute("loginok", "yes");
      session.setAttribute("myid", id);
      
      /*
      //로그인메인으로 이동
      response.sendRedirect("../index.jsp"); */
   }
   
%>
</body>
</html>