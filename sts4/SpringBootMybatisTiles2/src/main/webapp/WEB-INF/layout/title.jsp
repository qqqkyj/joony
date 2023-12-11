<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
  #btnlogin,#btnlogout{
     margin-left: 800px;
  }
</style>
<script type="text/javascript">

   $(function(){
	   
	   $("#btnloginok").click(function(){
		   
		   //아이디 비번읽기
		   var id=$("#loginid").val();
		   var pass=$("#loginpass").val();
		   
		  //alert(id+","+pass);
		   var root='${root}';
		  console.log("root"+root);
		   
		   $.ajax({
			   
			   type:"get",
			   url:root+"/member/login",
			   dataType:"json",
			   data:{"id":id,"pass":pass},
			   success:function(res){
				   if(res.result=='fail'){
					   alert("아이디나 비번이 맞지않습니다");
				   }else{
					   location.reload();
				   }
			   }
			   
		   });
	   });
	   
	   //로그아웃
	   $("#btnlogout").click(function(){
		   var root='${root}';  
		   $.ajax({
			   
			   type:"get",
			   url:root+"/member/logout",
			   dataType:"html",
			   success:function(){
				   location.reload();
			   }
		   });
		   
	   });
   });
</script>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<a href="/"><img src="${root }/image/title.png"
style="width: 300px; ">
</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<c:if test="${sessionScope.loginok==null }">
	<button type="button" class="btn btn-success"
onclick="location.href='${root}/login/main'">Login</button>
</c:if>

<c:if test="${sessionScope.loginok!=null }">
     <b>${sessionScope.myid }님이 로그인중....</b>
	<button type="button" class="btn btn-danger"
onclick="location.href='${root}/login/logoutprocess'">Logout</button>
</c:if>


<!--  ajax login-->
<div class="container">
 
 <c:if test="${sessionScope.loginok==null }">
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal"
  id="btnlogin">
    AjaxLogin
  </button>
  </c:if>
  
  <c:if test="${sessionScope.loginok!=null }">
  <button type="button" class="btn btn-danger" 
  id="btnlogout">
    AjaxLogout
  </button>
  </c:if>
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원 로그인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
      <input type="text" class="form-control" id="loginid" placeholder="아이디 입력"><br>
      <input type="password" class="form-control" id="loginpass" placeholder="패스워드입력">
    
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <button type="button" class="btn btn-primary" id="btnloginok" data-bs-dismiss="modal">Login</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>