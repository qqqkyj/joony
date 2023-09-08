<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>영화예매</title>
<style>

#mv_name{
float:left;
border:2px solid gray;
width:350px;
height:500px;
overflow: scroll;
margin-bottom:20px;
background-color:#f8f8ff ;

}
#mv_theater{

float:left;
border:2px solid gray;
width:340px;
height:500px;
margin-bottom:20px;
background-color:#f8f8ff;

}

#mv_day{

border:2px solid gray;
float:left;
width:195px;
height:500px;
margin-bottom:20px;
background-color:#f8f8ff;

}
#mv_time{
border:2px solid gray;
float:left;
width:340px;
height:500px;
margin-bottom:20px;
background-color:#f8f8ff;

}

.table{

text-align:center;
width:1225px;


}

div#select_info{

width:1225px;
height:300px;
background-color:white;
}

li{list-style: none;}

div.daycon{
   overflow: scroll;
    border:solid 1px green;
    height: 100px;
    width: 200px;
}
li.date{
margin-left:50px;
margin-top:-30px;
font-size:15pt;
text-align: justify;
cursor: pointer;
}

li.mvname{
   cursor: pointer;
}

div.poster{
 
 margin-top:20px;
 margin-left:10px;
 width:250px;
 height:250px;
}

div.mvinfo{
margin-top:20px;
width:250px;
height:100px;

}
div.clickinfo{
margin-top:20px;
margin-left:30px;
width:200px;
height:100px;
float: left;
}

.loc{cursor: pointer;}

.clickcolor{

background-color: lightgray;
font-weight: bold;

}
</style>
<%

MovieDao dao=new MovieDao();

List<MovieDto> list=dao.getAllMovieInfo();

%>
<script>
   $(function(){
      
      //버튼 숨기기
      $("#seatBtn").hide();

      $(".loc").hide();
      
      $("th.local").click(function(){
         
    	  $(this).hover();
    	  var name=$(this).attr("value");
         //alert(name);
         $(".loc").hide();
         $("."+name).show(); //클래스 호출
         
      });
      
      $(".btn").hide();
      
      $(".datelabel").click(function(){
   
         $(".btn").hide();
         
         var date=$(this).text();
         
         if(date!=null){
            $(".btn").show();
            
            return;
         }

      
      });
      
      
      //영화제목과 포스터출력
      $(".mvname").click(function(){
            
          var src =$(this).find(".agelogo").attr("src");
               
          var poster=$(this).attr("photo");
          var name=$(this).text();
          
          $(".mvname").removeClass("clickcolor");
		  $(this).addClass("clickcolor");
          
          $("#mvage").attr("src",src).css("width","40px");
          $("#poster").html(poster);
          $("#mvtitle").html(name);
      });

      //클릭한 극장명출력
      $(".loca").click(function(){
          var locname=$(this).text();
          
          $(".loca").removeClass("clickcolor");
		  $(this).addClass("clickcolor");
		  
		  
          //alert(locname);
          $("#mvcinema").html(locname);
       })

   //날짜 합치기
   var date="";
   var day="";
         
   //날짜 클릭시 시간이 뜸
   $("li.date").click(function(){
        date = $(this).val();//날짜
        day = $(this).attr("day");//요일
        
        $("li.date").removeClass("clickcolor");
		  $(this).addClass("clickcolor");
		  
        //alert(date);
        //alert(day);
        $.ajax({
           type:"get",
           dataType:"json",
           url:"Movie_reserve/time.jsp",
           success:function(res){
              //alert(res.time);
              var result="";
              var morning="";
              var after="";
              $.each(res, function(idx, item){
                 
                 var timeString=item.time;
                 var timeSplit=timeString.split(':');
                 
                 if(timeSplit[0]>=12){
                    after+="&nbsp;&nbsp;<button type='button' class='btn btn-warning time' value='"+item.time+"'>"+item.time+"</button>";
                 }else{
                    morning+="&nbsp;&nbsp;<button type='button' class='btn btn-warning time'  value='"+item.time+"'>"+item.time+"</button>";
                 }
              });
              
              
              if(morning!=""){
                 result+="<br><b>&nbsp;&nbsp;오전</b><br>"
                    result+=morning
                    result+="<hr>"
              }
              
              if(after!=""){
                 result+="&nbsp;&nbsp;<b>오후</b><br>"
                     result+=after
              }
              
              $("#mv_time").html(result); 
           }
         
           
        
        });
   });

   

   //시간 클릭할때 상영관 랜덤배정하고 시간 insert하기
   $(document).on("click",".time",function(){
      var time = $(this).val();
      var mvtitle = $("#mvtitle").text();
      var mvcinema =$("#mvcinema").text();
      
      //영화선택 없이 시간 선택시 경고창
      if(mvtitle==""){
         alert("영화를 선택해 주세요.");
      }else{
         //극장선택 없이 시간 선택시 경고창
         if(mvcinema=="극장이름"){
            alert("극장을 선택해 주세요.");
         }else{
            $.ajax({
               type:"get",
               url:"Movie_reserve/mvPlaceRandom.jsp",
               dataType:"json",
               success:function(res){
                  $("#mvdate").text("2023.9."+date+"("+day+")"+time);
                  $("#mvplace").text(res.mvplace+"관");
                  //버튼 보여주는 곳
                  $("#seatBtn").show();
               }
            });
         }
      
      }
      
   }); 
   
   
   //좌석선택버튼 클릭시 예약정보 DB에 넣고 좌석선택 페이지로 이동
   /* $(document).on("click","#seatBtn",function(){ */
      $("#seatBtn").click(function(){
         var poster = $("#poster").html();
         var mvtitle =$("#mvtitle").html();
         var mvage =$("#mvage").attr("src");
         var mvcinema =$("#mvcinema").html();
         var mvdate =$("#mvdate").html();
         var mvplace =$("#mvplace").html();
         
         //alert(poster);
         $.ajax({
            type:"post",
            url:"Movie_reserve/reserveAction.jsp",
            data:{"poster":poster,"mvtitle":mvtitle,"mvage":mvage,"mvcinema":mvcinema,"mvdate":mvdate,"mvplace":mvplace},
            dataType:"html",
            success:function(){
               //alert("success");
               url="index.jsp?main=Movie_reserve/mvSeat.jsp";
               location.href=url;
            }
         }); 
      
      });
   
   
      
   })
      
</script>

</head>
<body>
<div style="border-top: 1px solid silver; width: 100%;"></div>
<div class="container" style="height: 950px;"><br>
<table class="table table-bordered" style="width:1225px;"align="center">
   <tr>
      <th style="width:280px;background-color: #fff0f5;">영화</th>
      <th style="width:280px;background-color: #fff0f5;">극장</th>
      <th style="width:150px;background-color: #fff0f5;">날짜</th>
      <th style="width:280px;background-color: #fff0f5;">시간</th>
   </tr>
</table>

<div class="container" style="margin-left: 25px; margin-top: 25px;" >
<div id="mv_name" ><br>
<ul>

<%

for(int i=0; i<list.size();i++){
   MovieDto mv_dto=list.get(i);
   
   String mvage=mv_dto.getMv_info();
   String photo="";
   int mvageindex=mvage.indexOf("가");
   if(mvageindex!=-1){
      String mvagelogo=mvage.substring(0, mvageindex);
      if(mvagelogo.equals("15세이상관람")){
         
         photo = "15.png";
         
      }else if(mvagelogo.equals("12세이상관람")){
         
         photo = "12.png";
         
      }else if(mvagelogo.equals("19세이상관람")){
         
         photo = "19.png";
         
      }else{
         
         photo = "all.png";
         
      }
   }else{}
   %>
   
   <li class="mvname" photo="<img src='<%=mv_dto.getMv_poster()%>' style='width:200px;height:250px;'>">
   <img src="image/<%=photo %>" class="agelogo" style="width: 30px;">&nbsp;&nbsp;<%=mv_dto.getMv_title()%></li><br>
   
<%}%>
</ul>

</div>

<div id="mv_theater"style="float:left;">
<table class="table table-bordered" style="width:100px;;float: left;margin-left: 10px;margin-top: 10px;margin-right: 10px;">
<%
String [] local={"서울","경기","인천","강원","대전","대구","부산","경상","전라"};
String [] localEng={"seoul","gyeonggi","incheon","gangwon","daejeon","daegu","busan","gyeongsang","jeonla"};

for(int a=0;a<local.length;a++){%>
   <tr><th class="local" style="cursor: pointer; background-color: #f5f5f5" value="<%=localEng[a] %>"><%=local[a] %></th></tr>
 
<% }%></table><%

String[] seoul={"강남","강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학"};
String[] gyeonggi={"경기광주","고양백석","고양행신","광교","광교상현","광명역","구리","구리갈매","기흥","김포","김포운양"};
String[] incheon={"계양","부평","연수역","인천","인천가정","인천논현","인천도화","인천시민공원","인천연수","인천학익","주안역"};
String[] gangwon={"강릉","기린","원주","원통","인제","춘천"};
String[] daejeon={"논산","당진","대전","대전가오","대전탄방","대전터미널","서산","세종","아산","유성노은"};
String[] daegu={"대구","대구수성","대구스타디움","대구아카데미","대구연경","대구월성","대구죽전"};
String[] busan={"대연","동래","부산명지","서면","서면삼정타워","아시아드","울산동구","울산삼산"};
String[] gyeongsang={"거제","경산","고성","구미","김천율곡","김해","김해율하","김해장유","마산","안동","창원"};
String[] jeonla={"광양","광주금남로","광주상무","광주용봉","광주첨단","광주터미널","광주하남","나주","목포","서전주"};%>

<table class="table table-bordered seoul loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int seo=0;seo<seoul.length;seo++){%>
   <tr><td class="loca"><%=seoul[seo] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered gyeonggi loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int gye=0;gye<gyeonggi.length;gye++){%>
   <tr><td class="loca"><%=gyeonggi[gye] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered incheon loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int in=0;in<incheon.length;in++){%>
   <tr><td class="loca"><%=incheon[in] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered gangwon loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int gang=0;gang<gangwon.length;gang++){%>
   <tr><td class="loca"><%=gangwon[gang] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered daejeon loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int dae=0;dae<daejeon.length;dae++){%>
   <tr><td class="loca"><%=daejeon[dae] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered daegu loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int daeg=0;daeg<daegu.length;daeg++){%>
   <tr><td class="loca"><%=daegu[daeg] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered busan loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int bu=0;bu<busan.length;bu++){%>
   <tr><td class="loca"><%=busan[bu] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered gyeongsang loc"style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int gs=0;gs<gyeongsang.length;gs++){%>
   <tr><td class="loca"><%=gyeongsang[gs] %></td></tr>
<%}

%>
</table>
<table class="table table-bordered jeonla loc" style="width:200px;margin-left: 10px;margin-top: 10px;"><% 
for(int jeon=0;jeon<jeonla.length;jeon++){%>
   <tr><td class="loca"><%=jeonla[jeon] %></td></tr>
<%}

%>

</table>

</div>
<div id="mv_day" class="container daycon">
<ul>
   <li style="color: gray; margin-top: 10px;margin-left: 35px;"><b>2023</b></li>
   <li><b style="font-size: 40pt;text-align: center;margin-left: 35px;">9</b></li>
<%
for(int i=1;i<=30;i++){

   String dayOfweek="";
   
   switch(i%7){
   case 1:dayOfweek="금";break;
   case 2:dayOfweek="토";break;
   case 3:dayOfweek="일";break;
   case 4:dayOfweek="월";break;
   case 5:dayOfweek="화";break;
   case 6:dayOfweek="수";break;
   case 0:dayOfweek="목";break;
   
   }%>
  <br><li style="color: <%=i%7==2?"blue":i%7==3?"red":"black"%>;" ><%=dayOfweek%></li>
   <lable class="datelabel"><li style='color: <%=i%7==2?"blue":i%7==3?"red":"black"%>;' class='date' value=<%=i %> day='<%=dayOfweek %>'>
         <b ><%= i%></b></li>
      </lable>
   

<% 

}
%>
</ul>

</div>

<div id="mv_time" class="mvtime" ></div>
</div>

<div class="container">
<div id="select_info" class="container" style="clear: both;">

<div class="poster" id="poster" style="float: left;"></div>

<div class="mvinfo" style="float: left;">
영화명<b id="mvtitle" class="mvtitle"></b>
<br><br>
관람연령&nbsp;<img src="" id="mvage">
</div>


<div class="clickinfo" >
극장&nbsp;<b>'3'CINE&nbsp;</b><b id="mvcinema">극장이름</b><br><br>
일시&nbsp;&nbsp;<b id="mvdate">날짜</b><br><br>
상영관&nbsp;&nbsp;<b id="mvplace">상영관</b><br><br>
인원&nbsp;&nbsp;<b>인원</b>
</div>


<input type="button" value="좌석선택" class="btn btn-outline-success" id="seatBtn" style="float: right; width: 150px; height: 150px; margin: 20px;">
</div>
</div>
</div>
</body>
</html>