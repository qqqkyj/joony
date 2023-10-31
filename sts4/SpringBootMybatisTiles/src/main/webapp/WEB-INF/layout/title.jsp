
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	//ajax_Login
	$("#btnLoginok").click(function(){
		
		var id = $("#Loginid").val();
		var pass = $("#Loginpass").val();
		var cbsave = $("#cbsave").val();
		
		alert(id);
		
		$.ajax({
			type:"get",
			url:"/member/login",
			dataType:"json",
			data:{"id":id,"pass":pass,"cbsave":cbsave},
			success:function(res){
				if(res.result=='fail'){
					alert("아이디 혹은 비밀번호가 일치하지 않습니다.");}
				else
					{location.reload();}
			}
		});
		
	});
	
	//ajax_Logout
	$("#btnLogout").click(function(){
		
		var id = $(this).attr("myid");
		//alert(id);
		
		$.ajax({
			type:"get",
			url:"/member/logout",
			dataType:"html",
			data:{"id":id},
			success:function(res){
				alert("로그아웃 되었습니다.");
				location.href="/";
			}
		})
	});
	
})
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<a href="/"><img alt="" src="${root }/image/맹구.PNG" style="width: 150px;"> 
<b><!-- SpringBoot+Mybatis+Titles -->
	짱구는 못말려 상점
</b></a>
<c:if test="${sessionScope.loginok!=null }">
	<b style="font-size: 1.2em; float:right; ">${sessionScope.myid }님</b>
	<button type="button" onclick="location.href='${root}/login/logoutprocess'" class="btn btn-danger"
style="float: right; margin-right: 100px;">Logout</button>

<!-- ajax로그아웃 -->
<button type="button" class="btn btn-danger" id="btnLogout" myid="${sessionScope.myid}">AjaxLogin</button>


</c:if>
<c:if test="${sessionScope.loginok==null }">
	<button type="button" onclick="location.href='${root}/login/main'" class="btn btn-success"
style="float: right; margin-right: 100px;">Login</button>
	
<!-- ajax로그인 --> 
  <button type="button" class="btn btn-primary btnlogin" data-bs-toggle="modal" data-bs-target="#myModal">AjaxLogin</button>

	<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Login</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <div class="member_login_input">
                <input type="text" id="Loginid" placeholder="아이디" class="form-control">
            </div>

            <div class="member_login_input">
                <input type="password" id="Loginpass" placeholder="비밀번호" class="form-control">
            </div>
            
             <div class="member_login_input">
                <input type="checkbox" id="cbsave">아이디 저장
            </div>
            
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnLoginok">Login</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</c:if>



</body>
</html>