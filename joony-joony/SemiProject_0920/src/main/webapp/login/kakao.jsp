<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String kakao_id=request.getParameter("id");
String kakao_nickname=request.getParameter("nickname");
String kakao_birth=request.getParameter("birth");
String kakao_email=request.getParameter("email");
String kakao_gender=request.getParameter("gender");

MemberDto dto=new MemberDto();
dto.setMem_id(kakao_id);
dto.setMem_name(kakao_nickname);
dto.setMem_email(kakao_email);
dto.setMem_gender(kakao_gender);

MemberDao dao=new MemberDao();
dao.insertMember(dto);

boolean y=dao.isIdCheck(kakao_id);

if(y){
	
		session.setMaxInactiveInterval(60*60*3); //3시간
	   session.setAttribute("loginok", "yes");
	   session.setAttribute("myid", kakao_id);
	   
}

System.out.println(y);
%>

