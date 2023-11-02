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
<style type="text/css">
i.bi{
	cursor: pointer;
}
</style>
<script type="text/javascript">
function list() {
	
	var num = $("#num").val();
	
	$.ajax({
		type:"get",
		dataType:"json",
		data:{"num":num},
		url:"/mbanswer/alist",
		success:function(res){
			//alert(res.length);
			$("span.acount").text(res.length);
			
			var s="";
			
			$.each(res,function(i,dto){
				s+="<b style='margin:10px;'>["+dto.name+"]</b>"+dto.content;
				s+="<span class='day' style='float:right;'><small style='color:gray;'>"+dto.writeday+"</small></span>&nbsp;&nbsp;"
				s+="<i class='bi bi-pencil' idx='"+dto.idx+"' id='btnupdateform'></i>&nbsp;";
				s+="<i class='bi bi-trash3' idx='"+dto.idx+"' id='btnanswerdelete'></i>";
				s+="<hr>";
				
			
			})		
			
			$("div.alist").html(s);
		}
	});
	
}

$(function() {
	
	list();
	
	//댓글 insert
	$("#btnansweradd").click(function(){
		
		/*myid="${sessionScope.myid}";
		loginok="${sessionScope.loginok}";
		num="${dto.num}";*/
		
		var num = $("#num").val();
		var content = $("#content").val();
		
		//alert(num+","+content);
		
		$.ajax({
			type:"post",
			dataType:"html",
			data:{"num":num,"content":content},
			url:"/mbanswer/ainsert",
			success:function(){
				//성공시 list 재호출
				list();
				
				//입력값 초기화
				$("#content").val("");

			}
		});
		
	});
	
	
	//댓글 수정창 띄우기
	
	$(document).on("click", "#btnupdateform", function() {
			
		var idx = $(this).attr("idx");
		
		$.ajax({
			type:"get",
			dataType:"json",
			data:{"idx":idx},
			url:"/mbanswer/aupdateform",
			success:function(dto){
				
				var s="";
				s+="<div class='d-inline-flex'>";
				s+="<input type='text' class='form-control' style='width: 500px;' id='content' value='"+dto.content+"'>&nbsp;"
				s+="<button type='button' class='btn btn-info' id='btnanswerupdate'>수정</button>";
				s+="</div>"
				
			}
			
			$("div.alist").append(s);
		});
		
	});

	//댓글 수정

	//댓글삭제
	$(document).on("click", "#btnanswerdelete", function() {
		
		var idx = $(this).attr("idx");
		//alert(idx);
		
		var ans = confirm("정말 삭제하시겠습니까?");
		if(ans){
		    
			$.ajax({
				type:"get",
				dataType:"html",
				data:{"idx":idx},
				url:"/mbanswer/adelete",
				success:function(){
					//성공시 list 재호출
					alert("삭제 되었습니다.");
					list();			
				}
			});
			
		}
		
		
	});


	});
</script>
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
					<b>조회:${dto.readcount }</b>&nbsp;&nbsp;
					<b>댓글: <span class="acount"></span></b>
				</td>
			</tr>
			<!-- 댓글(ajax방식) -->
			<tr>
				<td>
					<div class="alist"></div>
				
					<input type="hidden" id="num" value="${dto.num }">
					
					<c:if test="${sessionScope.loginok!=null }">
						<div class="aform">
							<div class="d-inline-flex">
								<input type="text" class="form-control" style="width: 500px;" placeholder="댓글을 입력하세요"
								id="content">&nbsp;
								<button type="button" class="btn btn-info" id="btnansweradd">등록</button>
							</div>
						</div>
					</c:if>
				</td>
			</tr>
			
			<!-- 버튼 추가 -->
			<tr>
				<td align="center">
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-outline-info" onclick="location.href='form'">글쓰기</button>
						<c:if test="${sessionScope.myid==dto.myid }">
							<button type="button" class="btn btn-outline-info" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
						<button type="button" class="btn btn-outline-info" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
						</c:if>
					</c:if>					
					<button type="button" class="btn btn-outline-info" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>