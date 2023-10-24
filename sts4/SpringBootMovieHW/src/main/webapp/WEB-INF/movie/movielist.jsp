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
<body style="background-color: black">

<div class="container" style="margin-top: 50px; background-color: black; padding: 50px;">
		<c:if test="${total==0 }">
			<b style="color: white">영화정보가 존재하지 않습니다.</b><br>
			<button class="btn btn-success" onclick="location.href='writeform'">글쓰기</button>
		</c:if>
		<c:if test="${total>0 }">
			<b style="color: white;">&nbsp;총 ${total }개의 영화정보가 존재합니다.</b>&nbsp;
			<button class="btn btn-success" onclick="location.href='writeform'">글쓰기</button>
			
			<div class="container" style="margin-top: 10px;">
				<table class="table table-bordered">					
						<tr>
							<th>번호</th>
							<th>영화제목</th>
							<th>감독명</th>
							<th>개봉일자</th>
							<!-- <th>편집</th> -->
						</tr>
					<c:forEach var="m" items="${list }" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>
								<a href="detail?mv_num=${m.mv_num }"><img alt="" src="../moviephoto/${m.mv_poster }" style="width: 100px;"> </a>
								${m.mv_title }
							</td>
							<td>${m.mv_director }</td>
							<td>${m.mv_opendate }</td>
							<%-- <td colspan="2">
								<button class="btn btn-outline-warning" onclick="location.href='update?mv_num=${m.mv_num}'">수정</button>
								<button class="btn btn-outline-danger" onclick="location.href='delete?mv_num=${m.mv_num}'">삭제</button>
								<button class="btn btn-outline-info" onclick="location.href='list'">목록</button>
								<button class="btn btn-outline-success" onclick="location.href='writeform'">글쓰기</button>
							</td> --%>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>

</div>



</body>
</html>