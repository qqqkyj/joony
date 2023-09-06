<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idxs = request.getParameter("idxs");
	
	//,로 분리
	String[] idx = idxs.split(",");
	
	//배열의 길이만큼 삭제하고 장바구니목록으로 이동
	ShopDao dao = new ShopDao();
	
	for(int i=0; i<idx.length; i++){
		dao.deleteCart(idx[i]);
	}
	
	response.sendRedirect("../index.jsp?main=shop/mycart.jsp");
	
%>