<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.smartDto"%>
<%@page import="data.dao.smartDao"%>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
 <style type="text/css">
 span.day{
 	color: gray; font-size: 0.8em;
 }
 span.aday{
 	color: gray; font-size: 0.8em; float: right;
 }
 img{
 max-width: 300px;
 }
 div.alist{
 	margin-left: 20px;
 }
 i.adel{
 	margin-left: 10px; color: gray;
 }
 </style>
 <script type="text/javascript">
 $(function(){
	
	 //시작할때
	 list();
	 
	 //댓글부분 ajax insert
	 var num = $("#num").val();
	 //alert(num);
	 
	 $("#btnadd").click(function(){
		
		 var nickname = $("#nickname").val().trim();
		 var content = $("#content").val().trim();
		 
		 if(nickname.trim().length==0){
			 swal("No!!", "닉네임을 작성해 주세요.","error");
			 return;
		 }
		 
		 if(content.trim().length==0){
			 swal("No!!", "댓글을 작성해 주세요.","error");
			 return;
		 }
		 
		 $.ajax({
			 type:"get",//multipart는 무조건 post, get방식은 한글깨짐 없음
			 url:"board/insertAnswer.jsp",
			 dataType:"html",
			 data:{"num":num,"nickname":nickname,"content":content},
			 success:function(){
				 //기존입력값 지우기
				 $("#nickname").val("");
				 $("#content").val("");
				 //리스트
				 list();
			 },
			 statusCode:{
				 404:function(){
					 alert("json파일을 찾을 수 없습니다.");
				 },
				 500:function(){
					 alert("서버오류... 코드를 확인해 주세요.");
				 }
			 }
		 
		 
		 });
		 
	});
	 
	 //delete
	 $(document).on("click","i.adel",function(){
		 var idx = $(this).attr("idx");
		 //alert(idx);
		 
		 $.ajax({
			 type:"get",
			 url:"board/deleteAnswer.jsp",
			 dataType:"html",
			 data:{"idx":idx},
			 success:function(){
				 list();
			 }
		 })
		 
	 })
	 
	 
});
 
 function list(){
	//console.log("list num="+$("#num").val());
	var num=$("#num").val();
	//alert(num);
	
	$.ajax({
		type:"get",
		url:"board/listAnswer.jsp",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			
			//댓글개수출력
			$("b.acount>span").text(res.length);
			
			//출력
			var s="";
			$.each(res,function(idx,item){
				s+="<div>"+item.nickname+":"+item.content;
				s+="<span class='aday'>"+item.writeday+"</span>";
				s+="<i class='bi bi-trash adel' idx='"+item.idx+"' style='cursor: pointer;'></i>";
				s+="</div>";
			});
			
			$("div.alist").html(s);
		}
	});
}
 </script>
</head>
<body>
<%
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	smartDao dao = new smartDao();
	smartDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<div style=" margin: 30px 30px; width: 500px;">
<input type="hidden" id="num" value="<%=num%>">
	<table class="table table-bordered">
		<caption align="top">
			<b><h2><%=dto.getSubject() %></h2></b>
		</caption>
		<tr>
			<td>
				<b>작성자: <%=dto.getWriter() %></b><br>
				<span class="day"><%=sdf.format(dto.getWriteday()) %>
				&nbsp;&nbsp; 조회:<%=dto.getReadcount() %></span>
			</td>
		</tr>
		<tr height="50">
			<td>
				<%=dto.getContent() %>
			</td>
		</tr>
		
		<!-- 댓글 -->
		<tr>
			<td>
				<b class="acount">댓글<span>0</span></b>
				<div class="alist"> 
					댓글목록
				</div>
				<div class="aform input-group">
					<input type="text" id="nickname" class="form-control" style="width: 130px;'" placeholder="input nickname">
					<input type="text" id="content" class="form-control" style="width: 300px;" placeholder="input message">
					<button id="btnadd" type="button" class="form-control">저장</button>
				</div>
			</td>
		</tr>
		
		
		<tr align="center">
		      <td>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num%>'+'&currentPage=<%=currentPage%>'">수정</button>
		         <button type="button" class="btn btn-outline-success"
		         onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
		      </td>
      	</tr>
	</table>
</div>

<script type="text/javascript">
	function funcdel(num,currentPage) {
		//alert(num+","+currentPage);
		var a = confirm("삭제하려면 [확인]을 눌러주세요.");
		if(a){
			location.href="board/deleteAction.jsp?num="+num+"&currentPage="+currentPage;
		}
	}
</script>
</body>
</html>