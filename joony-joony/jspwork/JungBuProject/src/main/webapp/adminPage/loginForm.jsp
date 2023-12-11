<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	
  	form{
  		font-family: 'Noto Serif KR';
  		border:2px solid gray;
  		border-radius: 10px;
  		width: 500px;
  		height:400px;
  		padding: 50px;
  		
  		margin: 0 auto;
  		position: absolute;
  		top: 40%;
  		left: 50%;
    	justify-content: center;
  		transform: translate(-50%, -50%);
  		
  	}
  	
  	div.form-group-btn{
  		margin-right: 50px;
  		text-align: center;
  	}
  	
  	div.title{
  		text-align: center;
  	}
  	
  	div.form-group-radio{
  		margin-left: 50px;
  	}
  	
  	div.title{
  		text-align: center;
  	}
  </style>
</head>
<body>

<div class="box">
	<form class="form-horizontal" action="loginProc.jsp" method="post">
	<div class="title"><h3>사원정보로그인</h3></div><br>
	  <div class="form-group">
	    <label class="control-label col-sm-2">ID:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="id" placeholder="Enter id">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2">Password:</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" name="pass" placeholder="Enter password">
	    </div>
	  </div>
	  <br>
	  <div class="form-group-radio">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div>
	        <label><input type="radio" value="admin" name="radio" checked> 관리자</label>&nbsp;&nbsp;&nbsp;
	        <label><input type="radio" value="user" name="radio"> 사용자</label><br><br>
	      </div>
	    </div>
	  </div>
	  <div class="form-group-btn">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default" style="width: 200px">Login</button>
	    </div>
	  </div>
	</form>

</div>

</body>
</html>