<%@page import="Dao.MovieDao"%>
<%@page import="Dao.ReservationDao"%>
<%@page import="Dto.ReservationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("myid");	
	
	String[] mv_titles = request.getParameter("mvtitle").split(";");
	String mvtitle = mv_titles[2];
	MovieDao mdao = new MovieDao();
	
	String mv_no = String.valueOf(mdao.getMvNum(mvtitle));
	String poster = request.getParameter("poster");
	String mvage = request.getParameter("mvage");
	String mvcinema = request.getParameter("mvcinema");//극장명
	String mvdate = request.getParameter("mvdate");
	String mvplace = request.getParameter("mvplace");//상영관
	
	//System.out.println(mvtitle);
	
	ReservationDto dto = new ReservationDto();
	dto.setMem_id(id);
	dto.setMv_no(mv_no);
	dto.setRev_poster(poster);
	dto.setRev_title(request.getParameter("mvtitle"));
	dto.setRev_age(mvage);
	dto.setRev_name(mvcinema);
	dto.setRev_date(mvdate);
	dto.setRev_place(mvplace);
	
	ReservationDao dao = new ReservationDao();
	dao.insertReservation(dto);
%>
