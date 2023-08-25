<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.GuestDao"%>
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
	span.day{
		float: right;
		font-size: 11pt;
		color: gray;
	}
</style>
</head>
<body>
<%	

	//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
	String loginok = (String)session.getAttribute("loginok");

	if(loginok!=null){
		%>
		<jsp:include page="addForm.jsp"/>
		<hr align="left" width="700;">
		<%
	}
	
	//페이징처리
	GuestDao dao = new GuestDao();
	//List<simpleBoardDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	int totalCount=dao.getTotalCount();//전체 게시글의 수
	int totalPage;//총 페이지 수
	int startPage;//각 블럭에서 보여질 시작페이지
	int endPage;//각 블럭에서 보여질 마지막페이지
	int startNum;//db에서 가져올 글의 시작 번호(mysql은 첫 글이 0, oracle은 1)
	int perPage=3;//한 페이지당 몇 개의 글을 보여줄지
	int perBlock=5;//한 페이지에서 보여즐 블럭의 개수
	int currentPage;//현재 페이지

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
	     
	     //각 페이지 필요한 게시글 가져오기
	     List<GuestDto> list = dao.getList(startNum, perPage);
	     
	     //마지막 페이지 남은 한개글 지우면 빈페이지만 남는다. (해결책)이전페이지로 간다.
	     if(list.size()==0){
	    	 %>
	    	 <script type="text/javascript">
	    	 	location.href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage-1%>";
	    	 </script>
	    	 <%
	     }
%>

<div>
	<b>총 <%=totalCount %>개의 방명록 글이 있습니다.</b>
	
	<%
		MemberDao mdao = new MemberDao();
		for(GuestDto dto:list){
			//이름얻기
			String name = mdao.getName(dto.getMyid());
			%>
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td>
						<b><i class="bi bi-person"></i>&nbsp;<%=name %>(<%=dto.getMyid() %>)</b>
						<%
							//로그인한 아이디
							String myid = (String)session.getAttribute("myid");
							
							//로그인한 아이디와 글쓴아이디가 같은 경우에만 수정/삭제
							if(loginok!=null && dto.getMyid().equals(myid)){
								%>
								 <a href="index.jsp?main=guest/updateForm.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>" style="color: black; text-decoration: none;"><i class="bi bi-pencil-square"></i></a>
								 <a href="guest/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage%>" style="color: black; text-decoration: none;"><i class="bi bi-trash"></i></a>
								<%
							}
						%>
						<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					</td>
				</tr>
				
				<tr height="120">
					<td>
						<!-- 이미지가 null이 아닌 경우만 출력 -->
						<%
							if(dto.getPhotoname()!=null){
								%>
								<a href="save/<%=dto.getPhotoname()%>" target="blank">
								<img src="save/<%=dto.getPhotoname()%>" align="left"
								style="width: 100px;" hspace="20px;"></a>
								<%
							}
						%>
						
						<%=dto.getContent().replace("\n", "<br>") %>
					</td>
				</tr>
				
				<!-- 댓글,추천 -->
				<tr>
					<td>
						<span class="answer" style="cursor: pointer;" num=<%=dto.getNum() %>>댓글0</span>
						<span class="likes" style="margin-left: 20px; cursor: pointer;" num=<%=dto.getNum() %>>추천</span>
						<span class="chu"><%=dto.getChu() %></span>
					</td>
				</tr>
			</table>
			<%
		}
	%>
	
	<!-- 페이지번호 출력 -->

   <div align="center">
      <ul class="pagination justify-content-center">
        <%
        //이전
        if(startPage>1){
           %>
                <li>
                    <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
                 </li>
          
        <%}
           for(int pp=startPage;pp<=endPage;pp++){
              if(pp==currentPage){
                 %>
                 <li class="page-item active">
                    <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
                 </li>
                 
              <%}else
              {%>
                 <li>
                    <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
                 </li>
              <%}
           }
           //다음
           if(endPage<totalPage){%>
              <li>
               <a class="page-link" href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
            </li>
           <%}
           
           %>
             
      </ul>
   </div>
   
</div>
</body>
</html>