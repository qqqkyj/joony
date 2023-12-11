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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>게시판 상세페이지</title>
</head>
<body>
<div class="container" style="margin: 100px 100px;">
<table class="table table-bordered">
	<tr>
		<td>
			<b>${dto.subject }</b><br>
			<i class="bi bi-person-circle"></i>
			${dto.writer }
			<small style="float: right; margin-right: 100px; color: gray">작성일:<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;조회수:${dto.readcount }</small>			
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${dto.photo!='no' }">
				<c:forTokens var="p" items="${dto.photo }" delims=",">
					<img alt="" src="../upload/${p}" style="width: 100px; height: 100px; border: 2px solid green; border-radius: 20px;" >
				</c:forTokens>
			</c:if>			
			<br><br>
			<pre>${dto.content }</pre>
		</td>
	</tr>
	
	<!-- 댓글 -->
	<tr>
		<td>
			<div id="answer">
			<c:if test="${acount>0 }">
				<b>댓글: ${acount}</b><br><br>
				<c:forEach var="a" items="${alist }">
					${a.nickname } : ${a.content }
					<small style="float: right; margin-right: 50px; color: gray">
						<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</small>
					&nbsp;
					<i class="bi bi-trash" style="cursor: pointer;" onclick="adelete(${a.idx},${a.pass })"></i>
					
					<script type="text/javascript">
					function adelete(idx,pass) {
						
						var check = prompt("비밀번호를 입력해 주세요.");
						
						if(pass==check){
							$.ajax({
								type:"get",
								data:{"idx":idx},
								dataType:"json",
								url:"adelete",
								success:function(res){
								
									location.reload();
								}
								
							});
						}
							else{
							alert("비밀번호가 일치하지 않습니다!");
						}
						
					}
					</script>
					
					<hr>
				</c:forEach>
			</c:if>
			</div>
			<br>
			<form action="ainsert" method="post" style="width: 600px;">
				<!-- hidden -->
				<input type="hidden" name="num" value="${dto.num }">
				<input type="hidden" name="currentPage" value="${currentPage }">
					<div class="d-inline-flex">
						<b>닉네임: </b>
						<input type="text" name="nickname" class="form-control" style="width: 120px;" required="required">
						<b>비밀번호: </b>
						<input type="password" name="pass" class="form-control" style="width: 120px;" required="required">
					</div>
						<br>
					<div class="d-inline-flex">
						<input type="text" name="content" class="form-control" style="width: 500px;" placeholder="댓글내용을 입력해 주세요.">
						<button type="submit" class="btn btn-outline-info">확인</button>
					</div>
			</form>
		</td>
	</tr>
	
	<tr>
		<td align="center">
			<input type="button" value="글쓰기" onclick="location.href='writeform'" class="btn btn-outline-success">
			<input type="button" value="답글" onclick="location.href='writeform?num=${dto.num}&regroup=${ dto.regroup}&restep=${ dto.restep}&relevel=${dto.relevel }&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="수정" onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="삭제" onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'" class="btn btn-outline-success">
			<input type="button" value="목록" onclick="location.href='list?currentPage=${currentPage}'" class="btn btn-outline-success">
		</td>
	</tr>
</table>
</div>
</body>
</html>