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
  <script type="text/javascript">
  $(function() {
	$("#btnGaip").click(function(){
		if(mid.value.length==0){
			alert("아이디 입력버튼을 눌러주세요!");
			return false;//submit이 action을 안함
		}
	})
})
  </script>
</head>
<body>
	<div style="margin: 50px; 100px;">
		<form action="addProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 500px">
				<caption align="top"><b>회원가입</b></caption>
				<tr>
					<td style="background-color: #66cdaa" width="120">아이디</td>
					<td>
						<input type="text" class="form-control" name="id" id="mid" style="width: 120px"
						readonly="readonly" required="required">
						<button type="button" class="btn btn-danger btn-sm"
						onclick="openId()">아이디입력</button>
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">비밀번호</td>
					<td>
						<input type="password" name="pass" class="form-control" style="width: 120px"
						required="required">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">이름</td>
					<td>
						<input type="text" name="name" class="form-control" style="width: 120px"
						required="required">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">사진</td>
					<td>
						<input type="file" name="uploadImage" class="form-control" style="width: 250px">
					</td>
				</tr>
				
				<tr>
					<td style="background-color: #66cdaa" width="120">핸드폰</td>
					<td>
						<input type="text" name="hp" class="form-control" style="width: 200px"
						required="required">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success" id="btnGaip">회원가입</button>
						<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function openId(){
			window.open("idCheck.jsp","e","left=500px, top=100px, width=500px, height=400px");
		}
	</script>
	
</body>
</html>