<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
  
 <script type="text/javascript">
 	function delFunc(num) {
		if(!confirm("정말 삭제하시겠습니까?")){
			alert("취소하셨습니다.");
		}else{
			location.href="member/memberDelete.jsp?num="+num;
			alert("삭제되었습니다.");
		}
	}
 </script>
</head>
<body>
<%
	MemberDao dao = new MemberDao();
	List<MemberDto> list = dao.getAllMembers();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<table class="table table-bordered">
	<tr align="center">
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>핸드폰</th>
		<th>주소</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>수정/삭제</th>
	</tr>
	
	<%
		for(int i=0; i<list.size(); i++){
			MemberDto dto = list.get(i);
			%>
			<tr align="center">
				<td><%=i+1%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getHp()%></td>
				<td><%=dto.getAddr()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=sdf.format(dto.getGaipday())%></td>
				<td>
					<input type="button" value="강퇴" class="btn btn-outline-danger" onclick="delFunc(<%=dto.getNum()%>)">
				</td>
			</tr>
			<%
		}
	%>
</table>
	
</body>
</html>