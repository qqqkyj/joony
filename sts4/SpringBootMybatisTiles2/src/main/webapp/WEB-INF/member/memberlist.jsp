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
<script type="text/javascript">
  $(function(){
	  
	  $("#allcheck").click(function(){
		  
		  var chk=$(this).is(":checked");
		  console.log(chk);
		  
		  $(".del").prop("checked",chk);
	  });
	  
	  $("#btnmemberdel").click(function(){
		  
		  var cnt=$(".del:checked").length;
		  //alert(cnt);
		  
		  if(cnt==0){
			  alert("먼저 선택할 사람을 선택해주세요");
			  return;//함수종료
		  }
		  
		  $(".del:checked").each(function(i,element){
			  
			  var num=$(this).attr("num");
			  console.log(num); //선택한  num만 나오나 반드시 확인하기
			  
			  //선택한 체크 삭제
			  $.ajax({
				  
				  type:"get",
				  url:"delete",
				  dataType:"html",
				  data:{"num":num},
				  success:function(){
					  
					  alert("삭제되었습니다");
					  location.reload();
				  }
			  });
			  
		  });
		  
	  });
	  
	  
  });

</script>
</head>
<body>
<div style="margin: 100px 50px; width: 1000px;">
<h5 class="alert alert-info">${totalCount }명의 회원이 있습니다</h5>

<button type="button" class="btn btn-outline-info"
onclick="location.href='form'">회원가입</button>

<br>
<table class="table table-bordered">
	<caption align="top"><b>전체 회원 명단</b></caption>
	<tr class="table-secondary">
		<th style="width: 80px">번호</th>
		<th style="width: 200px">이름</th>
		<th style="width: 120px">아이디</th>
		<th style="width: 170px">핸드폰</th>
		<th style="width: 250px">주소</th>
		<th style="width: 250px">이메일</th>
		<th style="width: 220px">가입일</th>
		<th style="width: 120px">
           <input type="checkbox" id="allcheck">삭제
		</th>	
		
			
	</tr>
	<c:forEach var="dto" items="${list}" varStatus="i">
		<tr>
			<td>${i.count}</td>
			<td><img alt="" src="../membersave/${dto.photo }" style="width: 30px; height: 30px;">&nbsp;&nbsp;
			${dto.name}</td>
			<td>${dto.id}</td>
			<td>${dto.hp}</td>
			<td>${dto.addr}</td>
			<td>${dto.email}</td>
			<td>
			  <fmt:formatDate value="${dto.gaipday }" pattern="yyyy년MM월dd일"/>
			</td>
			<td>				
				<input type="checkbox" num=${dto.num } class="del">			
			</td>			
		</tr>
	</c:forEach>
</table>


<button type="button" class="btn btn-danger" id="btnmemberdel">Delete</button>
</div>
</body>
</html>