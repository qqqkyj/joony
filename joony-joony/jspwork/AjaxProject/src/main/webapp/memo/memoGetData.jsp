<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	MemoDao dao = new MemoDao();
	MemoDto dto = dao.getData(num);
	
	JSONObject ob = new JSONObject();
	ob.put("num",dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("story",dto.getStory());
	ob.put("avata",dto.getAvata());
	ob.put("writeday",sdf.format(dto.getWriteday()));
%>
<%=ob.toString()%>