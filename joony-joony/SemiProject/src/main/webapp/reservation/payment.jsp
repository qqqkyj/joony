<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ReservationDao"%>
<%@page import="Dto.ReservationDto"%>
<%@page import="Dto.SeatDto"%>
<%@page import="Dao.SeatDao"%>
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
<%
	//로그인한 id를 가져옴
	/* String id = (String)session.getAttribute("myid"); */	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	int seat_no = Integer.parseInt(request.getParameter("seat_no"));

	SeatDao sdao = new SeatDao();
	SeatDto sdto = sdao.getData(seat_no);
	
	ReservationDao rdao = new ReservationDao();
	ReservationDto rdto = rdao.getData(Integer.parseInt(sdto.getRev_no()));
	
	String id = rdto.getMem_id();
	
%>
<body>

<form>
<table class="table table-bordered" style="text-align: center; vertical-align: center" >
	<caption align="top"><b>결제정보</b></caption>
	<tr>
		<th>주문자</th>
		<td colspan="5"><b><%=rdto.getMem_id() %></b></td>
	</tr>
	<tr class="table table-warning">
		<th>영화</th>
		<th>극장명</th>
		<th>상영관</th>
		<th>날짜</th>
		<th>좌석</th>
		<th>인원</th>
		<th>총가격</th>
	</tr>
	<tr>
		<td>
		<img src="../upload/Oppenheimer.jpg" style="width: 100px;">
			<%-- <%=rdto.getRev_poster() %> --%>
			<%=rdto.getRev_title() %>
		</td>
		<td><%=rdto.getRev_name() %></td>
		<td><%=rdto.getRev_place() %></td>
		<td><%=rdto.getRev_date() %></td>
		<td><%=sdto.getSeat_name() %></td>
		<td>
			<%=sdto.getAdultCnt()!=0?"성인:"+sdto.getAdultCnt()+"명<br>":"" %>
			<%=sdto.getTeenCnt()!=0?"청소년:"+sdto.getTeenCnt()+"명<br>":"" %>
			<%=sdto.getChildCnt()!=0?"아동:"+sdto.getChildCnt()+"명<br>":"" %>
		</td>
		<td><%=nf.format(sdto.getTotalPrice()) %></td>
	</tr>
</table>
</form>

</body>
</html>