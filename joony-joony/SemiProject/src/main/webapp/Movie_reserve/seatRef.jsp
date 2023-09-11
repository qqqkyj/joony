<%@page import="java.util.ArrayList"%>
<%@page import="Dto.SeatDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.SeatDao"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@page import="Dto.ReservationDto"%>
<%@page import="Dao.ReservationDao"%>
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
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  /* background-color: #242333; */
  display: flex;
  flex-direction: column;
  color: gray;
  align-items: center;
  justify-content: center;
  /* height: 100vh; */
  /* font-family: 'Lato', 'sans-serif'; */
}

.movie-container{
   margin: 20px 0; 
   display: flex;
   justify-content: center;
   color: white;
}

.movie-container select {
   margin-right: 20px;
  /* background-color: #fff; */
  border: 1;
  border-radius: 5px;
  font-size: 14px;
  margin-left: 10px;
  padding: 5px 15px 5px 15px;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
}

.refSeat{
   background-color: orange;
   border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    height: 30px;
    width: 30px;
}

.selSeat{
   background-color: red;
   border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    height: 30px;
    width: 30px;
}

.seat.selected {
  background-color: red;
}

.seat.occupied {
   width:30px;
   height:30px;
   border-top-left-radius: 10px;
  border-top-right-radius: 10px; 
  background-color: white;
  
}

.seat:nth-of-type(2) {
  margin-right: 18px;
}

.seat:nth-last-of-type(2) {
  margin-left: 18px;
}

.seat:not(.occupied):hover {
  cursor: pointer;
  transform: scale(1.2);
}

.showcase {
  
  border-radius: 5px;
  color: white;
  list-style-type: none;
  display: flex;

}

.showcase li {
  align-items: center;
  justify-content: center;
  margin: 0 10px;
}

.showcase li small {
  margin-left: 10px;
}

.screen {
  background-color: white;
  height: 70px;
  width: 100%;
  margin: 15px 0;
  transform: rotateX(-45deg);
  box-shadow: 0 5px 5px gray;
}

.container {
  perspective: 1000px;
  margin-bottom: 30px;
}

.seat {
  background-color: orange;
  height: 30px;
  margin: 3px;
  color: white;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  display: flex;
  justify-content: center;
}

.row {/* 좌석 가운데 정렬*/
  display: flex;
  justify-content: center;
}

/*영화정보css*/
#select_info{

position:absolute;
border:2px solid gray;
top:750px;
left:200px;
width:1200px;
height:300px;
}

div.poster{
 
 width:200px;
 height:250px;
 position:absolute;
 top:25px;
 left:25px;
}

div.mvinfo{
position:absolute;
top:25px;
left:250px;
width:250px;
height:100px;

}

div.clickinfo{
position:absolute;
top:25px;
left:570px;
width:200px;
height:100px;

}

ul li{
   list-style-type: none;
}

</style>
<%
   ReservationDao dao = new ReservationDao();
   //가장최신에 예약중인 예약페이지의 좌석을 선택하기 위해
   int num = dao.maxNum();
   //System.out.println(num);
   ReservationDto dto = dao.getData(num);
   
   //System.out.println(dto.getMv_no());
   MovieDao mdao = new MovieDao();
   MovieDto mdto = mdao.getPrice(dto.getMv_no());
   int adultPrice = mdto.getMv_adult();
   int teenPrice = mdto.getMv_teen();
   int childPrice = mdto.getMv_child();
   
   //System.out.println(adultPrice+","+ teenPrice+","+ childPrice);
   
   //사전에 예매된 좌석들을 가져오기
   SeatDao sdao = new SeatDao();
   List<SeatDto> list = sdao.getSeats();
   
   String occupiedSeats="";
   
   for(int i=0; i<list.size(); i++){
      occupiedSeats+=list.get(i).getSeat_name()+",";
   }
   
   String[] seats = occupiedSeats.split(",");
   
%>
<script type="text/javascript">
$(function(){
   
   //사전에 예매된 좌석들에 occupied 클래스 적용
   <%
      for(int i=0; i<seats.length; i++){
         %>
         var seat = $("#<%=seats[i]%>");
         if(seat){
            seat.addClass("occupied");
         }
         <%
      }
   %>
   
   
   
   var adult=0;
   var teen=0;
   var child=0;
   var adultPrice=<%=adultPrice%>;
   var teenPrice=<%=teenPrice%>;
   var childPrice=<%=childPrice%>;
   var totalPrice=0;
   var total=0;//총 선택한 좌석개수
   var arr=[];
   //alert(arr.length);
   
   
   //선택한 성인인원 값 가져오기
   document.getElementById("adult").onchange=function(){
      
      if(adult!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(adult);
         }
      }
      
      //total-=adult;
      adult=parseInt($(this).val());
      total+=adult;
      $("#adultCnt").text(adult);
      
      totalPrice+=adult*adultPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }

   //선택한 청소년인원 값 가져오기
   document.getElementById("teen").onchange=function(){
      
      if(teen!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(teen);
         }
      }
      
      //total-=teen;
      teen=parseInt($(this).val());
      total+=teen;
      $("#teenCnt").text(teen);
      
      totalPrice+=teen*teenPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }
   
   //선택한 아동인원 값 가져오기
   document.getElementById("child").onchange=function(){
      
      if(child!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(child);
         }
      }
      
      //total-=child;
      child=parseInt($(this).val());
      total+=child;
      $("#childCnt").text(child);
      
      totalPrice+=child*childPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }
   
   
   $("div.seat").click(function(){
      var bc = $(this).attr("class");
      var seatName = $(this).text();
      
      if(total==0){
         alert("좌석을 선택해 주세요.");
         return;
      }
      
      //총 인원보다 많은 좌석을 선택했을 때
      if(total==arr.length){
         alert("이미 좌석을 모두 선택하셨습니다.");
         var a = confirm("좌석을 다시 선택하시겠습니까?");
         if(a){
            location.reload();
         }
      }else{
         $(this).toggleClass("selected");
         
         //선택한 좌석수 보다 많은 좌석을 선택시 경고창
         if(bc=="seat"){
            arr.push(seatName);
            //alert(arr);
         }else{
            //seatName에 해당하는 index값을 찾음
            const idx = arr.indexOf(seatName);
            //index번째에서 1개를 삭제
            arr.splice(idx, 1);
            /* arr.pop(seatName); */
            //alert(arr);
         }
         
         //선택한 좌석을 정렬
         $("#selectedSeat").text(arr.sort());
      }
            
   });
   
   
   //좌석선택버튼 클릭시
   $("#seatBtn").click(function(){
      var adultCnt = $("#adultCnt").text();
      var teenCnt = $("#teenCnt").text();
      var childCnt = $("#childCnt").text();
      var totalPrice = $("#totalPrice").text();
      var selectedSeat = $("#selectedSeat").text();
      var rev_no = <%=dto.getRev_no()%>;
      
      $.ajax({
         type:"post",
         url:"seatInsert.jsp",
         data:{"adultCnt":adultCnt,"teenCnt":teenCnt,"childCnt":childCnt,"totalPrice":totalPrice,"selectedSeat":selectedSeat,"rev_no":rev_no},
         dataType:"json",
         success:function(res){
            alert("insert success");
            location.href="payment.jsp?seat_no="+res.seat_no;
         }
      });
      
   });
   
   
});

</script>
</head>
<body>
<br><hr style="color: white;"><br>
<div class="movie-container">
      <label>성인:</label>
      <select id="adult">
         <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
      <label>청소년:</label>
      <select id="teen">
         <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
       <label>아동:</label>
      <select id="child">
         <option value="0">0</option>
       <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    </div>
    
    <div class="container" style="width: 300px;height: 50px;">
    <ul class="showcase" >
      <li>
        <div class="refSeat" style="margin-top: 10px;margin-bottom: 3px;margin-left: 7px;"></div>
        <small >N/A</small>
      </li>

      <li>
        <div class="selSeat" style="margin-top: 10px;margin-left: 30px;margin-bottom: 3px;"></div>
        <small>&nbsp;&nbsp;Selected</small>
      </li>

      <li>
        <div class="seat occupied" style="margin-top: 10px;margin-left: 22px;margin-right: 200px;"></div>
        <small>Occupied</small>
      </li>
    </ul>
    </div>
    
   <div class="container">
    <div class="screen"></div>
    <%
       for(int i=65; i<75; i++){%>
       <div class="row">
       <%
          for(int j=1; j<9; j++){%>
             <div class="seat" id="<%=(char)i %><%=j %>" style="width: 30px;"><b><%=(char)i %><%=j %></b></div>
          <%}
       %>
       </div>
       <%}
    %>
   </div>


<div id="select_info">

<div class="poster" id="poster"><%=dto.getRev_poster() %></div>

<div class="mvinfo">
<span>영화명<b id="mvtitle" class="mvtitle"><%=dto.getRev_title() %></b></span>
<br><br>
<span>관람연령</span>&nbsp;<img src="<%=dto.getRev_age() %>" id="mvage">
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>


<div class="clickinfo">
<table>
   <tr>
      <td>극장</td>
      <td><b id="mvcinema"><%=dto.getRev_name() %></b></td>
   </tr>
   <tr>
      <td>일시</td>
      <td><b id="mvdate"><%=dto.getRev_date() %></b></td>
   </tr>
   <tr>
      <td>상영관</td>
      <td><b id="mvplace"><%=dto.getRev_place() %></b></td>
   </tr>
   <tr>
      <td >인원</td>
      <td>
         <b>성인</b><b id="adultCnt"></b><br>
         <b>청소년</b><b id="teenCnt"></b><br>
         <b>아동</b><b id="childCnt"></b><br>
      </td>
   </tr>
   <tr>
      <td>좌석</td>
      <td><b><span id="selectedSeat"></span></b></td>
   </tr>
   <tr>
      <td>가격</td>
      <td><b id="totalPrice">0</b>원</td>
   </tr>
</table>
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>

<input type="button" value="결제하기" class="btn btn-outline-danger" id="seatBtn" style="float: right; width: 150px; height: 150px; margin: 20px;">
</div>

</body>
</html>