<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//front에서 보낸 데이터 읽기
	String photoNo = request.getParameter("photoNo");
	String foodName = request.getParameter("foodName");
	String like1 = request.getParameter("like1");
	String like2 = request.getParameter("like2");
	String like3 = request.getParameter("like3");

//총점==>String을 int로 변환
//평균
	int s1 = Integer.parseInt(like1);
	int s2 = Integer.parseInt(like2);
	int s3 = Integer.parseInt(like3);
	double avg = (s1+s2+s3)/3.0;


//front형태로 만들어서 다시 front로 보내기(Json)
//ob.put("","..//food/"+1+".jpg")
	JSONObject obj = new JSONObject();
	obj.put("src","../image/Food/"+photoNo+".jpg");
	obj.put("foodName",foodName);
	obj.put("avg",avg);
	obj.put("like1",like1);
	obj.put("like2",like2);
	obj.put("like3",like3);
%>

<%=obj.toString()%>