<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>detail</title>
<style>
/* 스타일은 위에서 내려오는 순으로 적음 추가시 같은 위치쪽 삽입 */

b{
   color: white; <!-- b태그 글씨 색깔 -->
}

/* 디테일 큰 div */
.detailblock{
   width: 100%;
   height: 2035px;
   border: 10px solid white;
}

/* 디테일 내부 라인 div */
.detailall{
   position: absolute;
   right: 13.2%;
   left: 13.2%;
   width: 73.6%;
   height: 1950px;
   border: 10px solid white;
   margin-top: 50px;
}

/* 영화 포스터 div */
.detailposter{
   position: relative;
   left: 270px;
   width: 300px;
   height: 400px;
}

.detailposter img{
   width: 290px;
   height: 400px;
}

/* 영화 이름 div */
.detailtitle{
   position:absolute;
   top: 0px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
   font-size: 1.5em;
}

/* 영화 예매율 div border-bottom: 1px white; 추가 */
.detailreserve{
   color: white;
   position:absolute;
   top: 50px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
}

/* 장르, 개봉 div */
.detailinfo{
   color: white;
   position: absolute;
   top: 100px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
}

/* 스토리 */
.detailstory{
   color: white;
   position: absolute;
   top: 500px;
   left: 270px;
   width: 830px;
   height: 500px;
   border: 2px solid white;
}

/* 예매하기 버튼 */
#detailbtn1{
   position: absolute;
   top: 355px;
   left: 600px;
   color: white;
   background-color: #DF3E49;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}
/* 이전으로 버튼 */
#detailbtn2{
   position: absolute;
   top: 355px;
   left: 710px;
   color: black;;
   background-color: white;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}

.detailcomment{
   position: absolute;
   top: 1100px;
   left: 270px;
   
}

.detailresult{
   position: absolute;
   top: 1400px;
   left: 170px;
   width: 1030px;
   height: 500px;
   border: 2px solid white;
   
 
   
}
i.penguin{
font-size: 23pt;
}
#writer{
color: magenta;
font-size: 18pt;
}

</style>
<script>
$(document).ready(function() {
     // 페이지 로드가 완료된 후에 이 코드 블록이 실행됩니다.
      var currentPage = 1; // 현재 페이지를 1로 초기화
     // 페이지번호 리스트 이벤트
     $('.detailresult').on('click', '.paging', function(){
       currentPage = $(this).text().trim();
       list(currentPage);
     });

     // next 이벤트
     $('.detailresult').on('click', '.next', function(){
       currentPage = parseInt($('.paging').last().text().trim()) + 1;
       list(currentPage);
     });

     // pre 이벤트
     $('.detailresult').on('click', '.prev', function(){
       currentPage = parseInt($('.paging').first().text().trim()) - 1;
       list(currentPage);
     });
   });

</script>
</head>

<%
//절대경로잡기
String root = request.getContextPath();


// 쿼리 파라미터에서 포스터 ID를 가져옵니다.
/* String mv_no = request.getParameter("mv_no"); */
String mv_title = request.getParameter("mv_title");
String mv_poster = request.getParameter("mv_poster");
String mv_st = request.getParameter("mv_st");
String mv_genre = request.getParameter("mv_genre");
String mv_opendate = request.getParameter("mv_opendate");


//answer 테이블 
String idx = request.getParameter("idx"); //시퀀스
/* String num = request.getParameter("mv_no");  */// num
String num="14";
String content = request.getParameter("content");//댓글 내용
String star = request.getParameter("star"); //별점
String writeday = request.getParameter("writeday"); //작성일 가져옴
String myid = (String)session.getAttribute("myid");

//무비테이블
MovieDao dao = new MovieDao();
MovieDto dto = dao.getData(num); //영화번호 가져온다

//멤버테이블
MemberDao mdao = new MemberDao();
MemberDto mdto = mdao.getData(num); //mem_id 가져오기

//각 방명록에 달린 댓글 목록 가져오기
AnswerDao adao = new AnswerDao();

//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
String loginok=(String)session.getAttribute("loginok");
   
   
int totalCount=adao.getTotalCount(); //전체갯수
int totalPage; //총 페이지수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지
int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
int perPage=3; //한 페이지당 보여질 글의갯수
int perBlock=5; //한 페이지당 보여질 페이지 갯수
int currentPage; //현재 페이지
int no; //각페이지당 출력할 시작번호
int startNum; //각페이지에서 보여질 시작번호

//현재페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환해줌
if(request.getParameter("currentPage")==null || request.getParameter("currentPage").equals("null"))
   currentPage=1;

else
    currentPage=Integer.parseInt(request.getParameter("currentPage"));

   //총 페이지수 구하기
   //총 글의갯수/한페이지당 보여질 개수로 나눔(7/5=1)
   //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지)
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
   
   //각 블럭당 보여야할 시작페이지
   //perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
   //현재페이지 13 시작:11 끝:15
startPage=(currentPage-1)/perBlock*perBlock+1; // (12/5)*5 +1=11

endPage=startPage+perBlock-1;

   //총페이지가 23일경우 마지막블럭은 25가아니라 23이다
   if(endPage>totalPage)
   endPage=totalPage;

//각페이지에서 보여질 시작번호
//1페이지: 0, 2페이지 :5, 3페이지 :10...
startNum=(currentPage-1)*perPage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23이면 1페이지 23, 2 페이지 18, 3페이지 13......
//no=totalCount-(currentPage-1)*perPage;
no=totalCount-startNum;

//각페이지 필요한 게시글 가져오기
List<AnswerDto>list=adao.getList(num, startNum, perPage); 

%>
<body>
<!-- 큰 div 영역 -->
<div class="detailblock">
   <!-- 출력할 컨텐츠 영역 -->
   <div class="detailall">
      <div class="detailposter"><b><img src="<%=dto.getMv_poster()%>"></b></div>
      <div class="detailtitle"><b>영화제목 : <%=dto.getMv_title() %></b></div>
      <div class="detailreserve">예매율 (border-bottom 1px white 추가)</div>
      <div class="detailinfo">장르 : <%=dto.getMv_genre() %><br>개봉 : <%=dto.getMv_opendate() %></div>
      <div class="detailstory"><%=dto.getMv_st() %></div>
      <button type="button" id="detailbtn1" onclick="location='<%=root%>/index.jsp?main=Movie_reserve/movielist.jsp'">예매하기</button>
      <button type="button" id="detailbtn2" onclick="back()">이전으로</button>
      
   
      <!-- 댓글 입력 -->
      <div class="detailcomment">   
      <form>
      <input type="hidden" id="idx" value="<%=idx%>">
      <input type="hidden" id="mv_no" value="<%=num %>"> 
         <table class="table table-bordered" style="width:600px; height: 250px;">
         <caption align="top"><b>댓글 입력</b></caption>
            <tr>
               <th align="center" valign="middle" style="width: 150px;">작성자</th>
               <td>
               <%=myid %>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle" style="width: 100px;">댓글작성</th>
               <td>
               <textarea style="width: 290px; height: 80px;"
                  id="content" class="form-control"></textarea>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle" style="width: 100px;">별점</th>
               <td>
               <select name="star" id="star" style="width:100px;">
                  <option value="1">★</option>
                  <option value="2">★★</option>
                  <option value="3">★★★</option>
                  <option value="4">★★★★</option>
                  <option value="5" selected>★★★★★</option>
               </select>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle">댓글등록</th>
               <td colspan="2">
                  <button type="button" class="btn btn-outline-danger" id="btntest"><i class="bi bi-tencent-qq penguin"></i></button>
               </td>
            </tr>
         </table>
      </form>
      </div>
      <div class="detailresult"><b>댓글출력</b></div>
         <table class="table table-bordered" style="width:1000px;">
         <caption align="top"></caption>
         </table>
   </div>
</div>
<script type="text/javascript">

   /* 이전 화면으로 돌아가는 이벤트*/
   function back() {
      history.back();
   };
   
   list();
   
   //insert
      $("#btntest").click(function(){
         
         var content=$("#content").val();
         var star=$("#star").val(); 
         
         $.ajax({
            url: "answer/addanswer.jsp",
            type: "post",
            dataType:"html",
            data:{"content":content,"star":star,"num":<%=num%>},
         success:function(res){
            
            $("#content").val("");
            $("#star").val("");
         }
         
         });
   });
      
      //list
      function list(){
      
         var num=$("#num").val();
         
      $.ajax({
         
         
         type:"get",
         url:"answer/listBoard.jsp",
         data:{"num":<%=num%>},
         dataType:"json",
         success:function(data){
            
            
            //제목출력
            var s="<table class='table table-bordered' style='width:700px'>";
               s+="<caption align='top'><b>댓글목록</b></caption>";
               s+="<tr class='table-info'>";
                  s+="<th width='60'>번호</th>";
                  s+="<th width='100'>아이디</th>";
                  s+="<th width='60'>내용</th>";
                  s+="<th width='100'>별점</th>";
                  s+="<th width='160'>작성일</th>";
                  s+="</tr>";

                  if(data.length==0){
                  s+="<tr>";
                  s+="<td colspan='4' align='center'>";
                  s+="<b>댓글이 없습니다</b>";
                  s+="</td></tr>";
                  }else{
                     //데이터가 1개 이상인경우
                     $.each(data,function(i,item){
                        s+="<tr>";
                        s+="<td align='center'>"+(i+1)+"</td>"; //번호
                        s+="<td>"+item.myid+"</td> "; //아이디
                        s+="<td>"+item.content+"</td>"; //내용
                        s+="<td>"+item.star+"</td>"; //평점
                        s+="<td>"+item.writeday+"</td>"; //작성일 
                        s+="</tr>";
                        s+="<div style='width: 600px; text-align: center;'>";
                        s+="<ul class='pagination justify-content-center'>";
                      <%
                        
                         //이전
                         if(startPage>=1 && currentPage > 1)
                         {%>   
                         s+="<li class='page-item active'>";
                        s+="<a class='page-link'><i class='bi bi-arrow-left prev'></i></a>";
                        s+="</li>";
                         <%}
                         
                         for(int pp=startPage;pp<=endPage;pp++)
                         {
                            
                            if(pp==currentPage)
                            {%>
                            
                         s+="<li class='page-item active'>";
                        s+="<a class='page-link paging' ><%=pp %></a>";
                        s+="</li>";
                               
                            <%}else
                            {%>
                         s+="<li class='page-item'>";
                         s+="<a class='page-link paging' ><%=pp %></a>";
                        s+="</li>";
                            <%}
                         }
                         
                         //다음
                         if(endPage<=totalPage && currentPage<totalPage)
                         {%>
                         s+="<li class='page-item active'>";
                        s+="<a class='page-link' ><i class='bi bi-arrow-right next'></i></a>"
                        s+="</li>";
                         <%}
                      %>
                     
                        
                     })
                     
                  }
                 s+="</ul>";
                s+="</div>";
               s+="</table>";
               $(".detailresult").html(s);
               
               
         }
      })
   }
</script>
<div>

</div>
</body>
</html>