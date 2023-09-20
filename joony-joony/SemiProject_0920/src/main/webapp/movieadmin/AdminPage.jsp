<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
img{
width: 200px;
height: 200px;
margin-top: 50px; 
}
b{
   font-family: "Dongle";
   font-size: 30pt;
}

div{
margin-left: 20%;
margin-top: 10%;
background-color: black;
}
h2{
margin-left: 700px;
margin-top:80px;
font-family: Gaegu;
font-size:40pt;
color:silver;
font-weight: bold;
}

body{
background-color: black;
}

table{
background-color: black;
}
</style>
</head>
<body>
<h2>관리자페이지</h2>
<div>
<table>
<tr>
<td align="center">
<div style="width: 300px; height: 320px; border: 3px solid gray; cursor: pointer; background-color: white;" onclick="location.href='../member/memberlist.jsp'" align="center">
<img src="../image/memberedit.png">
<br>
<b>회원관리</b>
</div>
</td>
<td align="center">
<div style="width: 300px; height: 320px; border: 3px solid gray; cursor: pointer; background-color: white;" onclick="location.href='listAdmin.jsp'" align="center">
<img src="../image/movieedit.png">
<br>
<b>영화관리</b></div>
</td>
<td>
<div style="width: 300px; height: 320px; border: 3px solid gray; cursor: pointer; background-color: white;" onclick="location.href='../shop/adminlist.jsp'" align="center">
<img src="../image/shopedit.png">
<br>
<b>매점관리</b></div>
</td>
</tr>
</table>
</div>
</body>
</html>