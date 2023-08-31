<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.smartDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.smartDto"%>
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
 <style type="text/css">
	a:link, a:visited{
		text-decoration: none;
		color: black;
	}
	a:hover{
		text-decoration: underline;
	}
</style>
<script type="text/javascript">
$(function() {
	//전체선택클릭시 체크값 얻어서 모든 체크값 전달하기
	$(".alldelcheck").click(function() {
		//전체 체크값 얻기
		var chk =$(this).is(":checked");
		console.log(chk);
		
		//전체체크값을 글 앞의 체크에 일괄 전달하기
		$(".delcheck").prop("checked",chk);
	})
	
	$("#btndel").click(function(){
		//체크된 길이
		var len=$(".delcheck:checked").length;
		
		//alert(len);
		
		if(len==0){
			alert("삭제할 항목을 체크해 주세요!");
		}else{
			var a = confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요.");
			
			if(a){
				
				//체크된 곳의 value값 얻기(num)
				var n="";
				$(".delcheck:checked").each(function(idx){
					n+=$(this).val()+",";
				});
				
				//마지막 ,(컴마) 제거
				n=n.substring(0,n.length-1);
				
				console.log(n);
				
				//삭제파일로 전송
				location.href="board/alldelete.jsp?nums="+n;
			}
			
			
		}
		
	})
})
</script>
</head>
<body>

<%
smartDao dao=new smartDao();

int totalCount=dao.getTotalCount(); //전체 갯수
int totalPage; //총 페이지 수
int startPage; //각 블럭에서 보여질 시작 페이지
int endPage; //각 블럭에서 보여질 끝 페이지
int startNum; //db에서 가져올 글의 시작 번호 (mysql은 첫글이 0, oracle은 첫글이 1)
int perPage=3; //한 페이지당 보여질 글의 갯수
int perBlock=5; //한 블럭당 보여질 페이지 갯수
int currentPage; //현재 페이지
int no=0; //각 페이지당 출력할 시작 번호

//현재 페이지 읽기(단 null일 경우는 1페이지로 준다) 
if(request.getParameter("currentPage")==null || request.getParameter("currentPage").equals("null"))
         currentPage=1;
else
         currentPage=Integer.parseInt(request.getParameter("currentPage")); //파라미터로 받을 땐 무조건 문자열이라 parsing / 계산을 해야하므로 int로 형변환해줌
   
  //총 페이지수 구하기
  //총 글의 갯수/한 페이지당 보여질 갯수로 나눔(7/5=1)
  //나머지가 1이라도 있으면 무조건 +1페이지(1+1=2페이지가 필요)
   totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

  //각 블럭당 보여야 할 시작페이지
  //perBlock=5일 경우는 현재페이지 1~5 시작:1 끝:5
  //현재페이지 13 시작:11 끝:15
   startPage=(currentPage-1)/perBlock*perBlock+1;
   
   endPage=startPage+perBlock-1;
  
   //총 페이지가 23일 경우 마지막 블럭은 25가 아니라 23이다
    if(endPage>totalPage)
         endPage=totalPage;
   
   //각 페이지에서 보여질 시작 번호
   //1페이지: 0, 2페이지:5, 3페이지:10...
   startNum=(currentPage-1)*perPage;
   
   //각페이지당 출력할 시작번호 구하기no
   no=totalCount-startNum;
   
   
   //각 페이지 필요한 게시글 가져오기  
   List<smartDto> list=dao.getPagingList(startNum, perPage);
   
   
	//댓글 dao
   SmartAnswerDao adao=new SmartAnswerDao();
   for(smartDto dto:list){
      
      //댓글 변수에 댓글 총 갯수 넣기
      int acount=adao.getAllAnswers(dto.getNum()).size();
      dto.setAnswercount(acount);
	   
	   
   }
   

%>
<body>
   <div style="margin:30px 30px;width:800px;">
      <h5><b>총<%=totalCount %>개의 게시글이 있습니다.</b></h5>
         <table class="table table-bordered">
            <caption aling="top"><b>스마트 게시판 목록</b></caption>
               <tr class="table-light">
                  <th width="60">번호</th>
                  <th width="450">제목</th>
                  <th width="130">작성자</th>
                  <th width="60">작성일</th>
                  <th width="60">조회</th>
               </tr>
               <%
               if(totalCount==0){%>
                  <tr>
                     <td colspan="5" align="center">
                     <h6>등록된 게시글이 없습니다.</h6>
                     </td>
                  </tr>
                  
               <%}else{
                  SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
                  for(smartDto dto: list){%>
                     
                     <tr>
                     	<td align="center">
                     		<input type="checkbox" value="<%=dto.getNum()%>" class="delcheck">
                     		&nbsp;
                     		<%=no-- %>
                     	</td>
                     	<td>
                     		<a href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"><%=dto.getSubject() %></a>
                     		 
                     		 <!-- 댓글 갯수 출력 -->
                           <%
                           if(dto.getAnswercount()>0){%>
                           <a href="index.jsp?main=board/contentView.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"
                           style="color: red;">[<%=dto.getAnswercount() %>]</a>   
                           <%}
                           
                           %>
                           
                     	</td>
                     	<td><%=dto.getWriter() %></td>
                     	<td align="center"><%=sdf.format(dto.getWriteday()) %></td>
                     	<td align="center"><%=dto.getReadcount() %></td>
                     </tr>
                     
                  <%}
                  
               }
               %>
               <tr>
               		<td colspan="5">
               			<input type="checkbox" class="alldelcheck">전체선택
               			<span style="float: right;">
               				<button type="button" class="btn btn-outline-danger" id="btndel">삭제</button>
               				   	  <button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>               				
               			</span>
               		</td>
               </tr>
         </table>
         
     <!-- 페이지번호 출력 -->

   <div align="center">
      <ul class="pagination justify-content-center">
        <%
        //이전
        if(startPage>1){
           %>
                <li>
                    <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
                 </li>
          
        <%}
           for(int pp=startPage;pp<=endPage;pp++){
              if(pp==currentPage){
                 %>
                 <li class="page-item active">
                    <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
                 </li>
                 
              <%}else
              {%>
                 <li>
                    <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
                 </li>
              <%}
           }
           //다음
           if(endPage<totalPage){%>
              <li>
               <a class="page-link" href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
            </li>
           <%}
           
           %>
             
      </ul>
   </div>
   
   
   </div>
</body>
</html>