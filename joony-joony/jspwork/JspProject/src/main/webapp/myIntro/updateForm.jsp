<%@page import="java.util.StringTokenizer"%>
<%@page import="model.myIntro.IntroDAO"%>
<%@page import="model.myIntro.IntroDTO"%>
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
<script type="text/javascript">
	function moveCursor(textbox){
		if(textbox.value.length==4){
			$("#hp3").focus();
		}
	}
</script>
</head>
<body>
<%
	String num = request.getParameter("num");
	IntroDAO dao = new IntroDAO();
	IntroDTO dto = dao.getData(num);
	StringTokenizer st = new StringTokenizer(dto.getHp(),"-");
	String hp1 = st.nextToken();
	String hp2 = st.nextToken();
	String hp3 = st.nextToken();
%>
<form action="updateAction.jsp" method="post">
<input type="hidden" value="<%=num%>" name="num">
	<table class="table table-bordered">
	<caption align="top"><b>개인정보저장</b></caption>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=dto.getName() %>" required="required"></td>
		</tr>
		
		<tr>
			<th>혈액형</th>
			<td>
			<select name="blood">
				<option value="A" <%=dto.getBlood().equals("A")?"selected":"" %>>A</option>
				<option value="B" <%=dto.getBlood().equals("B")?"selected":"" %>>B</option>
				<option value="AB" <%=dto.getBlood().equals("AB")?"selected":"" %>>AB</option>
				<option value="O" <%=dto.getBlood().equals("O")?"selected":"" %>>O</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<th>핸드폰번호</th>
			<td>
				<select name="hp1">
					<option value="010" <%=hp1.equals("010")?"selected":"" %>>010</option>
					<option value="011" <%=hp1.equals("011")?"selected":"" %>>011</option>
					<option value="017" <%=hp1.equals("017")?"selected":"" %>>017</option>
					<option value="019" <%=hp1.equals("019")?"selected":"" %>>019</option>
				</select>
				
				<b>-</b>
				<input type="text" name="hp2" value="<%=hp2 %>" maxlength="4" id="hp2" onkeyup="moveCursor(this)" required="required">
				
				<b>-</b>
				<input type="text" name="hp3" value="<%=hp3 %>" maxlength="4" id="hp3" required="required">
			</td>
		</tr>
		
		<tr>
			<th>지역</th>
			<td>
				<input type="radio" value="서울" name="city" <%=dto.getCity().equals("서울")?"checked":"" %>>서울
				<input type="radio" value="경기" name="city" <%=dto.getCity().equals("경기")?"checked":"" %>>경기
				<input type="radio" value="인천" name="city" <%=dto.getCity().equals("인천")?"checked":"" %>>인천
				<input type="radio" value="부산" name="city" <%=dto.getCity().equals("부산")?"checked":"" %>>부산
				<input type="radio" value="제주" name="city" <%=dto.getCity().equals("제주")?"checked":"" %>>제주
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="정보수정" class="btn btn-outline-success">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>