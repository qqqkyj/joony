<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<td>
					<h4><b>${dto.subject }</b>
						<span style="font-size: 14pt; color: gray; float: right;">
							<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
					</h4>
					<span>작성자: ${dto.name }(${dto.myid })</span>
					
					<c:if test="${dto.uploadfile!='no' }">
						<span style="float: right;"><b>${dto.uploadfile }</b>&nbsp;
						<a href="download?clip=${dto.uploadfile}"><i class="bi bi-cloud-download"></i></a></span>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- 이미지인 경우에만 이미지 출력 -->
					<c:if test="${bupload==true }">
						<img alt="" src="../savefile/${dto.uploadfile }" style="width:200px;">
					</c:if>					
					<br><br>
					<pre>
						${dto.content }
					</pre>
					<br>
					<b>조회:${dto.readcount }</b>
				</td>
			</tr>
			
			<!-- 버튼 추가 -->
			<tr>
				<td align="center">
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-info" onclick="location.href='form'">글쓰기</button>
						<c:if test="${sessionScope.myid==dto.myid }">
							<button type="button" class="btn btn-outline-info" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-outline-info" onclick="location.href='delete?num=${dto.num}'">삭제</button>
						</c:if>
					</c:if>					
					<button type="button" class="btn btn-outline-info" onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>