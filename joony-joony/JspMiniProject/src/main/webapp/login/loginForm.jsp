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
	div.loginForm{
		width: 500px;
		margin-top: 100px;
		margin-left: 200px;
	}
</style>
</head>
<%
	//세션얻기
	String saveok = (String)session.getAttribute("saveok");

	String myid="";
	if(saveok!=null){
		myid=(String)session.getAttribute("myid");
	}
%>
<body>
	<div class="loginForm">
		<form action="login/loginAction.jsp" method="post">
			<input type="text" name="id" style="width: 200px"
			class="form-control" placeholder="아이디입력" required="required" value=<%=myid %>><br>
			
			<input type="password" name="pass" style="width: 200px"
			class="form-control" placeholder="비밀번호입력" required="required"><br>
			
			<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>>아이디저장<br>
			<input type="submit" value="로그인" class="btn btn-outline-success btn-lg" style="width: 200px;"><br>
			
	
		</form>
	</div>
</body>
</html>