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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<h3>ex3번 예제</h3>
<br>
<button type="button" id="btn3" class="btn btn-info">list3 json데이터 출력하기</button>
<div id="out3"></div>

<script type="text/javascript">
	$("#btn3").click(function(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"list3",
			success:function(data){
				
				var s="";
				
				$.each(data,function(i,item){
					s+="<figure>";
					s+="<img alt='"+item.name+"' src='image/"+item.photo+"' style='width: 100px;'><br>";
					s+="<b><figcaption>";
					s+=item.name;
					s+="</b></figcaption>";
					s+="</figure>";
				});
				$("#out3").append(s);
			}
		});
	});
</script>

</body>
</html>