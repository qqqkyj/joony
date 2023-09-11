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
<!-- iamport.payment.js -->
<script
  type="text/javascript"
  src="https://cdn.iamport.kr/js/iamport.payment-1.4.0.js"
></script>

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

<script type="text/javascript">
$(function(){
	
	//번호입력시 focus이동
	$("#cardNum1").on("keyup", function(){
		if ($(this).val().length == 4) {
			$("#cardNum2").focus();
		}
	});
	
	$("#cardNum2").on("keyup", function(){
		if ($(this).val().length == 4) {
			$("#cardNum3").focus();
		}
	});
	
	$("#cardNum3").on("keyup", function(){
		if ($(this).val().length == 4) {
			$("#cardNum4").focus();
		}
	});
	
	$("#cardNum4").on("keyup", function(){
		if ($(this).val().length == 4) {
			$("#expM").focus();
		}
	});
	
	$("#expM").on("keyup", function(){
		if ($(this).val().length == 2) {
			$("#expY").focus();
		}
	});
	
	$("#expY").on("keyup", function(){
		if ($(this).val().length == 2) {
			$("#cardPw").focus();
		}
	});
	
	$("#cardPw").on("keyup", function(){
		if ($(this).val().length == 2) {
			$("#birth").focus();
		}
	});
	
	
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	
});

</script>

</head>

<body>


<table class="table table-bordered" style= vertical-align: middle;" >
	<caption align="top"><b>결제정보</b></caption>
	<tr>
		<th>주문자</th>
		<td colspan="6"><b><%=rdto.getMem_id() %></b></td>
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
		<img src="upload/Oppenheimer2.jpg" style="width: 100px;">
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
	<tr>
		<td colspan="7">
			<b>최종결제 수단</b>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			<input type="radio" value="신용카드" name="payment" checked><b>신용카드</b>
			<input type="radio" value="카카오페이" name="payment"><b>카카오페이</b>
			<input type="radio" value="실시간 계좌이체" name="payment"><b>실시간 계좌이체</b>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			카드종류&nbsp;&nbsp;
			<select name="card">
				<option value="">BC카드</option>
				<option value="">현대카드</option>
				<option value="">KB국민카드</option>
				<option value="">삼성카드</option>
				<option value="">신한카드</option>
				<option value="">하나카드</option>
				<option value="">우리카드</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			카드번호&nbsp;&nbsp;
			<input type="text" name="cardNum1" id="cardNum1" maxlength="4" style="width: 120px;">
			-
			<input type="password" name="cardNum2" id="cardNum2" maxlength="4" style="width: 120px;">
			-
			<input type="password" name="cardNum3" id="cardNum3" maxlength="4" style="width: 120px;">
			-
			<input type="text" name="cardNum4" id="cardNum4" maxlength="4" style="width: 120px;">
		</td>
	</tr>
	<tr>
		<td colspan="7">
			유효기간&nbsp;&nbsp;
			<input type="text" name="expM" id="expM" maxlength="2" style="width: 60px;">월
			<input type="text" name="expY" id="expY" maxlength="2" style="width: 60px;">년
			&nbsp;&nbsp;&nbsp;<small style="color: gray">예)2020년 9월 -> 09월 15년</small>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			비밀번호&nbsp;&nbsp;
			<input type="text" name="cardPw" id="cardPw" maxlength="2" style="width: 60px;"> <b style="font-size: 1.7em;">**</b>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			법정생년월일(6자리)&nbsp;&nbsp;
			<input type="password" name="birth" id="birth" maxlength="6" style="width: 180px;">
			-
			<b style="font-size: 1.7em;">*******</b>
		</td>
	</tr>
	<tr>
		<td colspan="7">
			<input type="button" value="결제하기" class="btn btn-outline-success" id="payKakao" data-bs-toggle="tooltip">
		</td>
	</tr>
</table>



<script type="text/javascript">
//카카오페이 결제
IMP.init('imp10502566');

$("#payKakao").click(function(){
	alert("test");
	IMP.request_pay({
		pg:'kakaopay',
		pay_method:'card',
		merchant_uid : '3cine(1)',
		name:'<%=rdto.getRev_title() %>',
		amount:14000
	},function(imp){
		console.log(imp);
		
		/* if(imp.success){
			var msg="결제가 완료되었습니다.";
			msg+="\n결제금액 : "+rsp.paid_amount+"원";
			
			location.href="index.jsp?main=Movie_payment/paySuccess.jsp?msg="+msg;
		}
		else{
			var msg = "결제에 실패하였습니다.";
			msg+=rsp.error_msg;
			
			//실패시 reload
			location.reload();
		}
		alert(msg); */
	
	});
});

</script>
</body>
</html>