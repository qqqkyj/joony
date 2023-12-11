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
	div.loginForm{
		width: 500px;
		margin-top: 100px;
		margin-left: 200px;
	}
</style>
</head>
<body>
<%
	//세션으로 부터 아이디와 세이브체크값 얻기
	String myid = (String)session.getAttribute("idok");
	String saveid = (String)session.getAttribute("saveok");
	
	boolean save = true;
	
	if(saveid==null){
		myid="";//아이디저장을 체크하지 않을 경우 아이디 없애기
		save=false;//체크하지 않을 경우 false, 그외는 초기값이 true니까 true
	}
%>
	<div class="loginForm">
		<form action="loginAction.jsp" method="post">
			<input type="text" name="id" style="width: 200px"
			class="form-control" placeholder="아이디입력" required="required"
			value=<%=myid %>><br>
			
			<input type="password" name="pass" style="width: 200px"
			class="form-control" placeholder="비밀번호입력" required="required"><br>
			
			<input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디저장<br>
			<input type="submit" value="로그인" class="btn btn-outline-success btn-lg" style="width: 200px;"><br>
			
	
		</form>
	</div>
</body>
</html>