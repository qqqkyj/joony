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
 	$(function() {
		//id중복체크
		$("#btncheck").click(function(){
			//id읽기
			var id = $("#id").val();
			//alert(id);
			$.ajax({
				type:"get",
				url:"member/idsearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(data){
					
					if(data.count==1){
						//alert("이미 가입된 아이디 입니다.");
						$("span.idsuccess").text("fail").css("color","red");
						$("#id").val("");
						$("#id").focus();
					}else{
						//alert("사용가능한 아이디 입니다.");
						$("span.idsuccess").text("success").css("color","green");
					}
				}
			})
		})
		
		//이메일
		$("#selemail").change(function(){
			var email2 = $(this).val();
			
			if(email2=="-"){
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(email2);
			}
        });
		
		
	})
	
	function check(f) {
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.pass.value="";
			f.pass2.value="";
			
			return false;//action이 호출되지 않음
		}
	}
	
 </script>
</head>
<body>
<form action="member/memberproc.jsp" method="post" onsubmit="return check(this)">
	<table class="table table-bordered" style="width: 500px;">
		<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th style="width: 100px; background-color: #aaa">아이디</th>
				<td>
					<input type="text" name="id" id="id" class="form-group"
					required="required" style="width: 120px;">
					<button type="button" class="btn btn-danger btn-sm"
					id="btncheck">중복체크</button>
					<span class="idsuccess"></span>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-group"
					required="required" style="width: 120px">
					<input type="password" name="pass2" class="form-group"
					required="required" style="width: 120px;" placeholder="비밀번호확인">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">회원명</th>
				<td>
					<input type="text" name="name" class="form-group"
					required="required" style="width: 120px;" placeholder="이름">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-group"
					required="required" style="width: 200px;" placeholder="핸드폰번호">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">주소</th>
				<td>
					<input type="text" name="addr" class="form-group"
					required="required" style="width: 350px;" placeholder="주소">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">이메일</th>
				<td>
					<input type="text" name="email1" class="form-group"
					required="required" style="width: 120px;">
					<b>@</b>
					<input type="text" name="email2" id="email2" class="form-group"
					required="required" style="width: 120px;">
						<select id="selemail" class="form-group">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="hanmail.com">다음</option>
							<option value="nate.com">네이트</option>
						</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success" style="width: 100px;">회원가입</button>
					<button type="reset" class="btn btn-outline-success" style="width: 100px;">초기화</button>
				</td>
			</tr>
			
	</table>
</form>
</body>
</html>