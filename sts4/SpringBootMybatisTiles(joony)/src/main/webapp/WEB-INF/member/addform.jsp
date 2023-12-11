<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#showimg{
		border: 1px solid gray;
		width: 130px;
		height: 160px;
	}
</style>
<script type="text/javascript">
	$(function() {
		
		$("#btnphoto").click(function() {
			$("#myphoto").trigger("click");
		});
		
		 //사진 미리보기
        $("#myphoto").on("change", function(event) {

            var file = event.target.files[0];

            var reader = new FileReader();
            reader.onload = function(e) {

                $("#showimg").attr("src", e.target.result);
            }

            reader.readAsDataURL(file);
        });
		 
		 //아이디 입력시 아이디 체크
		 $("#btnidcheck").click(function(){
			
			 var id = $("#id").val();
			 
			 alert(id);
			 
			 $.ajax({
				data:{"id":id},
				type:"get",
				dataType:"json",
				url:"idcheck",
				success:function(res){
					if(res.count == 0){
						$(".idsuccess").html("success");
						$(".idsuccess").css('color','green');
					}else{
						$(".idsuccess").html("fail");
						$(".idsuccess").css("color","red");
						$("#id").val("");
					}
				}
			 }); 
			 
		 });
		 
		 $("#pass").keyup(function(){
			 if($(this).val().length>=4){
				 $(this).next().focus();
			 }
		 });
		 
		 
		 
		 //2번째 비밀번호 입력시 체크
		 $("#pass2").keyup(function(){
			 
			var p1 = $("#pass").val(); 
			var p2 = $(this).val();
			
			if(p1!=""||p2!=""){
				if(p1==p2){
					$("span.passsuccess").text("ok");
					$("span.passsuccess").css("color","green");
				}else{
					$("span.passsuccess").text("");
				}
			}
		
		 });
		
	});
	
	function check(){
		
		//사진
		if($("#myphoto").val()==""){
			alert("사진을 넣어주세요.");
			return false;
		}
		
		//id
		if($("span.idsuccess").text()!="success"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
		//pass
		if($("span.passsuccess").text()!="ok"){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}

</script>
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top">
					<b>회원가입</b>
				</caption>
					<tr>
					<td rowspan="6" align="center">
						<div class="d-inline-flex">
							<input type="file" id="myphoto" name="myphoto"
								style="display: none;">
							<!-- 미리보기 처리를 위해 name써줌 -->
							<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
						</div>
						<br> 
						<img id="showimg">
					</td>

					<td>
						<div class="d-inline-flex">
							<input type="text" placeholder="아이디입력" name="id" id="id" class="form-control" style="width: 120px;">
							<button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>&nbsp;&nbsp;
							<span class="idsuccess" style="width: 60px;"></span>
						</div>
						</td>
					</tr>
					
					<tr>
						<td>
						<div class="d-inline-flex">
							<input type="password" style="width: 120px;" name="pass" class="form-control" id="pass" placeholder="숫자4자리"
							maxlength="4" required="required">
							<input type="password" style="width: 120px;" class="form-control" id="pass2" placeholder="숫자4자리"
							maxlength="4" required="required">
							<span class="passsuccess" style="width: 60px; color: green;"></span>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" name="name" class="form-control" placeholder="이름" required="required"
							style="width: 150px;">
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" name="email" class="form-control" placeholder="이메일" required="required">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="text" name="addr" class="form-control" placeholder="주소" required="required">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="text" name="hp" class="form-control" placeholder="핸드폰번호" required="required">
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원가입" class="btn btn-info" style="width: 120px;">
							<input type="button" value="로그인" class="btn btn-info" style="width: 120px;" onclick="location.href='/login/main'">
						</td>
					</tr>
			</table>
		</form>
	</div>
		
</body>
</html>