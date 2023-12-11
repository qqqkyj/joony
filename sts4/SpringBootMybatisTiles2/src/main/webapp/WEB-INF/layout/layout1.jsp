<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
  div.layout div{border: 0px solid black;}
  
  div.layout div.title{
    position: absolute;
    top: 10px;
    left: 750px;
    height: 100px;
  }
  
   div.layout div.menu{
   		position: absolute;
	    top: 150px;
	    left: 450px;
	    height: 100px;
	    
	    
   }
   
   div.layout div.info{
   		position: absolute;
	    top: 300px;
	    left: 100px;
	    height: 350px;
	    font-family: 'Dongle';
	    font-size: 25px;
	    width: 250px;
	    border: 5px solid purple;
	    border-radius: 30px;
	    padding: 30px 30px
	    
   }
   
   div.layout div.main{
   		position: absolute;
	    top: 250px;
	    left: 450px;
	    height: 800px;
	    font-family: 'Noto Serif KR';
	    font-size: 17px;
	    width: 1200px;
	    
   }
</style>
</head>
<body>
<div class="layout">
  <div class="title">
    <tiles:insertAttribute name="title"/>
  </div>
  <div class="menu">
    <tiles:insertAttribute name="menu"/>
  </div>
  <div class="info">
    <tiles:insertAttribute name="info"/>
  </div>
  <div class="main">
    <tiles:insertAttribute name="main"/>
  </div>
</div>
</body>
</html>