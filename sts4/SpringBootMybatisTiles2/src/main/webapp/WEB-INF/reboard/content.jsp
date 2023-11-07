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
	$(function() {
		
		$("#btnthumbs").click(function(){
			
			var num=$(this).attr("num");
			var thum=$(this).attr('class');
			//alert(thum);
			
			if(thum=='bi bi-hand-thumbs-up'){
				
				$(this).attr("class", "bi bi-hand-thumbs-up-fill");
				
				$.ajax({
					type:"get",
					data:{"num":num},
					dataType:"json",
					url:"/reboard/likes",
					success:function(res){
						$("#likes").text(res);
						
						
					}
				}); 
				
			}else{
				
				$(this).attr("class","bi bi-hand-thumbs-up");
				
				$.ajax({
					type:"get",
					data:{"num":num},
					dataType:"json",
					url:"/reboard/hate",
					success:function(res){
						$("#likes").text(res);
						
						
					}
				}); 
			}
			//alert(num);
			
			
		});
		
	});
</script>
</head>
<body>

<div class="container">
	<table class="table table-bordered">
		<tr>	
			<td>
				<h2>${dto.subject }</h2>
				<b>${dto.name }(${dto.id })</b><br>
				<span style="color: gray; font-size: 0.8em;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회:${dto.readcount }
				</span>
			</td>
		</tr>
		
		<tr>
			<td>
			 <pre>
			 	${dto.content }
			 </pre><br><br>
			 <c:if test="${dto.photo!='no' }">
			 	<c:forEach var="photo" items="${dto.photo }">
			 		<img alt="" src="../rephoto/${photo }" width="100" class="img-thumbnail">
			 	</c:forEach>
			 </c:if>
			 <br><br>
			 <div class="likes">
			 	<i class="bi bi-hand-thumbs-up" id="btnthumbs" num="${dto.num }" style="font-size: 1.5em; cursor: pointer;"></i>&nbsp;&nbsp;
			 	좋아요<b id="likes">${dto.likes }</b>
			 </div>
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<button type="button" class="btn btn-outline-success" onclick="location.href='form?num=${dto.num}&currentPage=${currentPage }&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }'">답글</button>
				
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id}">
					<button type="button" class="btn btn-outline-success" onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href=''">삭제</button>
				</c:if>
				
				<button type="button" class="btn btn-outline-success" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='form'">글쓰기</button>
			</td>
		</tr>
		
	</table>
</div>

</body>
</html>