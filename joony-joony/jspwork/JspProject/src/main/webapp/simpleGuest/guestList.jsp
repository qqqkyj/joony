<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="java.util.Vector"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	div.writeday{
		float: right;
	}
</style>

<script>
	function deleteConfirm(num){
		if(!confirm("정말 삭제하시겠습니까?")){
			alert("취소를 누르셨습니다.")
		}else{
			var check = prompt("비밀번호 입력","");
			location.href="delete.jsp?num="+num+"&check="+check;
		}
	}
</script>

</head>
<%
	SimpleGuestDao dao = new SimpleGuestDao();
	Vector<SimpleGuestDto> list = dao.selectGuest();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 50px; 100px;">
<input type="button" onclick="location.href='insertForm.jsp'" class="btn btn-outline-success" value="글작성">
</div>

<%
	int num=list.size();

	for(int i=0; i<list.size(); i++){
		SimpleGuestDto dto = list.get(i);
		%>
		<table class="table table-bordered">
			<tr>
				<th>
					<div>
						<%=num %>.&nbsp;<b><%=dto.getNick() %></b><div class="writeday"><%=sdf.format(dto.getWriteday())%></div>
					</div>
				</th>
			</tr>
			
			<tr>
				<td>
					<div><img src="../image/avata/b<%=dto.getImage() %>.png" width="100px"></div>
					<div><%=dto.getStory()%></div>
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">
					<input type="button" value="삭제" class="btn btn-outline-danger" onclick="deleteConfirm(<%=dto.getNum()%>)">
				</td>
			</tr>
		</table>
		<%
		num--;
	}
%>


<%-- <!-- table형태의 출력 -->
<table class="table table-bordered">
	<tr class="table-info">
		<th>순서</th>
		<th>이미지</th>
		<th>작성자</th>
		<th>스토리</th>
		<th>작성일</th>
		<th>수정/삭제</th>
	</tr>
	
	<%
		for(int i=0; i<list.size(); i++){
			SimpleGuestDto dto = list.get(i);
			%>
				<tr>
					<td><%=i+1 %></td>
					<td><img src="../image/avata/b<%=dto.getImage() %>.png" width="100px"></td>
					<td><%=dto.getNick() %></td>
					<td><%=dto.getStory() %></td>
					<td><%=sdf.format(dto.getWriteday())%></td>
					<td>
						<input type="button" value="수정" class="btn btn-outline-warning" location.href='updateForm.jsp?num=<%=dto.getNum()%>'>
						<input type="button" value="삭제" class="btn btn-outline-danger" location.href='deleteGuest.jsp?num=<%=dto.getNum()%>'>
					</td>
				</tr>
			<%
		}
	%>
</table> --%>

</body>
</html>