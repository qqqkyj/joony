<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
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
 a{
 	text-decoration: none;
 	color: black;
 }
 
 div.btns{
 	margin: 30px;
 }
 </style>
</head>
<body>
<%
	QuizBoardDao dao = new QuizBoardDao();
	//List<QuizBoardDto> list = dao.selectBoard();//페이징처리 없이 전체조회시
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	int totalCount=dao.getTotalCount();//전체 게시글의 수
	int totalPage;//총 페이지 수
	int startPage;//각 블럭에서 보여질 시작페이지
	int endPage;//각 블럭에서 보여질 마지막페이지
	int startNum;//db에서 가져올 글의 시작 번호(mysql은 첫 글이 0, oracle은 1)
	int perPage=3;//한 페이지당 몇 개의 글을 보여줄지
	int perBlock=5;//한 페이지에서 보여즐 블럭의 개수
	int currentPage;//현재 페이지
	int no;//각 페이지 당 출력할 시작번호

	//현재페이지 읽기(단 null일경우는 1페이지를 준다)계산을 해야하므로 int로 형변환
	if(request.getParameter("currentPage")==null)
	        	currentPage=1;
	  else
	    currentPage=Integer.parseInt(request.getParameter("currentPage"));
	     
	    //총 페이지 수 구하기
	    //총 게시글의 개수/한 페이지당 보여질 개수로 나누기
	    //나머지가 하나라도 있으면 무조건 페이지를 하나 더 추가(1+1=2페이지가 필요)
	  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	  
	    //각 블럭당 보여야할 시작페이지
	    //perBlock=5일경우는 현재페이지 1~5 시작:1, 끝:5
	    //perBlock=13일 경우는 시작:11, 끝:15
	  	startPage=(currentPage-1)/perBlock*perBlock+1;
	     
	  	endPage=startPage+perBlock-1;
	    
	     //총 페이지가 23일경우 마지막블럭은 25가 아니라 23이다.
	      if(endPage>totalPage)
	        	endPage=totalPage;
	     
	     //각 페이지에서 보여질 시작번호
	     //1페이지: 0, 2페이지:5, 3페이지:10
	     startNum=(currentPage-1)*perPage;
	     
	     //각 페이지당 출력할 시작번호 구하기 no
	     //총 글개수가 23이면 1페이지 23, 2페이지는 18, 3페이지 13
	     no=totalCount-(currentPage-1)*perPage;
	     
	     //페이지에서 보여질 글만 가져오기
	     List<QuizBoardDto> list = dao.getPagingList(startNum, perPage);

%>
<div class="btns">
	<button onclick="location.href='quizform.jsp'" class="btn btn-outline-success"><i class="bi bi-pencil"></i>글작성</button>
	<button onclick="location.href='quizimagelist.jsp'"  class="btn btn-outline-success"><i class="bi bi-list"></i>이미지목록</button>
</div>
<hr>
<h6 style="text-align: left"><b>총 <%=list.size() %>개의 게시글이 있습니다.</b></h6>
<table class="table table-bordered" style="margin: 30px; margin-right: 30px; text-align: center">
	<caption align="top" style="text-align: center"><h2>게시글 목록</h2></caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
		for(int i=0; i<list.size(); i++){
			QuizBoardDto dto = list.get(i);
			%>
			<tr>
				<td><%=no-- %></td>
				<td>
					<a href="contentview.jsp?num=<%=dto.getQ_num()%>">
						<%=dto.getTitle() %>
						<img src="<%=dto.getImgname()%>" style="width: 50px;">
					</a>
				</td>
				<td><%=dto.getWriter() %></td>
				<td><%=sdf.format(dto.getWriteday()) %></td>
				<td><%=dto.getReadcount() %></td>
			</tr>
			<%
		}
	%>
</table>

<!-- 페이지번호 출력 -->
   <div>
   	 <ul class="pagination justify-content-center">
   	 <%
   	 	//이전
   	 	if(startPage>1){
   	 		%>
   	 		<li class="page-item"><a class="page-link" href="quizlist.jsp?currentPage=<%=startPage-1%>">Previous</a></li>
   	 		<%
   	 	}
   	 	for(int pp=startPage; pp<=endPage; pp++){
   	 		if(pp==currentPage){
   	 			%>
   	 			<li class="page-item active">
   	 				<a class="page-link" href="quizlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
   	 			</li>
   	 			<%
   	 		}else{
   	 			%>
   	 			<li class="page-item">
   	 				<a class="page-link" href="quizlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
   	 			</li>
   	 			<%
   	 		}
   	 	}
   	 	
   	 	if(totalPage>endPage){
   	 	%>
   	 		<li class="page-item"><a class="page-link" href="quizlist.jsp?currentPage=<%=endPage+1%>">Next</a></li>
   	 	<%
   	 	}
   	 %>
   	 </ul>  	 
   </div>

</body>
</html>