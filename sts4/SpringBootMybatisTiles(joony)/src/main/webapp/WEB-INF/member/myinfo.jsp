<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		//사진수정
		$(".btnnewphoto").click(function(){
			
			$("#newphoto").trigger("click");
		});
		
		$("#newphoto").change(function(){
			var num = $(this).attr("num");
			//alert(num);
			
			var form = new FormData();
			form.append("photo",$(this)[0].files[0]);//선택한 하나만 추가
			form.append("num",num);
			
			console.dir(form);
			
			$.ajax({
				type:"post",
				dataType:"html",
				url:"updatephoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(){
					
					location.href="/";
					//location.reload();
				}
			})
			
		});
		
		//탈퇴
		$(".btndelete").click(function(){
			var num=$(this).attr("num");
			//alert(num);
			
			var ans = confirm("정말 탈퇴하시겠습니까?");
			
			if(ans){
				$.ajax({
					type:"get",
					dataType:"html",
					url:"deleteme",
					data:{"num":num},
					success:function(){
						alert("탈퇴 되셨습니다.");
						location.reload();
					}
				});
			}
			
		});
		
		//update
		$("#btnUpdate").click(function(){
			
			var name = $("#name").val();
			var email = $("#email").val();
			var hp = $("#hp").val();
			var addr = $("#addr").val();
			var num = $("#num").val();
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"/member/update",
				data:{"num":num,"name":name,"email":email,"hp":hp,"addr":addr},
				success:function(res){
					alert("회원정보가 수정되었습니다.");
					location.reload();
				}
			})
			
		});
		
	});
</script>
</head>
<body>
<div class="container">
	<table class="table table-bordered"> 
		<c:forEach var="dto" items="${list }">
		<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id}">
			<tr>
				<td rowspan="6" align="center" valign="top">
					<img alt="" src="../membersave/${dto.photo }" style="width: 200px; height: 200px;">
					<br>
					<input type="file" style="display: none;" num="${dto.num}" id="newphoto"><!-- 사진 수정시 호출 -->
					<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
				</td>
				<td>
					${dto.name }
				</td>
			</tr>
			
			<tr>
				<td>
					${dto.id }
				</td>
			</tr>
			<tr>
				<td>
					${dto.hp }
				</td>
			</tr>
			<tr>
				<td>
					${dto.addr }
				</td>
			</tr>
			<tr>
				<td>
					${dto.email }
				</td>
			</tr>
			<tr>
				<td>
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
					<%-- <input type="button" value="수정" class="btn btn-outline-warning" onclick="location.href='updateform?num=${dto.num}'"> --%>	
					<button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#myModal">Ajax수정</button>
					<input type="button" value="삭제" class="btn btn-outline-danger btndelete" num="${dto.num}">	
				</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</div>


<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">개인정보수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
					<div class="container">
						<table class="table table-bordered">
							<c:forEach var="dto" items="${list }">
								<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id}">						
									<tr>
										<td>
											<input type="hidden" id="num" value="${dto.num }"> 
											<input type="text" name="id" class="form-control" readonly="readonly" value="${dto.id }">
										</td>
									</tr>
									<tr>
										<td><input type="text" id="name" class="form-control"
											placeholder="이름" required="required" value="${dto.name }"
											style="width: 150px;"></td>
									</tr>

									<tr>
										<td><input type="text" id="email" class="form-control"
											placeholder="이메일" required="required" value="${dto.email }">
										</td>
									</tr>

									<tr>
										<td colspan="2"><input type="text" id="addr"
											class="form-control" placeholder="주소" required="required"
											value="${dto.addr }"></td>
									</tr>

									<tr>
										<td colspan="2"><input type="text" id="hp"
											class="form-control" placeholder="핸드폰번호" required="required"
											value="${dto.hp }"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnUpdate">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>