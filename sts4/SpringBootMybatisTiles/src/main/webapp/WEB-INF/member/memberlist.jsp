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
<script type="text/javascript">
	$(function() {
		
		 $("#allcheck").click(function(){
		      var chk=$(this).is(":checked");
		      console.log(chk);
		      
		      $(".del").prop("checked",chk);
		   });
		 
		
		$("#btnmemberdel").click(function() {
			var cnt = $(".del:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 삭제할 회원을 선택해 주세요!");
				return false;
			}
			
			$(".del:checked").each(function(i,element) {
				var num = $(this).attr("num");
				//alert(num);
				
				//선택한 체크 삭제
				$.ajax({
					type:"get",
					url:"delete",
					dataType:"html",
					data:{"num":num},
					success:function(res){
						alert("delete success!");
						location.reload();
					}
					
				});
			});
		});
		
		
	});
</script>
<body>

<h3 class="alert alert-info">${totalCount }명의 회원이 있습니다.</h3>

<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>회원명</th>
			<th>아이디</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>주소</th>
			<th>가입일</th>
			<th>
			<input type="checkbox" id="allcheck">
			강퇴버튼</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>
					${dto.name }
					<img alt="" src="../membersave/${dto.photo }" style="width: 100px; height:100px; ">
				</td>
				<td>${dto.id }</td>
				<td>${dto.hp }</td>
				<td>${dto.email }</td>
				<td>${dto.addr }</td>
				<td>
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
				<td colspan="2" align="center">
					<input type="checkbox" num=${dto.num } class="del">
					<%-- <input type="button" value="강퇴" class="btn btn-outline-danger" onclick="location.href='delete?num=${dto.num}'"> --%>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<button type="button" class="btn btn-outline-danger" id="btnmemberdel">삭제</button>
<button class="btn btn-outline-info" type="button" onclick="location.href='form'">회원가입</button>
</body>
</html>