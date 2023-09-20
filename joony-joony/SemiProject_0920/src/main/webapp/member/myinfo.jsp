<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String num=request.getParameter("num");
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<%
   for(MemberDto dto:list)
   {
 
   %>
 
      <table class="table table-bordered" style="width: 700px; margin: 50px 150px; border: 1px solid black;">
      <caption align="top">회원정보</caption>
      
      <tr>
         <td style="width: 100px;">아이디</td>
         <td style="width: 150px;"><%=dto.getMem_id() %></td>
      </tr>
      <tr>
         <td style="width: 100px;">이름</td>
         <td style="width: 150px;"><%=dto.getMem_name() %></td>      
      </tr>
      <tr>
         <td style="width: 100px;">성별</td>
         <td style="width: 150px;"><%=dto.getMem_gender() %></td>
      </tr>
      <tr>
         <td style="width: 100px;">생년월일</td>
         <td style="width: 150px;"><%=dto.getMem_birth()%></td>
      </tr>
      <tr>
         <td style="width: 100px;">전화번호</td>
         <td style="width: 150px;"><%=dto.getMem_ph()%></td>
      </tr>
      <tr>
         <td style="width: 100px;">이메일</td>
         <td style="width: 150px;"><%=dto.getMem_email()%></td>
      </tr>
      <tr>
         <td style="width: 100px;">가입일</td>
         <td style="width: 150px;"><%=sdf.format(dto.getMem_regdate())%></td>
      </tr>
      <tr>
         <td style="width: 100px;">주소</td>
         <td style="width: 150px;"><%=dto.getMem_addr()%></td>
      </tr>
      <tr>
         <td colspan="2">
         <button type="button" class="btn btn-outline-success btn-sm"
         onclick="location.href='updateform.jsp?num=<%=dto.getMem_no()%>'">수정</button>
         <button type="button" class="btn btn-outline-danger btn-sm"
         onclick="location.href='memberdelete.jsp?num=<%=dto.getMem_no()%>'">삭제</button>
         </td>
      </tr>
      </table>
      
   <%}


%>
</body>
</html>