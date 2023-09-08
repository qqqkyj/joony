<%@page import="Dao.SeatDao"%>
<%@page import="Dto.SeatDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   
   String rev_no=request.getParameter("rev_no");
   int adultCnt = request.getParameter("adultCnt").equals("")?0:Integer.parseInt(request.getParameter("adultCnt"));
   int teenCnt = request.getParameter("teenCnt").equals("")?0:Integer.parseInt(request.getParameter("teenCnt"));
   int childCnt = request.getParameter("childCnt").equals("")?0:Integer.parseInt(request.getParameter("childCnt"));
   String seats = request.getParameter("selectedSeat");
   int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
   
   SeatDto dto = new SeatDto();
   dto.setRev_no(rev_no);
   dto.setAdultCnt(adultCnt);
   dto.setTeenCnt(teenCnt);
   dto.setChildCnt(childCnt);
   dto.setSeat_name(seats);
   dto.setTotalPrice(totalPrice);
   
   SeatDao dao = new SeatDao();
   dao.insertSeat(dto);
   
%>