<%@page import="db.memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	
	MemoDao dao = new MemoDao();
	
	dao.deleteMemo(num);
	
%>