<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap{
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-70%);
	}
</style>
</head>
<body>
<%
	//num
	String num = request.getParameter("num");
%>
<div id="wrap">
	<form action="updatepassaction.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<div class="input-group">
			<h4>비밀번호</h4>
			<input type="password" class="form-control" required="required" name="pass" style="width: 150px;">
		</div>
		<br>
		<button type="submit" class="btn btn-info">수정시 필요한 비밀번호 확인</button>
	</form>
</div>
</body>
</html>