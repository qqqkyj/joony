<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.script.ScriptContext"%>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("cOzHuKVMK_K9_kRKGF4L", "http://localhost:8080/영화예매최종/login/callback.jsp");
  // 접근 토큰 값 출력
  naver_id_login.oauthParams.access_token;
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  
  var email="";
  var name="";
  var gender="";
  
  function naverSignInCallback() {
     
    email = naver_id_login.getProfileData('email');
    name = naver_id_login.getProfileData('name');
    
    if(naver_id_login.getProfileData('gender')=="F"){
       gender="여자";
    }
    else if(naver_id_login.getProfileData('gender')=="M"){
       gender="남자";
    }
    
    alert(email+","+name+","+gender);
    
    $.ajax({
       type:"post",
       url:"naverLoginAction.jsp",
       data:{"email":email,"name":name,"gender":gender},
       dataType:"html",
       success:function(res){
          alert("Naver Login Success");
           window.opener.location.href = "../index.jsp";
           window.close(); 
            /* window.close(); */
       }
    });
    
  }
  
  
</script>

</body>
</html>