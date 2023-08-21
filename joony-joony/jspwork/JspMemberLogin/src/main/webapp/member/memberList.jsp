<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  img{
  	border-radius: 100px;
  }
  </style>
  <script>
  
	function funcdel(num){
		//alert(num);
		//$("#btnmdel").attr("num",num);//button 속성에 num 넣어주기
		$("#myModal").modal();
		
		$("#btnmdel").click(function(){
			//var num = $(this).attr("num");
			location.href="delete.jsp?num="+num;\\
		})
	}

  </script>
</head>
<body>
<%
	String success = (String) session.getAttribute("loginSuccess");
	
	String id = (String)session.getAttribute("idok");
	String name=null;
	MemberDao dao = new MemberDao();
	name=dao.getName(id);
	Vector<MemberDto> list = dao.selectMember();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<%
	if(success==null|| success.equals("")){
		%>
			<button type="button" class="btn btn-outline-info" onclick="location.href='../login/loginForm.jsp'">로그인</button>
			
		<% 
	}else{
%>
		<b><%=name %></b>님이 로그인 중
		<button type="button" class="btn btn-outline-info" onclick="location.href='../login/logoutAction.jsp'">로그아웃</button>
<%} %>

<table class="table table-bordered">
	<tr class="table-info">
		<th>번호</th>
		<th>아이디</th>
		<th>회원명</th>
		<th>핸드폰</th>
		<th>가입일</th>
		<th>수정/삭제</th>
	</tr>
	<%
		for(int i=0; i<list.size();i++){
			MemberDto dto = list.get(i);
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=dto.getId() %></td>
				<td>
					<img src="../<%=dto.getImage() %>" width="80"><br>
					<b><%=dto.getName() %></b>
				</td>
				<td><%=dto.getHp() %></td>
				<td><%=sdf.format(dto.getGaip()) %></td>
				<td>
				
				<%
					/*로그인한 본인것만 수정/삭제 보이도록*/
					/*String loginok = (String)session.getAttribute("loginok");
					String id = (String)session.getAttribute("idok"); */
					if(success!=null && dto.getId().equals(id)){
						%>
					<input type="button" value="수정" class="btn btn-warning" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">
					<input type="button" value="삭제" class="btn btn-danger" onclick="funcdel(<%=dto.getNum()%>)">
						<%
					}else{
						%>
							<h5>권한없음</h5>
						<%
					}
				%>
				</td>
			</tr>
			<%
		}
	%>
</table>



  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원탈퇴</h4>
        </div>
        
        <div class="modal-body">
          <p>회원탈퇴를 원하시면 [탈퇴확인]을 눌러주세요.</p>
          <button type="button" class="btn btn-danger" id="btnmdel" num="">탈퇴확인</button>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>